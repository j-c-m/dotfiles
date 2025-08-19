#!/usr/bin/env bash

# Source:   base16
# Theme:    Mocha
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 0 "3b/32/28"
    print_osc4 1 "cb/60/77"
    print_osc4 2 "be/b5/5b"
    print_osc4 3 "f4/bc/87"
    print_osc4 4 "8a/b3/b5"
    print_osc4 5 "a8/9b/b9"
    print_osc4 6 "7b/bd/a4"
    print_osc4 7 "d0/c8/c6"
    print_osc4 8 "7e/70/5a"
    print_osc4 9 "cb/60/77"
    print_osc4 10 "be/b5/5b"
    print_osc4 11 "f4/bc/87"
    print_osc4 12 "8a/b3/b5"
    print_osc4 13 "a8/9b/b9"
    print_osc4 14 "7b/bd/a4"
    print_osc4 15 "f5/ee/eb"

    print_osc_rgb 10 "d0/c8/c6"
    print_osc_rgb 11 "3b/32/28"
    print_osc_rgb 12 "d0/c8/c6"
    print_osc_rgb 17 "e9/e1/dd"
    print_osc_rgb 19 "53/46/36"
}

do_linux() {
    print_linux 0 "#3b3228"
    print_linux 1 "#cb6077"
    print_linux 2 "#beb55b"
    print_linux 3 "#f4bc87"
    print_linux 4 "#8ab3b5"
    print_linux 5 "#a89bb9"
    print_linux 6 "#7bbda4"
    print_linux 7 "#d0c8c6"
    print_linux 8 "#7e705a"
    print_linux 9 "#cb6077"
    print_linux 10 "#beb55b"
    print_linux 11 "#f4bc87"
    print_linux 12 "#8ab3b5"
    print_linux 13 "#a89bb9"
    print_linux 14 "#7bbda4"
    print_linux 15 "#f5eeeb"
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
