#!/usr/bin/env bash

# Source:   base16
# Theme:    Pico
# Author:   PICO-8 (http://www.lexaloffle.com/pico-8.php)
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
    print_osc4 1 "ff/00/4d"
    print_osc4 2 "00/e7/56"
    print_osc4 3 "ff/f0/24"
    print_osc4 4 "83/76/9c"
    print_osc4 5 "ff/77/a8"
    print_osc4 6 "29/ad/ff"
    print_osc4 7 "5f/57/4f"
    print_osc4 8 "00/87/51"
    print_osc4 9 "ff/00/4d"
    print_osc4 10 "00/e7/56"
    print_osc4 11 "ff/f0/24"
    print_osc4 12 "83/76/9c"
    print_osc4 13 "ff/77/a8"
    print_osc4 14 "29/ad/ff"
    print_osc4 15 "ff/f1/e8"

    print_osc_rgb 10 "5f/57/4f"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "5f/57/4f"
    print_osc_rgb 17 "c2/c3/c7"
    print_osc_rgb 19 "1d/2b/53"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff004d"
    print_linux 2 "#00e756"
    print_linux 3 "#fff024"
    print_linux 4 "#83769c"
    print_linux 5 "#ff77a8"
    print_linux 6 "#29adff"
    print_linux 7 "#5f574f"
    print_linux 8 "#008751"
    print_linux 9 "#ff004d"
    print_linux 10 "#00e756"
    print_linux 11 "#fff024"
    print_linux 12 "#83769c"
    print_linux 13 "#ff77a8"
    print_linux 14 "#29adff"
    print_linux 15 "#fff1e8"
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
