#!/usr/bin/env bash

# Source:   iterm
# Theme:    ENCOM
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
    print_osc4 1 "9f/00/00"
    print_osc4 2 "00/8b/00"
    print_osc4 3 "ff/cf/00"
    print_osc4 4 "00/81/ff"
    print_osc4 5 "bc/00/ca"
    print_osc4 6 "00/8b/8b"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/00/00"
    print_osc4 10 "00/ee/00"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "ff/00/ff"
    print_osc4 14 "00/cd/cd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/a5/95"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "00/a4/8c"
    print_osc_rgb 19 "3d/e1/c9"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#9f0000"
    print_linux 2 "#008b00"
    print_linux 3 "#ffcf00"
    print_linux 4 "#0081ff"
    print_linux 5 "#bc00ca"
    print_linux 6 "#008b8b"
    print_linux 7 "#00a595"
    print_linux 8 "#555555"
    print_linux 9 "#ff0000"
    print_linux 10 "#00ee00"
    print_linux 11 "#ffff00"
    print_linux 12 "#0000ff"
    print_linux 13 "#ff00ff"
    print_linux 14 "#00cdcd"
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
