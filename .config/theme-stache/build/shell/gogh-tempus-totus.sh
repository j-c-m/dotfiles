#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Totus
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "4a/48/4d"
    print_osc4 1 "a5/00/00"
    print_osc4 2 "00/5d/26"
    print_osc4 3 "71/47/00"
    print_osc4 4 "1d/3c/cf"
    print_osc4 5 "88/26/7a"
    print_osc4 6 "18/55/70"
    print_osc4 7 "ef/ef/ef"
    print_osc4 8 "5e/4b/4f"
    print_osc4 9 "99/20/30"
    print_osc4 10 "4a/55/00"
    print_osc4 11 "8a/36/00"
    print_osc4 12 "2d/45/b0"
    print_osc4 13 "70/0d/c9"
    print_osc4 14 "00/52/89"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "4a/48/4d"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "4a/48/4d"
    print_osc_rgb 17 "4a/48/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#4a484d"
    print_linux 1 "#a50000"
    print_linux 2 "#005d26"
    print_linux 3 "#714700"
    print_linux 4 "#1d3ccf"
    print_linux 5 "#88267a"
    print_linux 6 "#185570"
    print_linux 7 "#4a484d"
    print_linux 8 "#5e4b4f"
    print_linux 9 "#992030"
    print_linux 10 "#4a5500"
    print_linux 11 "#8a3600"
    print_linux 12 "#2d45b0"
    print_linux 13 "#700dc9"
    print_linux 14 "#005289"
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
