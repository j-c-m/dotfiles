#!/usr/bin/env bash

# Source:   base24
# Theme:    Red Planet
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
    print_osc4 0 "22/22/22"
    print_osc4 1 "8c/34/32"
    print_osc4 2 "72/82/71"
    print_osc4 3 "60/82/7e"
    print_osc4 4 "69/80/9e"
    print_osc4 5 "89/64/92"
    print_osc4 6 "5b/83/90"
    print_osc4 7 "a4/99/8c"
    print_osc4 8 "7b/77/73"
    print_osc4 9 "b5/52/42"
    print_osc4 10 "86/99/85"
    print_osc4 11 "eb/eb/91"
    print_osc4 12 "60/82/7e"
    print_osc4 13 "de/48/73"
    print_osc4 14 "38/ad/d8"
    print_osc4 15 "d6/bf/b8"

    print_osc_rgb 10 "a4/99/8c"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "a4/99/8c"
    print_osc_rgb 17 "b9/aa/99"
    print_osc_rgb 19 "20/1f/1f"
}

do_linux() {
    print_linux 0 "#222222"
    print_linux 1 "#8c3432"
    print_linux 2 "#728271"
    print_linux 3 "#60827e"
    print_linux 4 "#69809e"
    print_linux 5 "#896492"
    print_linux 6 "#5b8390"
    print_linux 7 "#a4998c"
    print_linux 8 "#7b7773"
    print_linux 9 "#b55242"
    print_linux 10 "#869985"
    print_linux 11 "#ebeb91"
    print_linux 12 "#60827e"
    print_linux 13 "#de4873"
    print_linux 14 "#38add8"
    print_linux 15 "#d6bfb8"
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
