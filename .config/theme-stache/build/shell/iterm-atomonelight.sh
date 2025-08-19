#!/usr/bin/env bash

# Source:   iterm
# Theme:    AtomOneLight
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
    print_osc4 1 "de/3e/35"
    print_osc4 2 "3f/95/3a"
    print_osc4 3 "d2/b6/7c"
    print_osc4 4 "2f/5a/f3"
    print_osc4 5 "95/00/95"
    print_osc4 6 "3f/95/3a"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "00/00/00"
    print_osc4 9 "de/3e/35"
    print_osc4 10 "3f/95/3a"
    print_osc4 11 "d2/b6/7c"
    print_osc4 12 "2f/5a/f3"
    print_osc4 13 "a0/00/95"
    print_osc4 14 "3f/95/3a"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "2a/2c/33"
    print_osc_rgb 11 "f9/f9/f9"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "ed/ed/ed"
    print_osc_rgb 19 "2a/2c/33"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#de3e35"
    print_linux 2 "#3f953a"
    print_linux 3 "#d2b67c"
    print_linux 4 "#2f5af3"
    print_linux 5 "#950095"
    print_linux 6 "#3f953a"
    print_linux 7 "#2a2c33"
    print_linux 8 "#000000"
    print_linux 9 "#de3e35"
    print_linux 10 "#3f953a"
    print_linux 11 "#d2b67c"
    print_linux 12 "#2f5af3"
    print_linux 13 "#a00095"
    print_linux 14 "#3f953a"
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
