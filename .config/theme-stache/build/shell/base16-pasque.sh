#!/usr/bin/env bash

# Source:   base16
# Theme:    Pasque
# Author:   Gabriel Fontes (https://github.com/Misterio77)
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
    print_osc4 0 "27/1c/3a"
    print_osc4 1 "a9/22/58"
    print_osc4 2 "c6/91/4b"
    print_osc4 3 "80/4e/ad"
    print_osc4 4 "8e/7d/c6"
    print_osc4 5 "95/3b/9d"
    print_osc4 6 "72/63/aa"
    print_osc4 7 "de/dc/df"
    print_osc4 8 "5d/57/66"
    print_osc4 9 "a9/22/58"
    print_osc4 10 "c6/91/4b"
    print_osc4 11 "80/4e/ad"
    print_osc4 12 "8e/7d/c6"
    print_osc4 13 "95/3b/9d"
    print_osc4 14 "72/63/aa"
    print_osc4 15 "bb/aa/dd"

    print_osc_rgb 10 "de/dc/df"
    print_osc_rgb 11 "27/1c/3a"
    print_osc_rgb 12 "de/dc/df"
    print_osc_rgb 17 "ed/ea/ef"
    print_osc_rgb 19 "10/03/23"
}

do_linux() {
    print_linux 0 "#271c3a"
    print_linux 1 "#a92258"
    print_linux 2 "#c6914b"
    print_linux 3 "#804ead"
    print_linux 4 "#8e7dc6"
    print_linux 5 "#953b9d"
    print_linux 6 "#7263aa"
    print_linux 7 "#dedcdf"
    print_linux 8 "#5d5766"
    print_linux 9 "#a92258"
    print_linux 10 "#c6914b"
    print_linux 11 "#804ead"
    print_linux 12 "#8e7dc6"
    print_linux 13 "#953b9d"
    print_linux 14 "#7263aa"
    print_linux 15 "#bbaadd"
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
