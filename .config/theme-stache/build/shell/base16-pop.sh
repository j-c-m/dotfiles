#!/usr/bin/env bash

# Source:   base16
# Theme:    Pop
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 1 "eb/00/8a"
    print_osc4 2 "37/b3/49"
    print_osc4 3 "f8/ca/12"
    print_osc4 4 "0e/5a/94"
    print_osc4 5 "b3/1e/8d"
    print_osc4 6 "00/aa/bb"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "50/50/50"
    print_osc4 9 "eb/00/8a"
    print_osc4 10 "37/b3/49"
    print_osc4 11 "f8/ca/12"
    print_osc4 12 "0e/5a/94"
    print_osc4 13 "b3/1e/8d"
    print_osc4 14 "00/aa/bb"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "20/20/20"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#eb008a"
    print_linux 2 "#37b349"
    print_linux 3 "#f8ca12"
    print_linux 4 "#0e5a94"
    print_linux 5 "#b31e8d"
    print_linux 6 "#00aabb"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#505050"
    print_linux 9 "#eb008a"
    print_linux 10 "#37b349"
    print_linux 11 "#f8ca12"
    print_linux 12 "#0e5a94"
    print_linux 13 "#b31e8d"
    print_linux 14 "#00aabb"
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
