#!/usr/bin/env bash

# Source:   gogh
# Theme:    Catppuccin Latte
# Author:   
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
    print_osc4 0 "5c/5f/77"
    print_osc4 1 "d2/0f/39"
    print_osc4 2 "40/a0/2b"
    print_osc4 3 "df/8e/1d"
    print_osc4 4 "1e/66/f5"
    print_osc4 5 "ea/76/cb"
    print_osc4 6 "17/92/99"
    print_osc4 7 "ac/b0/be"
    print_osc4 8 "6c/6f/85"
    print_osc4 9 "d2/0f/39"
    print_osc4 10 "40/a0/2b"
    print_osc4 11 "df/8e/1d"
    print_osc4 12 "1e/66/f5"
    print_osc4 13 "ea/76/cb"
    print_osc4 14 "17/92/99"
    print_osc4 15 "bc/c0/cc"

    print_osc_rgb 10 "4c/4f/69"
    print_osc_rgb 11 "ef/f1/f5"
    print_osc_rgb 12 "4c/4f/69"
    print_osc_rgb 17 "4c/4f/69"
    print_osc_rgb 19 "ef/f1/f5"
}

do_linux() {
    print_linux 0 "#5c5f77"
    print_linux 1 "#d20f39"
    print_linux 2 "#40a02b"
    print_linux 3 "#df8e1d"
    print_linux 4 "#1e66f5"
    print_linux 5 "#ea76cb"
    print_linux 6 "#179299"
    print_linux 7 "#4c4f69"
    print_linux 8 "#6c6f85"
    print_linux 9 "#d20f39"
    print_linux 10 "#40a02b"
    print_linux 11 "#df8e1d"
    print_linux 12 "#1e66f5"
    print_linux 13 "#ea76cb"
    print_linux 14 "#179299"
    print_linux 15 "#bcc0cc"
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
