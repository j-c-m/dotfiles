#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic Q
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1d/1d/20"
    print_osc4 1 "d4/35/9a"
    print_osc4 2 "42/87/f5"
    print_osc4 3 "88/b4/fc"
    print_osc4 4 "a0/95/f3"
    print_osc4 5 "ba/6c/ea"
    print_osc4 6 "65/9e/fb"
    print_osc4 7 "e9/e8/ed"
    print_osc4 8 "08/07/0d"
    print_osc4 9 "eb/75/c0"
    print_osc4 10 "9c/c1/fc"
    print_osc4 11 "c2/d9/ff"
    print_osc4 12 "d9/d5/fc"
    print_osc4 13 "c9/88/f2"
    print_osc4 14 "d1/cb/fb"
    print_osc4 15 "f6/f6/f9"

    print_osc_rgb 10 "95/94/9e"
    print_osc_rgb 11 "1d/1d/20"
    print_osc_rgb 12 "67/76/8e"
    print_osc_rgb 17 "95/94/9e"
    print_osc_rgb 19 "1d/1d/20"
}

do_linux() {
    print_linux 0 "#1d1d20"
    print_linux 1 "#d4359a"
    print_linux 2 "#4287f5"
    print_linux 3 "#88b4fc"
    print_linux 4 "#a095f3"
    print_linux 5 "#ba6cea"
    print_linux 6 "#659efb"
    print_linux 7 "#95949e"
    print_linux 8 "#08070d"
    print_linux 9 "#eb75c0"
    print_linux 10 "#9cc1fc"
    print_linux 11 "#c2d9ff"
    print_linux 12 "#d9d5fc"
    print_linux 13 "#c988f2"
    print_linux 14 "#d1cbfb"
    print_linux 15 "#f6f6f9"
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
