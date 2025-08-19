#!/usr/bin/env bash

# Source:   iterm
# Theme:    Darkside
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "e8/34/1c"
    print_osc4 2 "68/c2/56"
    print_osc4 3 "f2/d3/2c"
    print_osc4 4 "1c/98/e8"
    print_osc4 5 "8e/69/c9"
    print_osc4 6 "1c/98/e8"
    print_osc4 7 "ba/ba/ba"
    print_osc4 8 "00/00/00"
    print_osc4 9 "df/5a/4f"
    print_osc4 10 "76/b7/68"
    print_osc4 11 "ee/d6/4a"
    print_osc4 12 "38/7b/d2"
    print_osc4 13 "95/7b/bd"
    print_osc4 14 "3d/96/e2"
    print_osc4 15 "ba/ba/ba"

    print_osc_rgb 10 "ba/ba/ba"
    print_osc_rgb 11 "22/23/24"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "30/33/33"
    print_osc_rgb 19 "ba/ba/ba"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e8341c"
    print_linux 2 "#68c256"
    print_linux 3 "#f2d32c"
    print_linux 4 "#1c98e8"
    print_linux 5 "#8e69c9"
    print_linux 6 "#1c98e8"
    print_linux 7 "#bababa"
    print_linux 8 "#000000"
    print_linux 9 "#df5a4f"
    print_linux 10 "#76b768"
    print_linux 11 "#eed64a"
    print_linux 12 "#387bd2"
    print_linux 13 "#957bbd"
    print_linux 14 "#3d96e2"
    print_linux 15 "#bababa"
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
