#!/usr/bin/env bash

# Source:   iterm
# Theme:    LightOwl
# Author:   unknown
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
    print_osc4 0 "40/3f/53"
    print_osc4 1 "de/3d/3b"
    print_osc4 2 "08/91/6a"
    print_osc4 3 "e0/af/02"
    print_osc4 4 "28/8e/d7"
    print_osc4 5 "d6/43/8a"
    print_osc4 6 "2a/a2/98"
    print_osc4 7 "f0/f0/f0"
    print_osc4 8 "98/9f/b1"
    print_osc4 9 "de/3d/3b"
    print_osc4 10 "08/91/6a"
    print_osc4 11 "da/aa/01"
    print_osc4 12 "28/8e/d7"
    print_osc4 13 "d6/43/8a"
    print_osc4 14 "2a/a2/98"
    print_osc4 15 "f0/f0/f0"

    print_osc_rgb 10 "40/3f/53"
    print_osc_rgb 11 "fb/fb/fb"
    print_osc_rgb 12 "40/3f/53"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "40/3f/53"
}

do_linux() {
    print_linux 0 "#403f53"
    print_linux 1 "#de3d3b"
    print_linux 2 "#08916a"
    print_linux 3 "#e0af02"
    print_linux 4 "#288ed7"
    print_linux 5 "#d6438a"
    print_linux 6 "#2aa298"
    print_linux 7 "#403f53"
    print_linux 8 "#989fb1"
    print_linux 9 "#de3d3b"
    print_linux 10 "#08916a"
    print_linux 11 "#daaa01"
    print_linux 12 "#288ed7"
    print_linux 13 "#d6438a"
    print_linux 14 "#2aa298"
    print_linux 15 "#f0f0f0"
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
