#!/usr/bin/env bash

# Source:   gogh
# Theme:    Apprentice
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
    print_osc4 0 "1c/1c/1c"
    print_osc4 1 "af/5f/5f"
    print_osc4 2 "5f/87/5f"
    print_osc4 3 "87/87/5f"
    print_osc4 4 "5f/87/af"
    print_osc4 5 "5f/5f/87"
    print_osc4 6 "5f/87/87"
    print_osc4 7 "6c/6c/6c"
    print_osc4 8 "44/44/44"
    print_osc4 9 "ff/87/00"
    print_osc4 10 "87/af/87"
    print_osc4 11 "ff/ff/af"
    print_osc4 12 "8f/af/d7"
    print_osc4 13 "87/87/af"
    print_osc4 14 "5f/af/af"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bc/bc/bc"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "bc/bc/bc"
    print_osc_rgb 17 "bc/bc/bc"
    print_osc_rgb 19 "26/26/26"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#af5f5f"
    print_linux 2 "#5f875f"
    print_linux 3 "#87875f"
    print_linux 4 "#5f87af"
    print_linux 5 "#5f5f87"
    print_linux 6 "#5f8787"
    print_linux 7 "#bcbcbc"
    print_linux 8 "#444444"
    print_linux 9 "#ff8700"
    print_linux 10 "#87af87"
    print_linux 11 "#ffffaf"
    print_linux 12 "#8fafd7"
    print_linux 13 "#8787af"
    print_linux 14 "#5fafaf"
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
