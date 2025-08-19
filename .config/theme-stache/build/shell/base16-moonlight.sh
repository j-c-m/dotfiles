#!/usr/bin/env bash

# Source:   base16
# Theme:    Moonlight
# Author:   Jeremy Swinarton (https://github.com/jswinarton)
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
    print_osc4 0 "21/23/37"
    print_osc4 1 "ff/53/70"
    print_osc4 2 "2d/f4/c0"
    print_osc4 3 "ff/c7/77"
    print_osc4 4 "40/ff/ff"
    print_osc4 5 "b9/94/f1"
    print_osc4 6 "04/d1/f9"
    print_osc4 7 "a3/ac/e1"
    print_osc4 8 "74/8c/d6"
    print_osc4 9 "ff/53/70"
    print_osc4 10 "2d/f4/c0"
    print_osc4 11 "ff/c7/77"
    print_osc4 12 "40/ff/ff"
    print_osc4 13 "b9/94/f1"
    print_osc4 14 "04/d1/f9"
    print_osc4 15 "ef/43/fa"

    print_osc_rgb 10 "a3/ac/e1"
    print_osc_rgb 11 "21/23/37"
    print_osc_rgb 12 "a3/ac/e1"
    print_osc_rgb 17 "b4/a4/f4"
    print_osc_rgb 19 "40/3c/64"
}

do_linux() {
    print_linux 0 "#212337"
    print_linux 1 "#ff5370"
    print_linux 2 "#2df4c0"
    print_linux 3 "#ffc777"
    print_linux 4 "#40ffff"
    print_linux 5 "#b994f1"
    print_linux 6 "#04d1f9"
    print_linux 7 "#a3ace1"
    print_linux 8 "#748cd6"
    print_linux 9 "#ff5370"
    print_linux 10 "#2df4c0"
    print_linux 11 "#ffc777"
    print_linux 12 "#40ffff"
    print_linux 13 "#b994f1"
    print_linux 14 "#04d1f9"
    print_linux 15 "#ef43fa"
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
