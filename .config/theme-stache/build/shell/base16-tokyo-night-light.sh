#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyo Night Light
# Author:   Michaël Ball
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
    print_osc4 0 "d5/d6/db"
    print_osc4 1 "34/3b/58"
    print_osc4 2 "48/5e/30"
    print_osc4 3 "16/67/75"
    print_osc4 4 "34/54/8a"
    print_osc4 5 "5a/4a/78"
    print_osc4 6 "3e/69/68"
    print_osc4 7 "34/3b/59"
    print_osc4 8 "96/99/a3"
    print_osc4 9 "34/3b/58"
    print_osc4 10 "48/5e/30"
    print_osc4 11 "16/67/75"
    print_osc4 12 "34/54/8a"
    print_osc4 13 "5a/4a/78"
    print_osc4 14 "3e/69/68"
    print_osc4 15 "1a/1b/26"

    print_osc_rgb 10 "34/3b/59"
    print_osc_rgb 11 "d5/d6/db"
    print_osc_rgb 12 "34/3b/59"
    print_osc_rgb 17 "1a/1b/26"
    print_osc_rgb 19 "cb/cc/d1"
}

do_linux() {
    print_linux 0 "#d5d6db"
    print_linux 1 "#343b58"
    print_linux 2 "#485e30"
    print_linux 3 "#166775"
    print_linux 4 "#34548a"
    print_linux 5 "#5a4a78"
    print_linux 6 "#3e6968"
    print_linux 7 "#343b59"
    print_linux 8 "#9699a3"
    print_linux 9 "#343b58"
    print_linux 10 "#485e30"
    print_linux 11 "#166775"
    print_linux 12 "#34548a"
    print_linux 13 "#5a4a78"
    print_linux 14 "#3e6968"
    print_linux 15 "#1a1b26"
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
