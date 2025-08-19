#!/usr/bin/env bash

# Source:   iterm
# Theme:    Chalk
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
    print_osc4 0 "7c/8a/8f"
    print_osc4 1 "b2/3a/51"
    print_osc4 2 "78/9a/69"
    print_osc4 3 "b9/ab/4a"
    print_osc4 4 "2a/7f/ac"
    print_osc4 5 "bc/4f/5a"
    print_osc4 6 "44/a7/99"
    print_osc4 7 "d2/d8/d9"
    print_osc4 8 "88/88/88"
    print_osc4 9 "f2/48/40"
    print_osc4 10 "80/c4/6f"
    print_osc4 11 "ff/eb/62"
    print_osc4 12 "40/95/ff"
    print_osc4 13 "fb/51/75"
    print_osc4 14 "52/cc/bd"
    print_osc4 15 "d2/d8/d9"

    print_osc_rgb 10 "d2/d8/d9"
    print_osc_rgb 11 "2b/2c/2e"
    print_osc_rgb 12 "70/81/83"
    print_osc_rgb 17 "e3/e8/ed"
    print_osc_rgb 19 "3e/3f/41"
}

do_linux() {
    print_linux 0 "#7c8a8f"
    print_linux 1 "#b23a51"
    print_linux 2 "#789a69"
    print_linux 3 "#b9ab4a"
    print_linux 4 "#2a7fac"
    print_linux 5 "#bc4f5a"
    print_linux 6 "#44a799"
    print_linux 7 "#d2d8d9"
    print_linux 8 "#888888"
    print_linux 9 "#f24840"
    print_linux 10 "#80c46f"
    print_linux 11 "#ffeb62"
    print_linux 12 "#4095ff"
    print_linux 13 "#fb5175"
    print_linux 14 "#52ccbd"
    print_linux 15 "#d2d8d9"
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
