#!/usr/bin/env bash

# Source:   base16
# Theme:    Espresso
# Author:   Unknown. Maintained by Alex Mirrington (https://github.com/alexmirrington)
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
    print_osc4 0 "2d/2d/2d"
    print_osc4 1 "d2/52/52"
    print_osc4 2 "a5/c2/61"
    print_osc4 3 "ff/c6/6d"
    print_osc4 4 "6c/99/bb"
    print_osc4 5 "d1/97/d9"
    print_osc4 6 "be/d6/ff"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "77/77/77"
    print_osc4 9 "d2/52/52"
    print_osc4 10 "a5/c2/61"
    print_osc4 11 "ff/c6/6d"
    print_osc4 12 "6c/99/bb"
    print_osc4 13 "d1/97/d9"
    print_osc4 14 "be/d6/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "2d/2d/2d"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "39/39/39"
}

do_linux() {
    print_linux 0 "#2d2d2d"
    print_linux 1 "#d25252"
    print_linux 2 "#a5c261"
    print_linux 3 "#ffc66d"
    print_linux 4 "#6c99bb"
    print_linux 5 "#d197d9"
    print_linux 6 "#bed6ff"
    print_linux 7 "#cccccc"
    print_linux 8 "#777777"
    print_linux 9 "#d25252"
    print_linux 10 "#a5c261"
    print_linux 11 "#ffc66d"
    print_linux 12 "#6c99bb"
    print_linux 13 "#d197d9"
    print_linux 14 "#bed6ff"
    print_linux 15 "#ffffff"
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
