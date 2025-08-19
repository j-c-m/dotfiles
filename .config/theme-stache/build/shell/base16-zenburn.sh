#!/usr/bin/env bash

# Source:   base16
# Theme:    Zenburn
# Author:   elnawe
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
    print_osc4 0 "38/38/38"
    print_osc4 1 "dc/a3/a3"
    print_osc4 2 "5f/7f/5f"
    print_osc4 3 "e0/cf/9f"
    print_osc4 4 "7c/b8/bb"
    print_osc4 5 "dc/8c/c3"
    print_osc4 6 "93/e0/e3"
    print_osc4 7 "dc/dc/cc"
    print_osc4 8 "6f/6f/6f"
    print_osc4 9 "dc/a3/a3"
    print_osc4 10 "5f/7f/5f"
    print_osc4 11 "e0/cf/9f"
    print_osc4 12 "7c/b8/bb"
    print_osc4 13 "dc/8c/c3"
    print_osc4 14 "93/e0/e3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "dc/dc/cc"
    print_osc_rgb 11 "38/38/38"
    print_osc_rgb 12 "dc/dc/cc"
    print_osc_rgb 17 "c0/c0/c0"
    print_osc_rgb 19 "40/40/40"
}

do_linux() {
    print_linux 0 "#383838"
    print_linux 1 "#dca3a3"
    print_linux 2 "#5f7f5f"
    print_linux 3 "#e0cf9f"
    print_linux 4 "#7cb8bb"
    print_linux 5 "#dc8cc3"
    print_linux 6 "#93e0e3"
    print_linux 7 "#dcdccc"
    print_linux 8 "#6f6f6f"
    print_linux 9 "#dca3a3"
    print_linux 10 "#5f7f5f"
    print_linux 11 "#e0cf9f"
    print_linux 12 "#7cb8bb"
    print_linux 13 "#dc8cc3"
    print_linux 14 "#93e0e3"
    print_linux 15 "#ffffff"
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
