#!/usr/bin/env bash

# Source:   base24
# Theme:    Firefox Dev
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "0e/10/11"
    print_osc4 1 "e6/38/53"
    print_osc4 2 "5e/b8/3c"
    print_osc4 3 "00/6f/c0"
    print_osc4 4 "35/9d/df"
    print_osc4 5 "d7/5c/ff"
    print_osc4 6 "4b/73/a2"
    print_osc4 7 "a5/ac/ae"
    print_osc4 8 "37/4d/53"
    print_osc4 9 "e1/00/3f"
    print_osc4 10 "1d/90/00"
    print_osc4 11 "cc/93/08"
    print_osc4 12 "00/6f/c0"
    print_osc4 13 "a2/00/da"
    print_osc4 14 "00/57/94"
    print_osc4 15 "e2/e2/e2"

    print_osc_rgb 10 "a5/ac/ae"
    print_osc_rgb 11 "0e/10/11"
    print_osc_rgb 12 "a5/ac/ae"
    print_osc_rgb 17 "dc/dc/dc"
    print_osc_rgb 19 "00/27/31"
}

do_linux() {
    print_linux 0 "#0e1011"
    print_linux 1 "#e63853"
    print_linux 2 "#5eb83c"
    print_linux 3 "#006fc0"
    print_linux 4 "#359ddf"
    print_linux 5 "#d75cff"
    print_linux 6 "#4b73a2"
    print_linux 7 "#a5acae"
    print_linux 8 "#374d53"
    print_linux 9 "#e1003f"
    print_linux 10 "#1d9000"
    print_linux 11 "#cc9308"
    print_linux 12 "#006fc0"
    print_linux 13 "#a200da"
    print_linux 14 "#005794"
    print_linux 15 "#e2e2e2"
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
