#!/usr/bin/env bash

# Source:   base16
# Theme:    Da One Paper
# Author:   NNB (https://github.com/NNBnh)
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
    print_osc4 0 "fa/f0/dc"
    print_osc4 1 "de/5d/6e"
    print_osc4 2 "76/a8/5d"
    print_osc4 3 "b3/68/4f"
    print_osc4 4 "58/90/f8"
    print_osc4 5 "c1/73/d1"
    print_osc4 6 "64/b5/a7"
    print_osc4 7 "18/18/18"
    print_osc4 8 "58/58/58"
    print_osc4 9 "de/5d/6e"
    print_osc4 10 "76/a8/5d"
    print_osc4 11 "b3/68/4f"
    print_osc4 12 "58/90/f8"
    print_osc4 13 "c1/73/d1"
    print_osc4 14 "64/b5/a7"
    print_osc4 15 "00/00/00"

    print_osc_rgb 10 "18/18/18"
    print_osc_rgb 11 "fa/f0/dc"
    print_osc_rgb 12 "18/18/18"
    print_osc_rgb 17 "00/00/00"
    print_osc_rgb 19 "c8/c8/c8"
}

do_linux() {
    print_linux 0 "#faf0dc"
    print_linux 1 "#de5d6e"
    print_linux 2 "#76a85d"
    print_linux 3 "#b3684f"
    print_linux 4 "#5890f8"
    print_linux 5 "#c173d1"
    print_linux 6 "#64b5a7"
    print_linux 7 "#181818"
    print_linux 8 "#585858"
    print_linux 9 "#de5d6e"
    print_linux 10 "#76a85d"
    print_linux 11 "#b3684f"
    print_linux 12 "#5890f8"
    print_linux 13 "#c173d1"
    print_linux 14 "#64b5a7"
    print_linux 15 "#000000"
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
