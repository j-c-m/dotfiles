#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Evening
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
    print_osc4 0 "2a/27/34"
    print_osc4 1 "8a/75/f5"
    print_osc4 2 "ff/ad/5c"
    print_osc4 3 "ff/cc/99"
    print_osc4 4 "9a/86/fd"
    print_osc4 5 "ff/ad/5c"
    print_osc4 6 "af/a0/fe"
    print_osc4 7 "a4/a1/b5"
    print_osc4 8 "6c/67/83"
    print_osc4 9 "ff/b8/70"
    print_osc4 10 "36/33/42"
    print_osc4 11 "54/51/67"
    print_osc4 12 "78/73/91"
    print_osc4 13 "d9/d2/fe"
    print_osc4 14 "ff/a1/42"
    print_osc4 15 "ee/eb/ff"

    print_osc_rgb 10 "a4/a1/b5"
    print_osc_rgb 11 "2a/27/34"
    print_osc_rgb 12 "b3/75/37"
    print_osc_rgb 17 "a4/a1/b5"
    print_osc_rgb 19 "2a/27/34"
}

do_linux() {
    print_linux 0 "#2a2734"
    print_linux 1 "#8a75f5"
    print_linux 2 "#ffad5c"
    print_linux 3 "#ffcc99"
    print_linux 4 "#9a86fd"
    print_linux 5 "#ffad5c"
    print_linux 6 "#afa0fe"
    print_linux 7 "#a4a1b5"
    print_linux 8 "#6c6783"
    print_linux 9 "#ffb870"
    print_linux 10 "#363342"
    print_linux 11 "#545167"
    print_linux 12 "#787391"
    print_linux 13 "#d9d2fe"
    print_linux 14 "#ffa142"
    print_linux 15 "#eeebff"
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
