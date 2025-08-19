#!/usr/bin/env bash

# Source:   base16
# Theme:    Oxocarbon Light
# Author:   shaunsingh/IBM
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
    print_osc4 0 "f2/f4/f8"
    print_osc4 1 "ff/7e/b6"
    print_osc4 2 "0f/62/fe"
    print_osc4 3 "ff/6f/00"
    print_osc4 4 "42/be/65"
    print_osc4 5 "be/95/ff"
    print_osc4 6 "67/3a/b7"
    print_osc4 7 "39/39/39"
    print_osc4 8 "16/16/16"
    print_osc4 9 "ff/7e/b6"
    print_osc4 10 "0f/62/fe"
    print_osc4 11 "ff/6f/00"
    print_osc4 12 "42/be/65"
    print_osc4 13 "be/95/ff"
    print_osc4 14 "67/3a/b7"
    print_osc4 15 "08/bd/ba"

    print_osc_rgb 10 "39/39/39"
    print_osc_rgb 11 "f2/f4/f8"
    print_osc_rgb 12 "39/39/39"
    print_osc_rgb 17 "52/52/52"
    print_osc_rgb 19 "dd/e1/e6"
}

do_linux() {
    print_linux 0 "#f2f4f8"
    print_linux 1 "#ff7eb6"
    print_linux 2 "#0f62fe"
    print_linux 3 "#ff6f00"
    print_linux 4 "#42be65"
    print_linux 5 "#be95ff"
    print_linux 6 "#673ab7"
    print_linux 7 "#393939"
    print_linux 8 "#161616"
    print_linux 9 "#ff7eb6"
    print_linux 10 "#0f62fe"
    print_linux 11 "#ff6f00"
    print_linux 12 "#42be65"
    print_linux 13 "#be95ff"
    print_linux 14 "#673ab7"
    print_linux 15 "#08bdba"
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
