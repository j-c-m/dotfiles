#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tokyo Night Light
# Author:   
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
    print_osc4 0 "0f/0f/14"
    print_osc4 1 "8c/43/51"
    print_osc4 2 "48/5e/30"
    print_osc4 3 "8f/5e/15"
    print_osc4 4 "34/54/8a"
    print_osc4 5 "5a/4a/78"
    print_osc4 6 "0f/4b/6e"
    print_osc4 7 "34/3b/58"
    print_osc4 8 "96/99/a3"
    print_osc4 9 "8c/43/51"
    print_osc4 10 "48/5e/30"
    print_osc4 11 "8f/5e/15"
    print_osc4 12 "34/54/8a"
    print_osc4 13 "5a/4a/78"
    print_osc4 14 "0f/4b/6e"
    print_osc4 15 "34/3b/58"

    print_osc_rgb 10 "56/5a/6e"
    print_osc_rgb 11 "d5/d6/db"
    print_osc_rgb 12 "56/5a/6e"
    print_osc_rgb 17 "56/5a/6e"
    print_osc_rgb 19 "d5/d6/db"
}

do_linux() {
    print_linux 0 "#0f0f14"
    print_linux 1 "#8c4351"
    print_linux 2 "#485e30"
    print_linux 3 "#8f5e15"
    print_linux 4 "#34548a"
    print_linux 5 "#5a4a78"
    print_linux 6 "#0f4b6e"
    print_linux 7 "#565a6e"
    print_linux 8 "#9699a3"
    print_linux 9 "#8c4351"
    print_linux 10 "#485e30"
    print_linux 11 "#8f5e15"
    print_linux 12 "#34548a"
    print_linux 13 "#5a4a78"
    print_linux 14 "#0f4b6e"
    print_linux 15 "#343b58"
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
