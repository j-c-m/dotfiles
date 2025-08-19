#!/usr/bin/env bash

# Source:   iterm
# Theme:    Hybrid
# Author:   unknown
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
    print_osc4 0 "2a/2e/33"
    print_osc4 1 "b7/4d/50"
    print_osc4 2 "b3/be/5a"
    print_osc4 3 "e3/b5/5e"
    print_osc4 4 "6d/90/b0"
    print_osc4 5 "a0/7e/ab"
    print_osc4 6 "7f/be/b3"
    print_osc4 7 "b5/b8/b6"
    print_osc4 8 "1d/1e/21"
    print_osc4 9 "8c/2d/32"
    print_osc4 10 "78/83/31"
    print_osc4 11 "e5/89/4f"
    print_osc4 12 "4b/6b/88"
    print_osc4 13 "6e/4f/79"
    print_osc4 14 "4d/7b/73"
    print_osc4 15 "5a/61/69"

    print_osc_rgb 10 "b7/bc/b9"
    print_osc_rgb 11 "16/17/18"
    print_osc_rgb 12 "b7/bc/b9"
    print_osc_rgb 17 "1e/1f/22"
    print_osc_rgb 19 "b7/bc/b9"
}

do_linux() {
    print_linux 0 "#2a2e33"
    print_linux 1 "#b74d50"
    print_linux 2 "#b3be5a"
    print_linux 3 "#e3b55e"
    print_linux 4 "#6d90b0"
    print_linux 5 "#a07eab"
    print_linux 6 "#7fbeb3"
    print_linux 7 "#b7bcb9"
    print_linux 8 "#1d1e21"
    print_linux 9 "#8c2d32"
    print_linux 10 "#788331"
    print_linux 11 "#e5894f"
    print_linux 12 "#4b6b88"
    print_linux 13 "#6e4f79"
    print_linux 14 "#4d7b73"
    print_linux 15 "#5a6169"
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
