#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# ==============================================================================
# Script Name: install.sh
# Description: Installs the "Windows 7 Enhanced" Plasma theme pack (all GPL)
#              for the current user:
#
#                color-schemes/*.colors              -> <color-schemes>
#                look-and-feel/windows-7-enhanced    -> <plasma/look-and-feel>
#                look-and-feel/windows-7-enhanced-splash
#                                                    -> <plasma/look-and-feel>
#                plasma/desktoptheme/windows-7-enhanced
#                                                    -> <plasma/desktoptheme>
#                aurorae/themes/windows-7-enhanced   -> <aurorae/themes>
#                kvantum/windows-7-enhanced          -> <config>/Kvantum
#
#              The Windows 7 icon theme is a SEPARATE package (CC BY-NC-SA)
#              and is not installed here. Get it from the
#              "windows-7-enhanced-icons" repo if you want the icons too.
#
#              All destinations are resolved from the environment
#              (XDG_DATA_HOME / XDG_CONFIG_HOME, falling back to
#              $HOME/.local/share and $HOME/.config), so nothing is hardcoded
#              to a specific user.
#
# Theme       : Windows 7 Enhanced (Plasma components)
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

DEST_COLORS="${DATA_HOME}/color-schemes"
DEST_LNF="${DATA_HOME}/plasma/look-and-feel/windows-7-enhanced"
DEST_SPLASH="${DATA_HOME}/plasma/look-and-feel/windows-7-enhanced-splash"
DEST_DESKTOPTHEME="${DATA_HOME}/plasma/desktoptheme/windows-7-enhanced"
DEST_AURORAE="${DATA_HOME}/aurorae/themes/windows-7-enhanced"
DEST_KVANTUM="${CONFIG_HOME}/Kvantum/windows-7-enhanced"

# ------------------------------------------------------------------ helpers ---

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarning:\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

usage() {
    cat <<EOF
Installs the "Windows 7 Enhanced" Plasma theme pack for the current user.

Usage:
  $(basename "${BASH_SOURCE[0]}")              install / update the pack
  $(basename "${BASH_SOURCE[0]}") --apply      install, then apply the look-and-feel
  $(basename "${BASH_SOURCE[0]}") --uninstall  remove the installed pack
  $(basename "${BASH_SOURCE[0]}") --help       show this help

Note: the icon theme is a separate package (windows-7-enhanced-icons).

Destination root: \${XDG_DATA_HOME:-\$HOME/.local/share} and
                  \${XDG_CONFIG_HOME:-\$HOME/.config}
EOF
}

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

    info "Installing color schemes  -> ${DEST_COLORS}"
    mkdir -p -- "${DEST_COLORS}"
    cp -f "${SCRIPT_DIR}"/color-schemes/*.colors "${DEST_COLORS}/"

    info "Installing look-and-feel  -> ${DEST_LNF}"
    copy_tree "${SCRIPT_DIR}/look-and-feel/windows-7-enhanced" "${DEST_LNF}"

    info "Installing splash         -> ${DEST_SPLASH}"
    copy_tree "${SCRIPT_DIR}/look-and-feel/windows-7-enhanced-splash" "${DEST_SPLASH}"

    info "Installing Plasma theme   -> ${DEST_DESKTOPTHEME}"
    copy_tree "${SCRIPT_DIR}/plasma/desktoptheme/windows-7-enhanced" "${DEST_DESKTOPTHEME}"

    info "Installing window decor.  -> ${DEST_AURORAE}"
    copy_tree "${SCRIPT_DIR}/aurorae/themes/windows-7-enhanced" "${DEST_AURORAE}"

    info "Installing Kvantum theme  -> ${DEST_KVANTUM}"
    mkdir -p -- "${CONFIG_HOME}/Kvantum"
    copy_tree "${SCRIPT_DIR}/kvantum/windows-7-enhanced" "${DEST_KVANTUM}"

    refresh_caches

    echo
    info "Installed successfully."
    echo "    Then select it in: System Settings -> Appearance -> Global Theme"
    echo "    -> Windows 7 Enhanced"
    echo "    For the icons, also install the separate 'windows-7-enhanced-icons' pack."
}

uninstall_pack() {
    for path in \
        "${DEST_LNF}" \
        "${DEST_SPLASH}" \
        "${DEST_DESKTOPTHEME}" \
        "${DEST_AURORAE}" \
        "${DEST_KVANTUM}"; do
        remove_path "$path"
    done
    remove_path "${DEST_COLORS}/Windows7Enhanced.colors"
    remove_path "${DEST_COLORS}/Windows7EnhancedAero.colors"
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
