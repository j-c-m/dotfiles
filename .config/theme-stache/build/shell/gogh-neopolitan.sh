#!/usr/bin/env bash

# Source:   gogh
# Theme:    Neopolitan
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "80/00/00"
    print_osc4 2 "61/ce/3c"
    print_osc4 3 "fb/de/2d"
    print_osc4 4 "25/3b/76"
    print_osc4 5 "ff/00/80"
    print_osc4 6 "8d/a6/ce"
    print_osc4 7 "f8/f8/f8"
    print_osc4 8 "00/00/00"
    print_osc4 9 "80/00/00"
    print_osc4 10 "61/ce/3c"
    print_osc4 11 "fb/de/2d"
    print_osc4 12 "25/3b/76"
    print_osc4 13 "ff/00/80"
    print_osc4 14 "8d/a6/ce"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "27/1f/19"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "27/1f/19"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#800000"
    print_linux 2 "#61ce3c"
    print_linux 3 "#fbde2d"
    print_linux 4 "#253b76"
    print_linux 5 "#ff0080"
    print_linux 6 "#8da6ce"
    print_linux 7 "#ffffff"
    print_linux 8 "#000000"
    print_linux 9 "#800000"
    print_linux 10 "#61ce3c"
    print_linux 11 "#fbde2d"
    print_linux 12 "#253b76"
    print_linux 13 "#ff0080"
    print_linux 14 "#8da6ce"
    print_linux 15 "#f8f8f8"
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
