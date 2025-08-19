#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Porch
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
    print_osc4 0 "22/1e/24"
    print_osc4 1 "94/66/a3"
    print_osc4 2 "f3/9b/68"
    print_osc4 3 "ff/c2/9e"
    print_osc4 4 "a7/7c/b6"
    print_osc4 5 "f3/9b/68"
    print_osc4 6 "ba/95/c6"
    print_osc4 7 "9f/95/a3"
    print_osc4 8 "64/5a/68"
    print_osc4 9 "f8/aa/7c"
    print_osc4 10 "30/2a/32"
    print_osc4 11 "57/4e/5a"
    print_osc4 12 "71/67/74"
    print_osc4 13 "df/cb/e6"
    print_osc4 14 "ec/8d/55"
    print_osc4 15 "f2/e3/f7"

    print_osc_rgb 10 "9f/95/a3"
    print_osc_rgb 11 "22/1e/24"
    print_osc_rgb 12 "c4/67/31"
    print_osc_rgb 17 "9f/95/a3"
    print_osc_rgb 19 "22/1e/24"
}

do_linux() {
    print_linux 0 "#221e24"
    print_linux 1 "#9466a3"
    print_linux 2 "#f39b68"
    print_linux 3 "#ffc29e"
    print_linux 4 "#a77cb6"
    print_linux 5 "#f39b68"
    print_linux 6 "#ba95c6"
    print_linux 7 "#9f95a3"
    print_linux 8 "#645a68"
    print_linux 9 "#f8aa7c"
    print_linux 10 "#302a32"
    print_linux 11 "#574e5a"
    print_linux 12 "#716774"
    print_linux 13 "#dfcbe6"
    print_linux 14 "#ec8d55"
    print_linux 15 "#f2e3f7"
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
