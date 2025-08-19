#!/usr/bin/env bash

# Source:   gogh
# Theme:    Dissonance
# Author:   
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "dc/32/2f"
    print_osc4 2 "56/db/3a"
    print_osc4 3 "ff/84/00"
    print_osc4 4 "00/84/d4"
    print_osc4 5 "b7/29/d9"
    print_osc4 6 "cc/cc/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "d6/db/e5"
    print_osc4 9 "dc/32/2f"
    print_osc4 10 "56/db/3a"
    print_osc4 11 "ff/84/00"
    print_osc4 12 "00/84/d4"
    print_osc4 13 "b7/29/d9"
    print_osc4 14 "cc/cc/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "dc/32/2f"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#dc322f"
    print_linux 2 "#56db3a"
    print_linux 3 "#ff8400"
    print_linux 4 "#0084d4"
    print_linux 5 "#b729d9"
    print_linux 6 "#ccccff"
    print_linux 7 "#ffffff"
    print_linux 8 "#d6dbe5"
    print_linux 9 "#dc322f"
    print_linux 10 "#56db3a"
    print_linux 11 "#ff8400"
    print_linux 12 "#0084d4"
    print_linux 13 "#b729d9"
    print_linux 14 "#ccccff"
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
