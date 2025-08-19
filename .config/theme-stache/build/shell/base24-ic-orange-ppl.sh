#!/usr/bin/env bash

# Source:   base24
# Theme:    IC-Orange-PPL
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "c0/39/00"
    print_osc4 2 "a3/a9/00"
    print_osc4 3 "ff/bd/54"
    print_osc4 4 "bd/6c/00"
    print_osc4 5 "fb/5d/00"
    print_osc4 6 "f7/94/00"
    print_osc4 7 "d9/a9/71"
    print_osc4 8 "8f/6c/41"
    print_osc4 9 "ff/8b/67"
    print_osc4 10 "f6/ff/3f"
    print_osc4 11 "ff/e3/6e"
    print_osc4 12 "ff/bd/54"
    print_osc4 13 "fc/87/4f"
    print_osc4 14 "c5/97/52"
    print_osc4 15 "f9/f9/fe"

    print_osc_rgb 10 "d9/a9/71"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "d9/a9/71"
    print_osc_rgb 17 "ff/c8/8a"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#c03900"
    print_linux 2 "#a3a900"
    print_linux 3 "#ffbd54"
    print_linux 4 "#bd6c00"
    print_linux 5 "#fb5d00"
    print_linux 6 "#f79400"
    print_linux 7 "#d9a971"
    print_linux 8 "#8f6c41"
    print_linux 9 "#ff8b67"
    print_linux 10 "#f6ff3f"
    print_linux 11 "#ffe36e"
    print_linux 12 "#ffbd54"
    print_linux 13 "#fc874f"
    print_linux 14 "#c59752"
    print_linux 15 "#f9f9fe"
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
