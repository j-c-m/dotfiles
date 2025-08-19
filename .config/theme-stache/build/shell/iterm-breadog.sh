#!/usr/bin/env bash

# Source:   iterm
# Theme:    Breadog
# Author:   unknown
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "36/2b/24"
    print_osc4 1 "b0/0a/00"
    print_osc4 2 "00/72/32"
    print_osc4 3 "8b/4b/00"
    print_osc4 4 "00/5c/b4"
    print_osc4 5 "9a/00/97"
    print_osc4 6 "00/6a/78"
    print_osc4 7 "d4/c2/b6"
    print_osc4 8 "50/42/37"
    print_osc4 9 "de/11/00"
    print_osc4 10 "00/8f/40"
    print_osc4 11 "ae/60/00"
    print_osc4 12 "00/73/e1"
    print_osc4 13 "c2/00/bd"
    print_osc4 14 "00/86/97"
    print_osc4 15 "e9/e1/d9"

    print_osc_rgb 10 "36/2b/24"
    print_osc_rgb 11 "f1/eb/e6"
    print_osc_rgb 12 "36/2b/24"
    print_osc_rgb 17 "36/2b/24"
    print_osc_rgb 19 "f1/eb/e6"
}

do_linux() {
    print_linux 0 "#362b24"
    print_linux 1 "#b00a00"
    print_linux 2 "#007232"
    print_linux 3 "#8b4b00"
    print_linux 4 "#005cb4"
    print_linux 5 "#9a0097"
    print_linux 6 "#006a78"
    print_linux 7 "#362b24"
    print_linux 8 "#504237"
    print_linux 9 "#de1100"
    print_linux 10 "#008f40"
    print_linux 11 "#ae6000"
    print_linux 12 "#0073e1"
    print_linux 13 "#c200bd"
    print_linux 14 "#008697"
    print_linux 15 "#e9e1d9"
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
