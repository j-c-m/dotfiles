#!/usr/bin/env bash

# Source:   base24
# Theme:    Espresso
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "26/26/26"
    print_osc4 1 "d2/51/51"
    print_osc4 2 "a5/c2/61"
    print_osc4 3 "8a/b7/d9"
    print_osc4 4 "6c/99/bb"
    print_osc4 5 "d1/97/d9"
    print_osc4 6 "be/d6/ff"
    print_osc4 7 "c7/c7/c5"
    print_osc4 8 "79/79/79"
    print_osc4 9 "f0/0c/0c"
    print_osc4 10 "c2/e0/75"
    print_osc4 11 "e1/e3/8b"
    print_osc4 12 "8a/b7/d9"
    print_osc4 13 "ef/b5/f7"
    print_osc4 14 "dc/f3/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c7/c7/c5"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "c7/c7/c5"
    print_osc_rgb 17 "ee/ee/ec"
    print_osc_rgb 19 "34/34/34"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#d25151"
    print_linux 2 "#a5c261"
    print_linux 3 "#8ab7d9"
    print_linux 4 "#6c99bb"
    print_linux 5 "#d197d9"
    print_linux 6 "#bed6ff"
    print_linux 7 "#c7c7c5"
    print_linux 8 "#797979"
    print_linux 9 "#f00c0c"
    print_linux 10 "#c2e075"
    print_linux 11 "#e1e38b"
    print_linux 12 "#8ab7d9"
    print_linux 13 "#efb5f7"
    print_linux 14 "#dcf3ff"
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
