#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyo Night Terminal Dark
# Author:   Michaël Ball
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

print_osc4() {
    local color="$1"
    local hexterm="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "$hexterm"
}

print_osc_rgb() {
    local osc="$1"
    local hexterm="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "$hexterm"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "16/16/1e"
    print_osc4 1 "f7/76/8e"
    print_osc4 2 "41/a6/b5"
    print_osc4 3 "e0/af/68"
    print_osc4 4 "7a/a2/f7"
    print_osc4 5 "bb/9a/f7"
    print_osc4 6 "7d/cf/ff"
    print_osc4 7 "78/7c/99"
    print_osc4 8 "44/4b/6a"
    print_osc4 9 "f7/76/8e"
    print_osc4 10 "41/a6/b5"
    print_osc4 11 "e0/af/68"
    print_osc4 12 "7a/a2/f7"
    print_osc4 13 "bb/9a/f7"
    print_osc4 14 "7d/cf/ff"
    print_osc4 15 "d5/d6/db"

    print_osc_rgb 10 "78/7c/99"
    print_osc_rgb 11 "16/16/1e"
    print_osc_rgb 12 "78/7c/99"
    print_osc_rgb 17 "cb/cc/d1"
    print_osc_rgb 19 "1a/1b/26"
}

do_linux() {
    print_linux 0 "#16161e"
    print_linux 1 "#f7768e"
    print_linux 2 "#41a6b5"
    print_linux 3 "#e0af68"
    print_linux 4 "#7aa2f7"
    print_linux 5 "#bb9af7"
    print_linux 6 "#7dcfff"
    print_linux 7 "#787c99"
    print_linux 8 "#444b6a"
    print_linux 9 "#f7768e"
    print_linux 10 "#41a6b5"
    print_linux 11 "#e0af68"
    print_linux 12 "#7aa2f7"
    print_linux 13 "#bb9af7"
    print_linux 14 "#7dcfff"
    print_linux 15 "#d5d6db"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux
