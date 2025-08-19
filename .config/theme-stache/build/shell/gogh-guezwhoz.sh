#!/usr/bin/env bash

# Source:   gogh
# Theme:    Guezwhoz
# Author:   Egor Lem (http://egorlem.com)
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "e8/51/81"
    print_osc4 2 "7a/d6/94"
    print_osc4 3 "b7/d0/74"
    print_osc4 4 "5a/a0/d6"
    print_osc4 5 "9a/90/e0"
    print_osc4 6 "58/d6/ce"
    print_osc4 7 "d9/d9/d9"
    print_osc4 8 "80/80/80"
    print_osc4 9 "e8/51/81"
    print_osc4 10 "af/d7/af"
    print_osc4 11 "d1/ed/85"
    print_osc4 12 "64/b2/ed"
    print_osc4 13 "a3/98/ed"
    print_osc4 14 "61/ed/e4"
    print_osc4 15 "ed/ed/ed"

    print_osc_rgb 10 "d9/d9/d9"
    print_osc_rgb 11 "1d/1d/1d"
    print_osc_rgb 12 "99/d4/b1"
    print_osc_rgb 17 "d9/d9/d9"
    print_osc_rgb 19 "1d/1d/1d"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#e85181"
    print_linux 2 "#7ad694"
    print_linux 3 "#b7d074"
    print_linux 4 "#5aa0d6"
    print_linux 5 "#9a90e0"
    print_linux 6 "#58d6ce"
    print_linux 7 "#d9d9d9"
    print_linux 8 "#808080"
    print_linux 9 "#e85181"
    print_linux 10 "#afd7af"
    print_linux 11 "#d1ed85"
    print_linux 12 "#64b2ed"
    print_linux 13 "#a398ed"
    print_linux 14 "#61ede4"
    print_linux 15 "#ededed"
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
