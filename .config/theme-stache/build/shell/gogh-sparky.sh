#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sparky
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
    print_osc4 0 "21/23/22"
    print_osc4 1 "ff/58/5d"
    print_osc4 2 "78/d6/4b"
    print_osc4 3 "fb/dd/40"
    print_osc4 4 "46/98/cb"
    print_osc4 5 "d5/9e/d7"
    print_osc4 6 "2d/cc/d3"
    print_osc4 7 "de/e6/de"
    print_osc4 8 "4b/4f/54"
    print_osc4 9 "ff/72/76"
    print_osc4 10 "8e/dd/65"
    print_osc4 11 "f6/eb/61"
    print_osc4 12 "69/b3/e7"
    print_osc4 13 "f9/9f/c9"
    print_osc4 14 "00/c1/d5"
    print_osc4 15 "d9/e1/e2"

    print_osc_rgb 10 "f4/f5/f0"
    print_osc_rgb 11 "07/2b/31"
    print_osc_rgb 12 "f4/f5/f0"
    print_osc_rgb 17 "f4/f5/f0"
    print_osc_rgb 19 "07/2b/31"
}

do_linux() {
    print_linux 0 "#212322"
    print_linux 1 "#ff585d"
    print_linux 2 "#78d64b"
    print_linux 3 "#fbdd40"
    print_linux 4 "#4698cb"
    print_linux 5 "#d59ed7"
    print_linux 6 "#2dccd3"
    print_linux 7 "#f4f5f0"
    print_linux 8 "#4b4f54"
    print_linux 9 "#ff7276"
    print_linux 10 "#8edd65"
    print_linux 11 "#f6eb61"
    print_linux 12 "#69b3e7"
    print_linux 13 "#f99fc9"
    print_linux 14 "#00c1d5"
    print_linux 15 "#d9e1e2"
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
