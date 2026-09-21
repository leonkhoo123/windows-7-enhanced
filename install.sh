#!/usr/bin/env bash
# ==============================================================================
# Script Name: install.sh
# Description: Installs the "Windows 7 Enhanced" theme pack for the current
#              user.  The pack contains three KDE components:
#
#                icons/windows-7-enhanced        -> <icons>
#                color-schemes/*.colors          -> <color-schemes>
#                look-and-feel/windows-7-enhanced -> <plasma/look-and-feel>
#
#              All destinations are resolved from the environment
#              (XDG_DATA_HOME, falling back to $HOME/.local/share), so nothing
#              is hardcoded to a specific user.
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

THEME_ID="windows-7-enhanced"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

ICONS_BASE="${DATA_HOME}/icons"
COLOR_BASE="${DATA_HOME}/color-schemes"
LNF_BASE="${DATA_HOME}/plasma/look-and-feel"

DEST_ICONS="${ICONS_BASE}/${THEME_ID}"
DEST_COLORS="${COLOR_BASE}"
DEST_LNF="${LNF_BASE}/${THEME_ID}"

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

Destination root: \${XDG_DATA_HOME:-\$HOME/.local/share}
EOF
}

# Copy a directory tree, preserving symlinks and file modes.
copy_tree() {
    local src="$1" dst="$2"
    [ -d "$src" ] || die "Source directory not found: $src"
    mkdir -p -- "$dst"
    tar -C "$src" -cf - . | tar -C "$dst" -xf -
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
        info "Applying look-and-feel '${THEME_ID}' ..."
        plasma-apply-lookandfeel -a "${THEME_ID}" || warn "Could not apply look-and-feel automatically."
    elif command -v lookandfeeltool >/dev/null 2>&1; then
        info "Applying look-and-feel '${THEME_ID}' ..."
        lookandfeeltool -a "${THEME_ID}" || warn "Could not apply look-and-feel automatically."
    else
        warn "No plasma-apply-lookandfeel/lookandfeeltool found; apply it from System Settings."
    fi
}

# -------------------------------------------------------------- install/remove

install_pack() {
    [ -f "${SCRIPT_DIR}/look-and-feel/${THEME_ID}/metadata.json" ] \
        || die "Run this script from the root of the windows-7-enhanced repo."

    info "Source      : ${SCRIPT_DIR}"
    info "Destination : ${DATA_HOME}"

    info "Installing icon theme  -> ${DEST_ICONS}"
    rm -rf -- "${DEST_ICONS}"
    copy_tree "${SCRIPT_DIR}/icons/${THEME_ID}" "${DEST_ICONS}"

    info "Installing color scheme -> ${DEST_COLORS}"
    mkdir -p -- "${DEST_COLORS}"
    cp -f "${SCRIPT_DIR}"/color-schemes/*.colors "${DEST_COLORS}/"

    info "Installing look-and-feel -> ${DEST_LNF}"
    rm -rf -- "${DEST_LNF}"
    copy_tree "${SCRIPT_DIR}/look-and-feel/${THEME_ID}" "${DEST_LNF}"

    refresh_caches

    echo
    info "Installed successfully."
    echo "    Icons        : ${DEST_ICONS}"
    echo "    Color scheme : ${DEST_COLORS}/Windows7Enhanced.colors"
    echo "    Look-and-feel: ${DEST_LNF}"
    echo "    Select it in : System Settings -> Appearance -> Global Theme"
}

uninstall_pack() {
    local removed=0
    for path in "${DEST_ICONS}" "${DEST_LNF}"; do
        if [ -e "${path}" ]; then
            info "Removing ${path}"
            rm -rf -- "${path}"
            removed=1
        fi
    done
    for f in "${DEST_COLORS}"/Windows7Enhanced.colors; do
        [ -e "$f" ] && { info "Removing $f"; rm -f -- "$f"; removed=1; }
    done
    [ "$removed" -eq 1 ] || warn "Nothing to remove; the pack is not installed."
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
