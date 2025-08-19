#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Lake
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
    print_osc4 0 "19/2d/34"
    print_osc4 1 "3e/91/ac"
    print_osc4 2 "cb/bb/4d"
    print_osc4 3 "ff/eb/66"
    print_osc4 4 "49/9f/bc"
    print_osc4 5 "cb/bb/4d"
    print_osc4 6 "62/b1/cb"
    print_osc4 7 "7b/a8/b7"
    print_osc4 8 "3d/68/76"
    print_osc4 9 "d6/c6/5c"
    print_osc4 10 "22/3c/44"
    print_osc4 11 "33/59/66"
    print_osc4 12 "46/76/86"
    print_osc4 13 "a5/d8/e9"
    print_osc4 14 "c4/b0/31"
    print_osc4 15 "e1/f7/ff"

    print_osc_rgb 10 "7b/a8/b7"
    print_osc_rgb 11 "19/2d/34"
    print_osc_rgb 12 "84/74/0b"
    print_osc_rgb 17 "7b/a8/b7"
    print_osc_rgb 19 "19/2d/34"
}

do_linux() {
    print_linux 0 "#192d34"
    print_linux 1 "#3e91ac"
    print_linux 2 "#cbbb4d"
    print_linux 3 "#ffeb66"
    print_linux 4 "#499fbc"
    print_linux 5 "#cbbb4d"
    print_linux 6 "#62b1cb"
    print_linux 7 "#7ba8b7"
    print_linux 8 "#3d6876"
    print_linux 9 "#d6c65c"
    print_linux 10 "#223c44"
    print_linux 11 "#335966"
    print_linux 12 "#467686"
    print_linux 13 "#a5d8e9"
    print_linux 14 "#c4b031"
    print_linux 15 "#e1f7ff"
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
