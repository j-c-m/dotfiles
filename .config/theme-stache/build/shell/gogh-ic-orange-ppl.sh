#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ic Orange Ppl
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
    print_osc4 1 "c1/39/00"
    print_osc4 2 "a4/a9/00"
    print_osc4 3 "ca/af/00"
    print_osc4 4 "bd/6d/00"
    print_osc4 5 "fc/5e/00"
    print_osc4 6 "f7/95/00"
    print_osc4 7 "ff/c8/8a"
    print_osc4 8 "6a/4f/2a"
    print_osc4 9 "ff/8c/68"
    print_osc4 10 "f6/ff/40"
    print_osc4 11 "ff/e3/6e"
    print_osc4 12 "ff/be/55"
    print_osc4 13 "fc/87/4f"
    print_osc4 14 "c6/97/52"
    print_osc4 15 "fa/fa/ff"

    print_osc_rgb 10 "ff/cb/83"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "ff/cb/83"
    print_osc_rgb 17 "ff/cb/83"
    print_osc_rgb 19 "26/26/26"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c13900"
    print_linux 2 "#a4a900"
    print_linux 3 "#caaf00"
    print_linux 4 "#bd6d00"
    print_linux 5 "#fc5e00"
    print_linux 6 "#f79500"
    print_linux 7 "#ffcb83"
    print_linux 8 "#6a4f2a"
    print_linux 9 "#ff8c68"
    print_linux 10 "#f6ff40"
    print_linux 11 "#ffe36e"
    print_linux 12 "#ffbe55"
    print_linux 13 "#fc874f"
    print_linux 14 "#c69752"
    print_linux 15 "#fafaff"
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
