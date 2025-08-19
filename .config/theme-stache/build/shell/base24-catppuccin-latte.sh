#!/usr/bin/env bash

# Source:   base24
# Theme:    Catppuccin Latte
# Author:   https://github.com/catppuccin/catppuccin
# Variant:  light

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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "ef/f1/f5"
    print_osc4 1 "d2/0f/39"
    print_osc4 2 "40/a0/2b"
    print_osc4 3 "df/8e/1d"
    print_osc4 4 "1e/66/f5"
    print_osc4 5 "88/39/ef"
    print_osc4 6 "17/92/99"
    print_osc4 7 "4c/4f/69"
    print_osc4 8 "bc/c0/cc"
    print_osc4 9 "e6/45/53"
    print_osc4 10 "40/a0/2b"
    print_osc4 11 "dc/8a/78"
    print_osc4 12 "20/9f/b5"
    print_osc4 13 "ea/76/cb"
    print_osc4 14 "04/a5/e5"
    print_osc4 15 "72/87/fd"

    print_osc_rgb 10 "4c/4f/69"
    print_osc_rgb 11 "ef/f1/f5"
    print_osc_rgb 12 "4c/4f/69"
    print_osc_rgb 17 "dc/8a/78"
    print_osc_rgb 19 "e6/e9/ef"
}

do_linux() {
    print_linux 0 "#eff1f5"
    print_linux 1 "#d20f39"
    print_linux 2 "#40a02b"
    print_linux 3 "#df8e1d"
    print_linux 4 "#1e66f5"
    print_linux 5 "#8839ef"
    print_linux 6 "#179299"
    print_linux 7 "#4c4f69"
    print_linux 8 "#bcc0cc"
    print_linux 9 "#e64553"
    print_linux 10 "#40a02b"
    print_linux 11 "#dc8a78"
    print_linux 12 "#209fb5"
    print_linux 13 "#ea76cb"
    print_linux 14 "#04a5e5"
    print_linux 15 "#7287fd"
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
