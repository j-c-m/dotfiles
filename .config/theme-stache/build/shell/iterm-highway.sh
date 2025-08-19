#!/usr/bin/env bash

# Source:   iterm
# Theme:    Highway
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
    print_osc4 1 "cf/0d/17"
    print_osc4 2 "12/80/33"
    print_osc4 3 "ff/ca/3d"
    print_osc4 4 "00/6a/b3"
    print_osc4 5 "6a/26/74"
    print_osc4 6 "38/45/63"
    print_osc4 7 "ed/ed/ed"
    print_osc4 8 "5c/4f/49"
    print_osc4 9 "ef/7d/17"
    print_osc4 10 "b1/d1/30"
    print_osc4 11 "ff/f1/1f"
    print_osc4 12 "4f/c2/fd"
    print_osc4 13 "de/00/70"
    print_osc4 14 "5c/4f/49"
    print_osc4 15 "fe/ff/fe"

    print_osc_rgb 10 "ed/ed/ed"
    print_osc_rgb 11 "21/22/24"
    print_osc_rgb 12 "df/d9/b8"
    print_osc_rgb 17 "38/45/63"
    print_osc_rgb 19 "ed/ed/ed"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cf0d17"
    print_linux 2 "#128033"
    print_linux 3 "#ffca3d"
    print_linux 4 "#006ab3"
    print_linux 5 "#6a2674"
    print_linux 6 "#384563"
    print_linux 7 "#ededed"
    print_linux 8 "#5c4f49"
    print_linux 9 "#ef7d17"
    print_linux 10 "#b1d130"
    print_linux 11 "#fff11f"
    print_linux 12 "#4fc2fd"
    print_linux 13 "#de0070"
    print_linux 14 "#5c4f49"
    print_linux 15 "#fefffe"
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
