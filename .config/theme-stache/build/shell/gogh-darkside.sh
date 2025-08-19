#!/usr/bin/env bash

# Source:   gogh
# Theme:    Darkside
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "e8/34/1c"
    print_osc4 2 "68/c2/56"
    print_osc4 3 "f2/d4/2c"
    print_osc4 4 "1c/98/e8"
    print_osc4 5 "8e/69/c9"
    print_osc4 6 "1c/98/e8"
    print_osc4 7 "ba/ba/ba"
    print_osc4 8 "00/00/00"
    print_osc4 9 "e0/5a/4f"
    print_osc4 10 "77/b8/69"
    print_osc4 11 "ef/d6/4b"
    print_osc4 12 "38/7c/d3"
    print_osc4 13 "95/7b/be"
    print_osc4 14 "3d/97/e2"
    print_osc4 15 "ba/ba/ba"

    print_osc_rgb 10 "ba/ba/ba"
    print_osc_rgb 11 "22/23/24"
    print_osc_rgb 12 "ba/ba/ba"
    print_osc_rgb 17 "ba/ba/ba"
    print_osc_rgb 19 "22/23/24"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e8341c"
    print_linux 2 "#68c256"
    print_linux 3 "#f2d42c"
    print_linux 4 "#1c98e8"
    print_linux 5 "#8e69c9"
    print_linux 6 "#1c98e8"
    print_linux 7 "#bababa"
    print_linux 8 "#000000"
    print_linux 9 "#e05a4f"
    print_linux 10 "#77b869"
    print_linux 11 "#efd64b"
    print_linux 12 "#387cd3"
    print_linux 13 "#957bbe"
    print_linux 14 "#3d97e2"
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
