#!/usr/bin/env bash
# ==============================================================================
# Script Name: install.sh
# Description: Installs the "Windows 7 Enhanced" theme pack for the current
#              user.  The pack contains the project's own components plus the
#              bundled third-party themes it depends on:
#
#                icons/windows-7-enhanced              -> <icons>
#                color-schemes/*.colors                -> <color-schemes>
#                look-and-feel/windows-7-enhanced      -> <plasma/look-and-feel>
#                kvantum/windows-7-enhanced            -> <config>/Kvantum
#
#                third-party/exposeair/...             -> exposeair plasma theme,
#                                                         Aurorae decoration,
#                                                         color scheme, Kvantum theme
#                third-party/windows7splash/...        -> windows7splash
#
#              All destinations are resolved from the environment
#              (XDG_DATA_HOME / XDG_CONFIG_HOME, falling back to
#              $HOME/.local/share and $HOME/.config), so nothing is hardcoded
#              to a specific user.
#
# Theme       : Windows 7 Enhanced
# Original    : "Plasma SVG Win7 Theme" by Blackcrack (Blackysgate.de)
# Enhanced by : Leon Khoo
#
# Usage:
#   ./install.sh              install / update the whole pack
#   ./install.sh --apply      install, then apply the look-and-feel
#   ./install.sh --uninstall  remove the installed pack
#   ./install.sh --help
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# project components
DEST_ICONS="${DATA_HOME}/icons/windows-7-enhanced"
DEST_COLORS="${DATA_HOME}/color-schemes"
DEST_LNF="${DATA_HOME}/plasma/look-and-feel/windows-7-enhanced"
DEST_KVANTUM_WIN7="${CONFIG_HOME}/Kvantum/windows-7-enhanced"

# bundled third-party components
DEST_DESKTOPTHEME="${DATA_HOME}/plasma/desktoptheme/exposeair"
DEST_AURORAE="${DATA_HOME}/aurorae/themes/exposeair"
DEST_KVANTUM_EXPOSE="${CONFIG_HOME}/Kvantum/ExposeAir"
DEST_SPLASH="${DATA_HOME}/plasma/look-and-feel/windows7splash"

# ------------------------------------------------------------------ helpers ---

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarning:\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

usage() {
    cat <<EOF
Installs the "Windows 7 Enhanced" theme pack for the current user.

Usage:
  $(basename "${BASH_SOURCE[0]}")              install / update the pack
  $(basename "${BASH_SOURCE[0]}") --apply      install, then apply the look-and-feel
  $(basename "${BASH_SOURCE[0]}") --uninstall  remove the installed pack
  $(basename "${BASH_SOURCE[0]}") --help       show this help

Destination root: \${XDG_DATA_HOME:-\$HOME/.local/share} and
                  \${XDG_CONFIG_HOME:-\$HOME/.config}
EOF
}

# Copy a directory tree, preserving symlinks and file modes.
copy_tree() {
    local src="$1" dst="$2"
    [ -d "$src" ] || die "Source directory not found: $src"
    rm -rf -- "$dst"
    mkdir -p -- "$dst"
    tar -C "$src" -cf - . | tar -C "$dst" -xf -
}

remove_path() {
    [ -e "$1" ] && { info "Removing $1"; rm -rf -- "$1"; }
}

refresh_caches() {
    [ -d "${DEST_ICONS}" ] && command -v gtk-update-icon-cache >/dev/null 2>&1 \
        && gtk-update-icon-cache -q -t -f "${DEST_ICONS}" 2>/dev/null || true
    command -v xdg-icon-resource >/dev/null 2>&1 && xdg-icon-resource forceupdate 2>/dev/null || true
    if command -v kbuildsycoca6 >/dev/null 2>&1; then
        kbuildsycoca6 --noincremental >/dev/null 2>&1 || true
    elif command -v kbuildsycoca5 >/dev/null 2>&1; then
        kbuildsycoca5 --noincremental >/dev/null 2>&1 || true
    fi
}

apply_look_and_feel() {
    if command -v plasma-apply-lookandfeel >/dev/null 2>&1; then
        info "Applying look-and-feel 'windows-7-enhanced' ..."
        plasma-apply-lookandfeel -a windows-7-enhanced || warn "Could not apply look-and-feel automatically."
    elif command -v lookandfeeltool >/dev/null 2>&1; then
        info "Applying look-and-feel 'windows-7-enhanced' ..."
        lookandfeeltool -a windows-7-enhanced || warn "Could not apply look-and-feel automatically."
    else
        warn "No plasma-apply-lookandfeel/lookandfeeltool found; apply it from System Settings."
    fi
}

# -------------------------------------------------------------- install/remove

install_pack() {
    [ -f "${SCRIPT_DIR}/look-and-feel/windows-7-enhanced/metadata.json" ] \
        || die "Run this script from the root of the windows-7-enhanced repo."

    info "Source      : ${SCRIPT_DIR}"
    info "Destination : ${DATA_HOME} (data) + ${CONFIG_HOME} (config)"

    # --- project components ---
    info "Installing icon theme   -> ${DEST_ICONS}"
    copy_tree "${SCRIPT_DIR}/icons/windows-7-enhanced" "${DEST_ICONS}"

    info "Installing color scheme -> ${DEST_COLORS}"
    mkdir -p -- "${DEST_COLORS}"
    cp -f "${SCRIPT_DIR}"/color-schemes/*.colors "${DEST_COLORS}/"

    info "Installing look-and-feel -> ${DEST_LNF}"
    copy_tree "${SCRIPT_DIR}/look-and-feel/windows-7-enhanced" "${DEST_LNF}"

    info "Installing Kvantum theme -> ${DEST_KVANTUM_WIN7}"
    mkdir -p -- "${CONFIG_HOME}/Kvantum"
    copy_tree "${SCRIPT_DIR}/kvantum/windows-7-enhanced" "${DEST_KVANTUM_WIN7}"

    # --- bundled third-party components (GPL, see third-party/NOTICE.md) ---
    info "Installing ExposeAir Plasma theme -> ${DEST_DESKTOPTHEME}"
    copy_tree "${SCRIPT_DIR}/third-party/exposeair/plasma/desktoptheme/exposeair" "${DEST_DESKTOPTHEME}"

    info "Installing ExposeAir Aurorae decoration -> ${DEST_AURORAE}"
    copy_tree "${SCRIPT_DIR}/third-party/exposeair/aurorae/themes/exposeair" "${DEST_AURORAE}"

    info "Installing ExposeAir color scheme -> ${DEST_COLORS}/ExposeAir.colors"
    cp -f "${SCRIPT_DIR}/third-party/exposeair/color-schemes/ExposeAir.colors" "${DEST_COLORS}/"

    info "Installing ExposeAir Kvantum theme -> ${DEST_KVANTUM_EXPOSE}"
    copy_tree "${SCRIPT_DIR}/third-party/exposeair/kvantum/ExposeAir" "${DEST_KVANTUM_EXPOSE}"

    info "Installing Windows 7 splash -> ${DEST_SPLASH}"
    copy_tree "${SCRIPT_DIR}/third-party/windows7splash/plasma/look-and-feel/windows7splash" "${DEST_SPLASH}"

    refresh_caches

    echo
    info "Installed successfully."
    echo "    Then select it in: System Settings -> Appearance -> Global Theme"
    echo "    -> Windows 7 Enhanced"
}

uninstall_pack() {
    for path in \
        "${DEST_ICONS}" \
        "${DEST_LNF}" \
        "${DEST_SPLASH}" \
        "${DEST_DESKTOPTHEME}" \
        "${DEST_AURORAE}" \
        "${DEST_KVANTUM_EXPOSE}" \
        "${DEST_KVANTUM_WIN7}"; do
        remove_path "$path"
    done
    remove_path "${DEST_COLORS}/ExposeAir.colors"
    remove_path "${DEST_COLORS}/Windows7Enhanced.colors"
    refresh_caches
    info "Uninstalled."
}

main() {
    case "${1:-}" in
        --uninstall|-u) uninstall_pack ;;
        --apply|-a)     install_pack; apply_look_and_feel ;;
        --help|-h)      usage ;;
        "")             install_pack ;;
        *)              die "Unknown option: $1 (use --help)" ;;
    esac
}

main "$@"
