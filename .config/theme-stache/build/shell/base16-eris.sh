#!/usr/bin/env bash

# Source:   base16
# Theme:    eris
# Author:   ed (https://codeberg.org/ed)
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
    print_osc4 0 "0a/09/20"
    print_osc4 1 "f7/68/a3"
    print_osc4 2 "fa/ae/a2"
    print_osc4 3 "fa/ae/a2"
    print_osc4 4 "25/8f/c4"
    print_osc4 5 "f7/68/a3"
    print_osc4 6 "25/8f/c4"
    print_osc4 7 "60/6b/ac"
    print_osc4 8 "33/37/73"
    print_osc4 9 "f7/68/a3"
    print_osc4 10 "fa/ae/a2"
    print_osc4 11 "fa/ae/a2"
    print_osc4 12 "25/8f/c4"
    print_osc4 13 "f7/68/a3"
    print_osc4 14 "25/8f/c4"
    print_osc4 15 "9a/aa/e5"

    print_osc_rgb 10 "60/6b/ac"
    print_osc_rgb 11 "0a/09/20"
    print_osc_rgb 12 "60/6b/ac"
    print_osc_rgb 17 "79/86/c5"
    print_osc_rgb 19 "13/13/3a"
}

do_linux() {
    print_linux 0 "#0a0920"
    print_linux 1 "#f768a3"
    print_linux 2 "#faaea2"
    print_linux 3 "#faaea2"
    print_linux 4 "#258fc4"
    print_linux 5 "#f768a3"
    print_linux 6 "#258fc4"
    print_linux 7 "#606bac"
    print_linux 8 "#333773"
    print_linux 9 "#f768a3"
    print_linux 10 "#faaea2"
    print_linux 11 "#faaea2"
    print_linux 12 "#258fc4"
    print_linux 13 "#f768a3"
    print_linux 14 "#258fc4"
    print_linux 15 "#9aaae5"
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
