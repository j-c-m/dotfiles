#!/usr/bin/env bash

# Source:   iterm
# Theme:    arcoiris
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "da/27/00"
    print_osc4 2 "12/c2/58"
    print_osc4 3 "ff/c6/56"
    print_osc4 4 "51/8b/fc"
    print_osc4 5 "e3/7b/d9"
    print_osc4 6 "63/fa/d5"
    print_osc4 7 "ba/b2/b2"
    print_osc4 8 "77/77/77"
    print_osc4 9 "ff/b9/b9"
    print_osc4 10 "e3/f6/aa"
    print_osc4 11 "ff/dd/aa"
    print_osc4 12 "b3/e8/f3"
    print_osc4 13 "cb/ba/f9"
    print_osc4 14 "bc/ff/c7"
    print_osc4 15 "ef/ef/ef"

    print_osc_rgb 10 "ee/e4/d9"
    print_osc_rgb 11 "20/1f/1e"
    print_osc_rgb 12 "7a/1c/1c"
    print_osc_rgb 17 "25/52/4a"
    print_osc_rgb 19 "f3/ff/fd"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#da2700"
    print_linux 2 "#12c258"
    print_linux 3 "#ffc656"
    print_linux 4 "#518bfc"
    print_linux 5 "#e37bd9"
    print_linux 6 "#63fad5"
    print_linux 7 "#eee4d9"
    print_linux 8 "#777777"
    print_linux 9 "#ffb9b9"
    print_linux 10 "#e3f6aa"
    print_linux 11 "#ffddaa"
    print_linux 12 "#b3e8f3"
    print_linux 13 "#cbbaf9"
    print_linux 14 "#bcffc7"
    print_linux 15 "#efefef"
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
