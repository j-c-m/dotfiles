#!/usr/bin/env bash

# Source:   gogh
# Theme:    Aci
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
    print_osc4 0 "36/36/36"
    print_osc4 1 "ff/08/83"
    print_osc4 2 "83/ff/08"
    print_osc4 3 "ff/83/08"
    print_osc4 4 "08/83/ff"
    print_osc4 5 "83/08/ff"
    print_osc4 6 "08/ff/83"
    print_osc4 7 "b6/b6/b6"
    print_osc4 8 "42/42/42"
    print_osc4 9 "ff/1e/8e"
    print_osc4 10 "8e/ff/1e"
    print_osc4 11 "ff/8e/1e"
    print_osc4 12 "1e/8e/ff"
    print_osc4 13 "8e/1e/ff"
    print_osc4 14 "1e/ff/8e"
    print_osc4 15 "c2/c2/c2"

    print_osc_rgb 10 "b4/e1/fd"
    print_osc_rgb 11 "0d/19/26"
    print_osc_rgb 12 "b4/e1/fd"
    print_osc_rgb 17 "b4/e1/fd"
    print_osc_rgb 19 "0d/19/26"
}

do_linux() {
    print_linux 0 "#363636"
    print_linux 1 "#ff0883"
    print_linux 2 "#83ff08"
    print_linux 3 "#ff8308"
    print_linux 4 "#0883ff"
    print_linux 5 "#8308ff"
    print_linux 6 "#08ff83"
    print_linux 7 "#b4e1fd"
    print_linux 8 "#424242"
    print_linux 9 "#ff1e8e"
    print_linux 10 "#8eff1e"
    print_linux 11 "#ff8e1e"
    print_linux 12 "#1e8eff"
    print_linux 13 "#8e1eff"
    print_linux 14 "#1eff8e"
    print_linux 15 "#c2c2c2"
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
