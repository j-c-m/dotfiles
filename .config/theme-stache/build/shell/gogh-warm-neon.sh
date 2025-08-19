#!/usr/bin/env bash

# Source:   gogh
# Theme:    Warm Neon
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
    print_osc4 1 "e2/43/46"
    print_osc4 2 "39/b1/3a"
    print_osc4 3 "da/e1/45"
    print_osc4 4 "42/61/c5"
    print_osc4 5 "f9/20/fb"
    print_osc4 6 "2a/bb/d4"
    print_osc4 7 "d0/b8/a3"
    print_osc4 8 "fe/fc/fc"
    print_osc4 9 "e9/70/71"
    print_osc4 10 "9c/c0/90"
    print_osc4 11 "dd/da/7a"
    print_osc4 12 "7b/91/d6"
    print_osc4 13 "f6/74/ba"
    print_osc4 14 "5e/d1/e5"
    print_osc4 15 "d8/c8/bb"

    print_osc_rgb 10 "af/da/b6"
    print_osc_rgb 11 "40/40/40"
    print_osc_rgb 12 "af/da/b6"
    print_osc_rgb 17 "af/da/b6"
    print_osc_rgb 19 "40/40/40"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e24346"
    print_linux 2 "#39b13a"
    print_linux 3 "#dae145"
    print_linux 4 "#4261c5"
    print_linux 5 "#f920fb"
    print_linux 6 "#2abbd4"
    print_linux 7 "#afdab6"
    print_linux 8 "#fefcfc"
    print_linux 9 "#e97071"
    print_linux 10 "#9cc090"
    print_linux 11 "#ddda7a"
    print_linux 12 "#7b91d6"
    print_linux 13 "#f674ba"
    print_linux 14 "#5ed1e5"
    print_linux 15 "#d8c8bb"
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
