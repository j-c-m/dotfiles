#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Night
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "1a/1a/1a"
    print_osc4 1 "ff/92/9f"
    print_osc4 2 "5f/c9/40"
    print_osc4 3 "c5/b3/00"
    print_osc4 4 "5f/b8/ff"
    print_osc4 5 "ef/91/df"
    print_osc4 6 "1d/c5/c3"
    print_osc4 7 "c4/bd/af"
    print_osc4 8 "24/25/36"
    print_osc4 9 "f6/9d/6a"
    print_osc4 10 "88/c4/00"
    print_osc4 11 "d7/ae/00"
    print_osc4 12 "8c/b4/f0"
    print_osc4 13 "de/99/f0"
    print_osc4 14 "00/ca/9a"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "e0/e0/e0"
    print_osc_rgb 11 "1a/1a/1a"
    print_osc_rgb 12 "e0/e0/e0"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "1a/1a/1a"
}

do_linux() {
    print_linux 0 "#1a1a1a"
    print_linux 1 "#ff929f"
    print_linux 2 "#5fc940"
    print_linux 3 "#c5b300"
    print_linux 4 "#5fb8ff"
    print_linux 5 "#ef91df"
    print_linux 6 "#1dc5c3"
    print_linux 7 "#e0e0e0"
    print_linux 8 "#242536"
    print_linux 9 "#f69d6a"
    print_linux 10 "#88c400"
    print_linux 11 "#d7ae00"
    print_linux 12 "#8cb4f0"
    print_linux 13 "#de99f0"
    print_linux 14 "#00ca9a"
    print_linux 15 "#e0e0e0"
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
