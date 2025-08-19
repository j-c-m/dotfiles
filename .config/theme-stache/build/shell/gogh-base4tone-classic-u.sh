#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic U
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
    print_osc4 0 "20/1d/20"
    print_osc4 1 "ce/67/2c"
    print_osc4 2 "aa/52/e0"
    print_osc4 3 "c9/88/f2"
    print_osc4 4 "eb/75/dd"
    print_osc4 5 "e9/63/75"
    print_osc4 6 "ba/6c/ea"
    print_osc4 7 "ed/e8/ed"
    print_osc4 8 "0d/07/0c"
    print_osc4 9 "e7/8b/55"
    print_osc4 10 "d1/9a/f4"
    print_osc4 11 "e0/ba/f7"
    print_osc4 12 "f8/c3/f2"
    print_osc4 13 "f1/7e/8e"
    print_osc4 14 "f6/b1/ee"
    print_osc4 15 "f9/f6/f8"

    print_osc_rgb 10 "9e/94/9d"
    print_osc_rgb 11 "20/1d/20"
    print_osc_rgb 12 "7c/74/81"
    print_osc_rgb 17 "9e/94/9d"
    print_osc_rgb 19 "20/1d/20"
}

do_linux() {
    print_linux 0 "#201d20"
    print_linux 1 "#ce672c"
    print_linux 2 "#aa52e0"
    print_linux 3 "#c988f2"
    print_linux 4 "#eb75dd"
    print_linux 5 "#e96375"
    print_linux 6 "#ba6cea"
    print_linux 7 "#9e949d"
    print_linux 8 "#0d070c"
    print_linux 9 "#e78b55"
    print_linux 10 "#d19af4"
    print_linux 11 "#e0baf7"
    print_linux 12 "#f8c3f2"
    print_linux 13 "#f17e8e"
    print_linux 14 "#f6b1ee"
    print_linux 15 "#f9f6f8"
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
