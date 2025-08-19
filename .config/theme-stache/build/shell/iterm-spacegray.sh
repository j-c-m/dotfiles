#!/usr/bin/env bash

# Source:   iterm
# Theme:    SpaceGray
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "af/4b/57"
    print_osc4 2 "87/b2/79"
    print_osc4 3 "e5/c0/78"
    print_osc4 4 "7c/8f/a3"
    print_osc4 5 "a3/79/96"
    print_osc4 6 "84/a6/a4"
    print_osc4 7 "b2/b8/c2"
    print_osc4 8 "00/00/00"
    print_osc4 9 "af/4b/57"
    print_osc4 10 "87/b2/79"
    print_osc4 11 "e5/c0/78"
    print_osc4 12 "7c/8f/a3"
    print_osc4 13 "a3/79/96"
    print_osc4 14 "84/a6/a4"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "b2/b8/c2"
    print_osc_rgb 11 "20/23/2c"
    print_osc_rgb 12 "b2/b8/c2"
    print_osc_rgb 17 "15/17/1e"
    print_osc_rgb 19 "b2/b8/c2"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#af4b57"
    print_linux 2 "#87b279"
    print_linux 3 "#e5c078"
    print_linux 4 "#7c8fa3"
    print_linux 5 "#a37996"
    print_linux 6 "#84a6a4"
    print_linux 7 "#b2b8c2"
    print_linux 8 "#000000"
    print_linux 9 "#af4b57"
    print_linux 10 "#87b279"
    print_linux 11 "#e5c078"
    print_linux 12 "#7c8fa3"
    print_linux 13 "#a37996"
    print_linux 14 "#84a6a4"
    print_linux 15 "#fffefe"
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
