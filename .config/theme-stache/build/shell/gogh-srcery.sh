#!/usr/bin/env bash

# Source:   gogh
# Theme:    Srcery
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
    print_osc4 0 "1c/1b/19"
    print_osc4 1 "ef/2f/27"
    print_osc4 2 "51/9f/50"
    print_osc4 3 "fb/b8/29"
    print_osc4 4 "2c/78/bf"
    print_osc4 5 "e0/2c/6d"
    print_osc4 6 "0a/ae/b3"
    print_osc4 7 "ba/a6/7f"
    print_osc4 8 "91/81/75"
    print_osc4 9 "f7/53/41"
    print_osc4 10 "98/bc/37"
    print_osc4 11 "fe/d0/6e"
    print_osc4 12 "68/a8/e4"
    print_osc4 13 "ff/5c/8f"
    print_osc4 14 "2b/e4/d0"
    print_osc4 15 "fc/e8/c3"

    print_osc_rgb 10 "fc/e8/c3"
    print_osc_rgb 11 "1c/1b/19"
    print_osc_rgb 12 "fb/b8/29"
    print_osc_rgb 17 "fc/e8/c3"
    print_osc_rgb 19 "1c/1b/19"
}

do_linux() {
    print_linux 0 "#1c1b19"
    print_linux 1 "#ef2f27"
    print_linux 2 "#519f50"
    print_linux 3 "#fbb829"
    print_linux 4 "#2c78bf"
    print_linux 5 "#e02c6d"
    print_linux 6 "#0aaeb3"
    print_linux 7 "#fce8c3"
    print_linux 8 "#918175"
    print_linux 9 "#f75341"
    print_linux 10 "#98bc37"
    print_linux 11 "#fed06e"
    print_linux 12 "#68a8e4"
    print_linux 13 "#ff5c8f"
    print_linux 14 "#2be4d0"
    print_linux 15 "#fce8c3"
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
