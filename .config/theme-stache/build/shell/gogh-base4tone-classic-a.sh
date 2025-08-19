#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic A
# Author:   
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
    print_osc4 0 "21/1d/1c"
    print_osc4 1 "8d/9f/04"
    print_osc4 2 "dd/40/a4"
    print_osc4 3 "f1/7e/c7"
    print_osc4 4 "eb/82/75"
    print_osc4 5 "dc/91/18"
    print_osc4 6 "e9/63/b8"
    print_osc4 7 "ee/e8/e8"
    print_osc4 8 "0d/08/07"
    print_osc4 9 "b9/cf/17"
    print_osc4 10 "f3/91/cf"
    print_osc4 11 "f6/b1/dd"
    print_osc4 12 "f8/ca/c3"
    print_osc4 13 "e8/a0/2c"
    print_osc4 14 "fb/ba/b1"
    print_osc4 15 "f9/f6/f6"

    print_osc_rgb 10 "a1/93/91"
    print_osc_rgb 11 "21/1d/1c"
    print_osc_rgb 12 "81/74/7c"
    print_osc_rgb 17 "a1/93/91"
    print_osc_rgb 19 "21/1d/1c"
}

do_linux() {
    print_linux 0 "#211d1c"
    print_linux 1 "#8d9f04"
    print_linux 2 "#dd40a4"
    print_linux 3 "#f17ec7"
    print_linux 4 "#eb8275"
    print_linux 5 "#dc9118"
    print_linux 6 "#e963b8"
    print_linux 7 "#a19391"
    print_linux 8 "#0d0807"
    print_linux 9 "#b9cf17"
    print_linux 10 "#f391cf"
    print_linux 11 "#f6b1dd"
    print_linux 12 "#f8cac3"
    print_linux 13 "#e8a02c"
    print_linux 14 "#fbbab1"
    print_linux 15 "#f9f6f6"
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
