#!/usr/bin/env bash

# Source:   iterm
# Theme:    Spring
# Author:   unknown
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/4c/83"
    print_osc4 2 "1f/8c/3a"
    print_osc4 3 "1f/c9/5a"
    print_osc4 4 "1c/d2/ee"
    print_osc4 5 "89/59/a8"
    print_osc4 6 "3e/99/9f"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "ff/00/21"
    print_osc4 10 "1f/c2/31"
    print_osc4 11 "d4/b7/06"
    print_osc4 12 "15/a9/fd"
    print_osc4 13 "89/59/a8"
    print_osc4 14 "3e/99/9f"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "4d/4d/4c"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "4d/4d/4c"
    print_osc_rgb 17 "d6/d6/d6"
    print_osc_rgb 19 "4d/4d/4c"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff4c83"
    print_linux 2 "#1f8c3a"
    print_linux 3 "#1fc95a"
    print_linux 4 "#1cd2ee"
    print_linux 5 "#8959a8"
    print_linux 6 "#3e999f"
    print_linux 7 "#4d4d4c"
    print_linux 8 "#000000"
    print_linux 9 "#ff0021"
    print_linux 10 "#1fc231"
    print_linux 11 "#d4b706"
    print_linux 12 "#15a9fd"
    print_linux 13 "#8959a8"
    print_linux 14 "#3e999f"
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
