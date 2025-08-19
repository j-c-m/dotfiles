#!/usr/bin/env bash

# Source:   base16
# Theme:    Cupcake
# Author:   Chris Kempson (http://chriskempson.com)
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "fb/f1/f2"
    print_osc4 1 "d5/7e/85"
    print_osc4 2 "a3/b3/67"
    print_osc4 3 "dc/b1/6c"
    print_osc4 4 "72/97/b9"
    print_osc4 5 "bb/99/b4"
    print_osc4 6 "69/a9/a7"
    print_osc4 7 "8b/81/98"
    print_osc4 8 "bf/b9/c6"
    print_osc4 9 "d5/7e/85"
    print_osc4 10 "a3/b3/67"
    print_osc4 11 "dc/b1/6c"
    print_osc4 12 "72/97/b9"
    print_osc4 13 "bb/99/b4"
    print_osc4 14 "69/a9/a7"
    print_osc4 15 "58/50/62"

    print_osc_rgb 10 "8b/81/98"
    print_osc_rgb 11 "fb/f1/f2"
    print_osc_rgb 12 "8b/81/98"
    print_osc_rgb 17 "72/67/7e"
    print_osc_rgb 19 "f2/f1/f4"
}

do_linux() {
    print_linux 0 "#fbf1f2"
    print_linux 1 "#d57e85"
    print_linux 2 "#a3b367"
    print_linux 3 "#dcb16c"
    print_linux 4 "#7297b9"
    print_linux 5 "#bb99b4"
    print_linux 6 "#69a9a7"
    print_linux 7 "#8b8198"
    print_linux 8 "#bfb9c6"
    print_linux 9 "#d57e85"
    print_linux 10 "#a3b367"
    print_linux 11 "#dcb16c"
    print_linux 12 "#7297b9"
    print_linux 13 "#bb99b4"
    print_linux 14 "#69a9a7"
    print_linux 15 "#585062"
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
