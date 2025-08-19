#!/usr/bin/env bash

# Source:   base16
# Theme:    Macintosh
# Author:   Rebecca Bettencourt (http://www.kreativekorp.com)
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
    print_osc4 1 "dd/09/07"
    print_osc4 2 "1f/b7/14"
    print_osc4 3 "fb/f3/05"
    print_osc4 4 "00/00/d3"
    print_osc4 5 "47/00/a5"
    print_osc4 6 "02/ab/ea"
    print_osc4 7 "c0/c0/c0"
    print_osc4 8 "80/80/80"
    print_osc4 9 "dd/09/07"
    print_osc4 10 "1f/b7/14"
    print_osc4 11 "fb/f3/05"
    print_osc4 12 "00/00/d3"
    print_osc4 13 "47/00/a5"
    print_osc4 14 "02/ab/ea"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c0/c0/c0"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c0/c0/c0"
    print_osc_rgb 17 "c0/c0/c0"
    print_osc_rgb 19 "40/40/40"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#dd0907"
    print_linux 2 "#1fb714"
    print_linux 3 "#fbf305"
    print_linux 4 "#0000d3"
    print_linux 5 "#4700a5"
    print_linux 6 "#02abea"
    print_linux 7 "#c0c0c0"
    print_linux 8 "#808080"
    print_linux 9 "#dd0907"
    print_linux 10 "#1fb714"
    print_linux 11 "#fbf305"
    print_linux 12 "#0000d3"
    print_linux 13 "#4700a5"
    print_linux 14 "#02abea"
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
