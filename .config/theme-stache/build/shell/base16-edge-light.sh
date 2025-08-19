#!/usr/bin/env bash

# Source:   base16
# Theme:    Edge Light
# Author:   cjayross (https://github.com/cjayross)
# Variant:  light

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
    print_osc4 0 "fa/fa/fa"
    print_osc4 1 "db/70/70"
    print_osc4 2 "7c/9f/4b"
    print_osc4 3 "d6/98/22"
    print_osc4 4 "65/87/bf"
    print_osc4 5 "b8/70/ce"
    print_osc4 6 "50/9c/93"
    print_osc4 7 "5e/64/6f"
    print_osc4 8 "5e/64/6f"
    print_osc4 9 "db/70/70"
    print_osc4 10 "7c/9f/4b"
    print_osc4 11 "d6/98/22"
    print_osc4 12 "65/87/bf"
    print_osc4 13 "b8/70/ce"
    print_osc4 14 "50/9c/93"
    print_osc4 15 "5e/64/6f"

    print_osc_rgb 10 "5e/64/6f"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "5e/64/6f"
    print_osc_rgb 17 "b8/70/ce"
    print_osc_rgb 19 "7c/9f/4b"
}

do_linux() {
    print_linux 0 "#fafafa"
    print_linux 1 "#db7070"
    print_linux 2 "#7c9f4b"
    print_linux 3 "#d69822"
    print_linux 4 "#6587bf"
    print_linux 5 "#b870ce"
    print_linux 6 "#509c93"
    print_linux 7 "#5e646f"
    print_linux 8 "#5e646f"
    print_linux 9 "#db7070"
    print_linux 10 "#7c9f4b"
    print_linux 11 "#d69822"
    print_linux 12 "#6587bf"
    print_linux 13 "#b870ce"
    print_linux 14 "#509c93"
    print_linux 15 "#5e646f"
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
