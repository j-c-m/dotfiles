#!/usr/bin/env bash

# Source:   iterm
# Theme:    zenburned
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "3f/3f/3f"
    print_osc4 1 "e3/71/6e"
    print_osc4 2 "81/9b/69"
    print_osc4 3 "b7/7e/63"
    print_osc4 4 "60/99/c0"
    print_osc4 5 "b2/79/a7"
    print_osc4 6 "66/a5/ad"
    print_osc4 7 "f0/e4/cf"
    print_osc4 8 "62/5a/5b"
    print_osc4 9 "ec/86/85"
    print_osc4 10 "8b/ae/68"
    print_osc4 11 "d6/8c/67"
    print_osc4 12 "61/ab/da"
    print_osc4 13 "cf/86/c1"
    print_osc4 14 "65/b8/c1"
    print_osc4 15 "c0/ab/86"

    print_osc_rgb 10 "f0/e4/cf"
    print_osc_rgb 11 "3f/3f/3f"
    print_osc_rgb 12 "f3/ea/db"
    print_osc_rgb 17 "74/69/55"
    print_osc_rgb 19 "f0/e4/cf"
}

do_linux() {
    print_linux 0 "#3f3f3f"
    print_linux 1 "#e3716e"
    print_linux 2 "#819b69"
    print_linux 3 "#b77e63"
    print_linux 4 "#6099c0"
    print_linux 5 "#b279a7"
    print_linux 6 "#66a5ad"
    print_linux 7 "#f0e4cf"
    print_linux 8 "#625a5b"
    print_linux 9 "#ec8685"
    print_linux 10 "#8bae68"
    print_linux 11 "#d68c67"
    print_linux 12 "#61abda"
    print_linux 13 "#cf86c1"
    print_linux 14 "#65b8c1"
    print_linux 15 "#c0ab86"
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
