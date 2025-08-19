#!/usr/bin/env bash

# Source:   iterm
# Theme:    detuned
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "16/16/16"
    print_osc4 1 "fd/42/85"
    print_osc4 2 "a6/e2/2d"
    print_osc4 3 "e5/da/72"
    print_osc4 4 "00/94/d8"
    print_osc4 5 "9a/37/fe"
    print_osc4 6 "50/b6/d8"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "67/67/67"
    print_osc4 9 "f9/7f/ac"
    print_osc4 10 "bd/e2/71"
    print_osc4 11 "fe/f2/7f"
    print_osc4 12 "00/bd/fe"
    print_osc4 13 "bd/9e/fe"
    print_osc4 14 "5e/d6/fe"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "c7/c7/c7"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c1/dd/fe"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#161616"
    print_linux 1 "#fd4285"
    print_linux 2 "#a6e22d"
    print_linux 3 "#e5da72"
    print_linux 4 "#0094d8"
    print_linux 5 "#9a37fe"
    print_linux 6 "#50b6d8"
    print_linux 7 "#c7c7c7"
    print_linux 8 "#676767"
    print_linux 9 "#f97fac"
    print_linux 10 "#bde271"
    print_linux 11 "#fef27f"
    print_linux 12 "#00bdfe"
    print_linux 13 "#bd9efe"
    print_linux 14 "#5ed6fe"
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
