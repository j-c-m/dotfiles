#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tomorrow Night
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "28/2a/2e"
    print_osc4 1 "cc/66/66"
    print_osc4 2 "b5/bd/68"
    print_osc4 3 "f0/c6/74"
    print_osc4 4 "81/a2/be"
    print_osc4 5 "b2/94/bb"
    print_osc4 6 "8a/be/b7"
    print_osc4 7 "c5/c8/c6"
    print_osc4 8 "96/98/96"
    print_osc4 9 "cc/66/66"
    print_osc4 10 "b5/bd/68"
    print_osc4 11 "f0/c6/74"
    print_osc4 12 "81/a2/be"
    print_osc4 13 "b2/94/bb"
    print_osc4 14 "8a/be/b7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c5/c8/c6"
    print_osc_rgb 11 "1d/1f/21"
    print_osc_rgb 12 "c5/c8/c6"
    print_osc_rgb 17 "c5/c8/c6"
    print_osc_rgb 19 "1d/1f/21"
}

do_linux() {
    print_linux 0 "#282a2e"
    print_linux 1 "#cc6666"
    print_linux 2 "#b5bd68"
    print_linux 3 "#f0c674"
    print_linux 4 "#81a2be"
    print_linux 5 "#b294bb"
    print_linux 6 "#8abeb7"
    print_linux 7 "#c5c8c6"
    print_linux 8 "#969896"
    print_linux 9 "#cc6666"
    print_linux 10 "#b5bd68"
    print_linux 11 "#f0c674"
    print_linux 12 "#81a2be"
    print_linux 13 "#b294bb"
    print_linux 14 "#8abeb7"
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
