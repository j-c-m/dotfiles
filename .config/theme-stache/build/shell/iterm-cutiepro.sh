#!/usr/bin/env bash

# Source:   iterm
# Theme:    CutiePro
# Author:   unknown
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "f5/6e/7f"
    print_osc4 2 "be/c9/75"
    print_osc4 3 "f5/86/69"
    print_osc4 4 "42/d9/c5"
    print_osc4 5 "d2/86/b7"
    print_osc4 6 "37/cb/8a"
    print_osc4 7 "d5/c3/c3"
    print_osc4 8 "88/84/7f"
    print_osc4 9 "e5/a1/a3"
    print_osc4 10 "e8/d6/a7"
    print_osc4 11 "f1/bb/79"
    print_osc4 12 "80/c5/de"
    print_osc4 13 "b2/94/bb"
    print_osc4 14 "9d/cc/bb"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d5/d0/c9"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "ef/c4/cd"
    print_osc_rgb 17 "36/36/36"
    print_osc_rgb 19 "d5/d0/c9"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f56e7f"
    print_linux 2 "#bec975"
    print_linux 3 "#f58669"
    print_linux 4 "#42d9c5"
    print_linux 5 "#d286b7"
    print_linux 6 "#37cb8a"
    print_linux 7 "#d5d0c9"
    print_linux 8 "#88847f"
    print_linux 9 "#e5a1a3"
    print_linux 10 "#e8d6a7"
    print_linux 11 "#f1bb79"
    print_linux 12 "#80c5de"
    print_linux 13 "#b294bb"
    print_linux 14 "#9dccbb"
    print_linux 15 "#ffffff"
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
