#!/usr/bin/env bash

# Source:   iterm
# Theme:    Solarized Dark Higher Contrast
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
    print_osc4 0 "00/27/31"
    print_osc4 1 "d0/1b/24"
    print_osc4 2 "6b/be/6c"
    print_osc4 3 "a5/77/05"
    print_osc4 4 "20/75/c7"
    print_osc4 5 "c6/1b/6e"
    print_osc4 6 "25/91/85"
    print_osc4 7 "e9/e2/cb"
    print_osc4 8 "00/63/88"
    print_osc4 9 "f4/15/3b"
    print_osc4 10 "50/ee/84"
    print_osc4 11 "b1/7e/28"
    print_osc4 12 "17/8d/c7"
    print_osc4 13 "e1/4d/8e"
    print_osc4 14 "00/b2/9e"
    print_osc4 15 "fc/f4/dc"

    print_osc_rgb 10 "9b/c1/c2"
    print_osc_rgb 11 "00/1e/26"
    print_osc_rgb 12 "f3/4a/00"
    print_osc_rgb 17 "00/37/47"
    print_osc_rgb 19 "79/8f/8e"
}

do_linux() {
    print_linux 0 "#002731"
    print_linux 1 "#d01b24"
    print_linux 2 "#6bbe6c"
    print_linux 3 "#a57705"
    print_linux 4 "#2075c7"
    print_linux 5 "#c61b6e"
    print_linux 6 "#259185"
    print_linux 7 "#9bc1c2"
    print_linux 8 "#006388"
    print_linux 9 "#f4153b"
    print_linux 10 "#50ee84"
    print_linux 11 "#b17e28"
    print_linux 12 "#178dc7"
    print_linux 13 "#e14d8e"
    print_linux 14 "#00b29e"
    print_linux 15 "#fcf4dc"
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
