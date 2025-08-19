#!/usr/bin/env bash

# Source:   iterm
# Theme:    Melange_dark
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "33/30/2b"
    print_osc4 1 "bd/81/83"
    print_osc4 2 "78/99/7a"
    print_osc4 3 "e3/9a/5c"
    print_osc4 4 "7e/90/b1"
    print_osc4 5 "b3/80/af"
    print_osc4 6 "7a/96/95"
    print_osc4 7 "c1/a6/8e"
    print_osc4 8 "85/73/62"
    print_osc4 9 "d4/77/66"
    print_osc4 10 "84/b6/95"
    print_osc4 11 "ea/c0/6d"
    print_osc4 12 "a3/a9/cd"
    print_osc4 13 "ce/9a/c1"
    print_osc4 14 "88/b3/b6"
    print_osc4 15 "eb/e0/d6"

    print_osc_rgb 10 "eb/e0/d6"
    print_osc_rgb 11 "28/25/21"
    print_osc_rgb 12 "eb/e0/d6"
    print_osc_rgb 17 "eb/e0/d6"
    print_osc_rgb 19 "3f/3a/35"
}

do_linux() {
    print_linux 0 "#33302b"
    print_linux 1 "#bd8183"
    print_linux 2 "#78997a"
    print_linux 3 "#e39a5c"
    print_linux 4 "#7e90b1"
    print_linux 5 "#b380af"
    print_linux 6 "#7a9695"
    print_linux 7 "#ebe0d6"
    print_linux 8 "#857362"
    print_linux 9 "#d47766"
    print_linux 10 "#84b695"
    print_linux 11 "#eac06d"
    print_linux 12 "#a3a9cd"
    print_linux 13 "#ce9ac1"
    print_linux 14 "#88b3b6"
    print_linux 15 "#ebe0d6"
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
