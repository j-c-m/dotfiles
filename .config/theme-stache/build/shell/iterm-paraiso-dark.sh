#!/usr/bin/env bash

# Source:   iterm
# Theme:    Paraiso Dark
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
    print_osc4 0 "2f/1e/2e"
    print_osc4 1 "ef/61/55"
    print_osc4 2 "48/b6/85"
    print_osc4 3 "fe/c4/18"
    print_osc4 4 "06/b6/ef"
    print_osc4 5 "81/5b/a4"
    print_osc4 6 "5b/c4/bf"
    print_osc4 7 "a3/9e/9b"
    print_osc4 8 "77/6e/71"
    print_osc4 9 "ef/61/55"
    print_osc4 10 "48/b6/85"
    print_osc4 11 "fe/c4/18"
    print_osc4 12 "06/b6/ef"
    print_osc4 13 "81/5b/a4"
    print_osc4 14 "5b/c4/bf"
    print_osc4 15 "e7/e9/db"

    print_osc_rgb 10 "a3/9e/9b"
    print_osc_rgb 11 "2f/1e/2e"
    print_osc_rgb 12 "a3/9e/9b"
    print_osc_rgb 17 "4f/42/4c"
    print_osc_rgb 19 "a3/9e/9b"
}

do_linux() {
    print_linux 0 "#2f1e2e"
    print_linux 1 "#ef6155"
    print_linux 2 "#48b685"
    print_linux 3 "#fec418"
    print_linux 4 "#06b6ef"
    print_linux 5 "#815ba4"
    print_linux 6 "#5bc4bf"
    print_linux 7 "#a39e9b"
    print_linux 8 "#776e71"
    print_linux 9 "#ef6155"
    print_linux 10 "#48b685"
    print_linux 11 "#fec418"
    print_linux 12 "#06b6ef"
    print_linux 13 "#815ba4"
    print_linux 14 "#5bc4bf"
    print_linux 15 "#e7e9db"
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
