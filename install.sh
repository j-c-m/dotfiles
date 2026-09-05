#!/usr/bin/env bash
# Link this repo into $HOME. Never extracts a tarball into $HOME.
#
# Omarchy: only files that do not fight Hyprland/theme/shell ownership.
# Elsewhere: shells, terminals, nvim, tmux, git config as well.
# macOS also gets yabai/skhd.
#
# Usage: ./install.sh [--dry-run] [--force]

set -euo pipefail

DOTFILES=$(cd "$(dirname "$0")" && pwd)
HOME=${HOME:?}

dry_run=0
force=0
conflicts=0

while [[ $# -gt 0 ]]; do
    case "$1" in
        -n|--dry-run) dry_run=1 ;;
        --force) force=1 ;;
        -h|--help)
            echo "Usage: $0 [--dry-run] [--force]"
            exit 0
            ;;
        *)
            echo "unknown argument: $1" >&2
            exit 1
            ;;
    esac
    shift
done

is_omarchy() {
    [[ -d /usr/share/omarchy ]] || [[ -n ${OMARCHY_PATH-} ]]
}

is_darwin() {
    [[ $(uname -s) == Darwin ]]
}

# Shared: personal files Omarchy does not own.
COMMON=(
    .perltidyrc
    .vimrc
    .vim
    .terminfo
    .config/git/ignore
    .config/mpv
    .config/starship.toml
    .sh/bc.sh
    .sh/pager.sh
)

# Non-Omarchy Unix: take over the login shell and editors.
UNIX=(
    .bashrc
    .bash
    .bash_profile
    .profile
    .zshrc
    .zprofile
    .zshenv
    .zsh
    .tmux.conf
    .screenrc
    .config/git/config
    .config/nvim
    .config/alacritty
    .config/ghostty
    .config/kitty
    .sh/00-colorterm.sh
    .sh/00-telemetry.sh
    .sh/00-umask.sh
    .sh/01-term.sh
    .sh/dircolors.256dark
    .sh/editor.sh
    .sh/git.sh
    .sh/gopath.sh
    .sh/grok.sh
    .sh/homebrew.sh
    .sh/ls-colors.sh
    .sh/mosh.sh
    .sh/uvpath.sh
    .sh/vga-colors.sh
)

MACOS=(
    .config/yabai
    .config/skhd
)

# Never linked: upgrade.sh (tarball-into-$HOME), post_upgrade.sh,
# 00-runonce.sh (self-deleting macOS icon hack), alacritty.icns.

link() {
    local rel=$1
    local src=$DOTFILES/$rel
    local dst=$HOME/$rel
    local cur

    if [[ ! -e $src && ! -L $src ]]; then
        echo "missing  $rel" >&2
        return 1
    fi

    if [[ -L $dst ]]; then
        cur=$(readlink "$dst")
        if [[ $cur == "$src" ]]; then
            echo "ok       $rel"
            return 0
        fi
    fi

    if [[ -e $dst || -L $dst ]]; then
        if [[ $force -eq 0 ]]; then
            echo "conflict $rel" >&2
            conflicts=$((conflicts + 1))
            return 0
        fi
        if [[ $dry_run -eq 1 ]]; then
            echo "replace  $rel"
            return 0
        fi
        mv "$dst" "$dst.bak.$(date +%s)"
    fi

    if [[ $dry_run -eq 1 ]]; then
        echo "link     $rel"
        return 0
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo "link     $rel"
}

paths=("${COMMON[@]}")
if is_omarchy; then
    echo "profile: omarchy (allowlist)"
else
    paths+=("${UNIX[@]}")
    if is_darwin; then
        echo "profile: macos"
        paths+=("${MACOS[@]}")
    else
        echo "profile: unix"
    fi
fi

if [[ $dry_run -eq 1 ]]; then
    echo "mode:    dry-run"
fi

for rel in "${paths[@]}"; do
    link "$rel"
done

if [[ $conflicts -gt 0 ]]; then
    echo "$conflicts existing path(s) left untouched (use --force to replace)" >&2
    exit 1
fi
