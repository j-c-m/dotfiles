#!/usr/bin/env bash

# Source:   iterm
# Theme:    Elegant
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
    print_osc4 0 "09/11/22"
    print_osc4 1 "fe/01/57"
    print_osc4 2 "85/cb/94"
    print_osc4 3 "fe/cb/8a"
    print_osc4 4 "8d/aa/e1"
    print_osc4 5 "c6/91/eb"
    print_osc4 6 "78/cb/f0"
    print_osc4 7 "fe/fe/fe"
    print_osc4 8 "57/55/55"
    print_osc4 9 "fe/00/57"
    print_osc4 10 "85/cb/94"
    print_osc4 11 "fe/cb/8a"
    print_osc4 12 "8d/aa/e1"
    print_osc4 13 "c6/91/eb"
    print_osc4 14 "3f/ac/ef"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "ce/d1/d5"
    print_osc_rgb 11 "28/2b/31"
    print_osc_rgb 12 "00/bd/fe"
    print_osc_rgb 17 "d5/d5/d5"
    print_osc_rgb 19 "13/42/85"
}

do_linux() {
    print_linux 0 "#091122"
    print_linux 1 "#fe0157"
    print_linux 2 "#85cb94"
    print_linux 3 "#fecb8a"
    print_linux 4 "#8daae1"
    print_linux 5 "#c691eb"
    print_linux 6 "#78cbf0"
    print_linux 7 "#ced1d5"
    print_linux 8 "#575555"
    print_linux 9 "#fe0057"
    print_linux 10 "#85cb94"
    print_linux 11 "#fecb8a"
    print_linux 12 "#8daae1"
    print_linux 13 "#c691eb"
    print_linux 14 "#3facef"
    print_linux 15 "#fefefe"
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
