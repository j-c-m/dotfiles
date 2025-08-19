#!/usr/bin/env bash

# Source:   iterm
# Theme:    Raycast_Light
# Author:   unknown
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b1/24/24"
    print_osc4 2 "00/6b/4f"
    print_osc4 3 "f8/a3/00"
    print_osc4 4 "13/8a/f2"
    print_osc4 5 "9a/1b/6e"
    print_osc4 6 "3e/b8/bf"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "b1/24/24"
    print_osc4 10 "00/6b/4f"
    print_osc4 11 "f8/a3/00"
    print_osc4 12 "13/8a/f2"
    print_osc4 13 "9a/1b/6e"
    print_osc4 14 "3e/b8/bf"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "e5/e5/e5"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b12424"
    print_linux 2 "#006b4f"
    print_linux 3 "#f8a300"
    print_linux 4 "#138af2"
    print_linux 5 "#9a1b6e"
    print_linux 6 "#3eb8bf"
    print_linux 7 "#000000"
    print_linux 8 "#000000"
    print_linux 9 "#b12424"
    print_linux 10 "#006b4f"
    print_linux 11 "#f8a300"
    print_linux 12 "#138af2"
    print_linux 13 "#9a1b6e"
    print_linux 14 "#3eb8bf"
    print_linux 15 "#feffff"
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
