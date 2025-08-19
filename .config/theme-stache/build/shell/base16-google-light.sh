#!/usr/bin/env bash

# Source:   base16
# Theme:    Google Light
# Author:   Seth Wright (http://sethawright.com)
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "cc/34/2b"
    print_osc4 2 "19/88/44"
    print_osc4 3 "fb/a9/22"
    print_osc4 4 "39/71/ed"
    print_osc4 5 "a3/6a/c7"
    print_osc4 6 "39/71/ed"
    print_osc4 7 "37/3b/41"
    print_osc4 8 "b4/b7/b4"
    print_osc4 9 "cc/34/2b"
    print_osc4 10 "19/88/44"
    print_osc4 11 "fb/a9/22"
    print_osc4 12 "39/71/ed"
    print_osc4 13 "a3/6a/c7"
    print_osc4 14 "39/71/ed"
    print_osc4 15 "1d/1f/21"

    print_osc_rgb 10 "37/3b/41"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "37/3b/41"
    print_osc_rgb 17 "28/2a/2e"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#cc342b"
    print_linux 2 "#198844"
    print_linux 3 "#fba922"
    print_linux 4 "#3971ed"
    print_linux 5 "#a36ac7"
    print_linux 6 "#3971ed"
    print_linux 7 "#373b41"
    print_linux 8 "#b4b7b4"
    print_linux 9 "#cc342b"
    print_linux 10 "#198844"
    print_linux 11 "#fba922"
    print_linux 12 "#3971ed"
    print_linux 13 "#a36ac7"
    print_linux 14 "#3971ed"
    print_linux 15 "#1d1f21"
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
