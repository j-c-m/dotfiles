#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Drawbridge
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
    print_osc4 0 "1b/1f/32"
    print_osc4 1 "62/7a/f4"
    print_osc4 2 "67/c9/e4"
    print_osc4 3 "99/e9/ff"
    print_osc4 4 "72/89/fd"
    print_osc4 5 "67/c9/e4"
    print_osc4 6 "8b/9e/fd"
    print_osc4 7 "90/94/a7"
    print_osc4 8 "51/58/7b"
    print_osc4 9 "75/d5/f0"
    print_osc4 10 "25/2a/41"
    print_osc4 11 "44/4b/6f"
    print_osc4 12 "5e/65/87"
    print_osc4 13 "c3/cd/fe"
    print_osc4 14 "5c/bc/d6"
    print_osc4 15 "e1/e6/ff"

    print_osc_rgb 10 "90/94/a7"
    print_osc_rgb 11 "1b/1f/32"
    print_osc_rgb 12 "28/9d/bd"
    print_osc_rgb 17 "90/94/a7"
    print_osc_rgb 19 "1b/1f/32"
}

do_linux() {
    print_linux 0 "#1b1f32"
    print_linux 1 "#627af4"
    print_linux 2 "#67c9e4"
    print_linux 3 "#99e9ff"
    print_linux 4 "#7289fd"
    print_linux 5 "#67c9e4"
    print_linux 6 "#8b9efd"
    print_linux 7 "#9094a7"
    print_linux 8 "#51587b"
    print_linux 9 "#75d5f0"
    print_linux 10 "#252a41"
    print_linux 11 "#444b6f"
    print_linux 12 "#5e6587"
    print_linux 13 "#c3cdfe"
    print_linux 14 "#5cbcd6"
    print_linux 15 "#e1e6ff"
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
