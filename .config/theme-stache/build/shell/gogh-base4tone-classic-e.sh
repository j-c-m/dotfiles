#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic E
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
    print_osc4 0 "21/21/1c"
    print_osc4 1 "08/8e/a0"
    print_osc4 2 "c2/79/05"
    print_osc4 3 "e8/a0/2c"
    print_osc4 4 "b9/cf/17"
    print_osc4 5 "5c/ba/21"
    print_osc4 6 "dc/91/18"
    print_osc4 7 "ed/ee/e8"
    print_osc4 8 "0d/0d/07"
    print_osc4 9 "25/bc/d0"
    print_osc4 10 "ea/a8/3e"
    print_osc4 11 "f3/cd/91"
    print_osc4 12 "ee/f6/b1"
    print_osc4 13 "69/d4/25"
    print_osc4 14 "e6/f2/8c"
    print_osc4 15 "f9/f9/f6"

    print_osc_rgb 10 "a0/a2/90"
    print_osc_rgb 11 "21/21/1c"
    print_osc_rgb 12 "87/7d/6e"
    print_osc_rgb 17 "a0/a2/90"
    print_osc_rgb 19 "21/21/1c"
}

do_linux() {
    print_linux 0 "#21211c"
    print_linux 1 "#088ea0"
    print_linux 2 "#c27905"
    print_linux 3 "#e8a02c"
    print_linux 4 "#b9cf17"
    print_linux 5 "#5cba21"
    print_linux 6 "#dc9118"
    print_linux 7 "#a0a290"
    print_linux 8 "#0d0d07"
    print_linux 9 "#25bcd0"
    print_linux 10 "#eaa83e"
    print_linux 11 "#f3cd91"
    print_linux 12 "#eef6b1"
    print_linux 13 "#69d425"
    print_linux 14 "#e6f28c"
    print_linux 15 "#f9f9f6"
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
