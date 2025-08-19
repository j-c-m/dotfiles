#!/usr/bin/env bash

# Source:   iterm
# Theme:    Snazzy Soft
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/5b/56"
    print_osc4 2 "5a/f7/8d"
    print_osc4 3 "f3/f9/9c"
    print_osc4 4 "57/c7/fe"
    print_osc4 5 "ff/69/c0"
    print_osc4 6 "9a/ec/fe"
    print_osc4 7 "f1/f1/f0"
    print_osc4 8 "68/67/67"
    print_osc4 9 "ff/5b/56"
    print_osc4 10 "5a/f7/8d"
    print_osc4 11 "f3/f9/9c"
    print_osc4 12 "57/c7/fe"
    print_osc4 13 "ff/69/c0"
    print_osc4 14 "9a/ec/fe"
    print_osc4 15 "f1/f1/f0"

    print_osc_rgb 10 "ef/f0/ea"
    print_osc_rgb 11 "27/29/35"
    print_osc_rgb 12 "e9/e9/e9"
    print_osc_rgb 17 "92/bb/d0"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff5b56"
    print_linux 2 "#5af78d"
    print_linux 3 "#f3f99c"
    print_linux 4 "#57c7fe"
    print_linux 5 "#ff69c0"
    print_linux 6 "#9aecfe"
    print_linux 7 "#eff0ea"
    print_linux 8 "#686767"
    print_linux 9 "#ff5b56"
    print_linux 10 "#5af78d"
    print_linux 11 "#f3f99c"
    print_linux 12 "#57c7fe"
    print_linux 13 "#ff69c0"
    print_linux 14 "#9aecfe"
    print_linux 15 "#f1f1f0"
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
