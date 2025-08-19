#!/usr/bin/env bash

# Source:   iterm
# Theme:    Earthsong
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
    print_osc4 0 "11/14/17"
    print_osc4 1 "c8/41/34"
    print_osc4 2 "84/c4/4b"
    print_osc4 3 "f4/ae/2e"
    print_osc4 4 "13/97/b9"
    print_osc4 5 "d0/62/3c"
    print_osc4 6 "4f/94/52"
    print_osc4 7 "e5/c5/a9"
    print_osc4 8 "66/5e/54"
    print_osc4 9 "ff/64/59"
    print_osc4 10 "97/e0/35"
    print_osc4 11 "df/d5/61"
    print_osc4 12 "5e/d9/ff"
    print_osc4 13 "ff/91/68"
    print_osc4 14 "83/ef/88"
    print_osc4 15 "f6/f6/ec"

    print_osc_rgb 10 "e5/c6/a8"
    print_osc_rgb 11 "28/24/20"
    print_osc_rgb 12 "f6/f6/ec"
    print_osc_rgb 17 "11/14/17"
    print_osc_rgb 19 "e5/c6/a8"
}

do_linux() {
    print_linux 0 "#111417"
    print_linux 1 "#c84134"
    print_linux 2 "#84c44b"
    print_linux 3 "#f4ae2e"
    print_linux 4 "#1397b9"
    print_linux 5 "#d0623c"
    print_linux 6 "#4f9452"
    print_linux 7 "#e5c6a8"
    print_linux 8 "#665e54"
    print_linux 9 "#ff6459"
    print_linux 10 "#97e035"
    print_linux 11 "#dfd561"
    print_linux 12 "#5ed9ff"
    print_linux 13 "#ff9168"
    print_linux 14 "#83ef88"
    print_linux 15 "#f6f6ec"
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
