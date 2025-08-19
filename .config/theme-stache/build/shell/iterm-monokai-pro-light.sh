#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro Light
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
    print_osc4 0 "fa/f4/f1"
    print_osc4 1 "e1/46/74"
    print_osc4 2 "25/9c/69"
    print_osc4 3 "cc/79/0a"
    print_osc4 4 "e1/5f/32"
    print_osc4 5 "70/57/bd"
    print_osc4 6 "1c/8b/a7"
    print_osc4 7 "28/24/2a"
    print_osc4 8 "a4/9f/a0"
    print_osc4 9 "e1/46/74"
    print_osc4 10 "25/9c/69"
    print_osc4 11 "cc/79/0a"
    print_osc4 12 "e1/5f/32"
    print_osc4 13 "70/57/bd"
    print_osc4 14 "1c/8b/a7"
    print_osc4 15 "28/24/2a"

    print_osc_rgb 10 "28/24/2a"
    print_osc_rgb 11 "fa/f4/f1"
    print_osc_rgb 12 "70/6a/6d"
    print_osc_rgb 17 "be/b9/b9"
    print_osc_rgb 19 "28/24/2a"
}

do_linux() {
    print_linux 0 "#faf4f1"
    print_linux 1 "#e14674"
    print_linux 2 "#259c69"
    print_linux 3 "#cc790a"
    print_linux 4 "#e15f32"
    print_linux 5 "#7057bd"
    print_linux 6 "#1c8ba7"
    print_linux 7 "#28242a"
    print_linux 8 "#a49fa0"
    print_linux 9 "#e14674"
    print_linux 10 "#259c69"
    print_linux 11 "#cc790a"
    print_linux 12 "#e15f32"
    print_linux 13 "#7057bd"
    print_linux 14 "#1c8ba7"
    print_linux 15 "#28242a"
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
