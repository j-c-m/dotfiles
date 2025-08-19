#!/usr/bin/env bash

# Source:   iterm
# Theme:    Zenburn
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "4d/4d/4d"
    print_osc4 1 "70/50/50"
    print_osc4 2 "60/b4/8a"
    print_osc4 3 "f0/df/af"
    print_osc4 4 "50/60/70"
    print_osc4 5 "dc/8c/c3"
    print_osc4 6 "8c/d0/d3"
    print_osc4 7 "dc/dc/cc"
    print_osc4 8 "70/90/80"
    print_osc4 9 "dc/a3/a3"
    print_osc4 10 "c3/bf/9f"
    print_osc4 11 "e0/cf/9f"
    print_osc4 12 "94/bf/f3"
    print_osc4 13 "ec/93/d3"
    print_osc4 14 "93/e0/e3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "dc/dc/cc"
    print_osc_rgb 11 "3f/3f/3f"
    print_osc_rgb 12 "73/63/5a"
    print_osc_rgb 17 "21/32/2f"
    print_osc_rgb 19 "c2/d8/7a"
}

do_linux() {
    print_linux 0 "#4d4d4d"
    print_linux 1 "#705050"
    print_linux 2 "#60b48a"
    print_linux 3 "#f0dfaf"
    print_linux 4 "#506070"
    print_linux 5 "#dc8cc3"
    print_linux 6 "#8cd0d3"
    print_linux 7 "#dcdccc"
    print_linux 8 "#709080"
    print_linux 9 "#dca3a3"
    print_linux 10 "#c3bf9f"
    print_linux 11 "#e0cf9f"
    print_linux 12 "#94bff3"
    print_linux 13 "#ec93d3"
    print_linux 14 "#93e0e3"
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
