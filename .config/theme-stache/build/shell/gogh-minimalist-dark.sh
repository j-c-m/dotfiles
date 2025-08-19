#!/usr/bin/env bash

# Source:   gogh
# Theme:    Minimalist Dark
# Author:   Gabriel Soares (https://github.com/Gabrielsoac)
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
    print_osc4 0 "f5/f5/f5"
    print_osc4 1 "b8/14/14"
    print_osc4 2 "1b/9f/6b"
    print_osc4 3 "d2/8f/79"
    print_osc4 4 "aa/5a/24"
    print_osc4 5 "9e/40/a3"
    print_osc4 6 "fe/83/30"
    print_osc4 7 "a5/a2/a2"
    print_osc4 8 "5c/58/55"
    print_osc4 9 "e8/bb/d0"
    print_osc4 10 "00/64/00"
    print_osc4 11 "4a/45/43"
    print_osc4 12 "a1/6a/94"
    print_osc4 13 "a0/20/f0"
    print_osc4 14 "ff/69/b4"
    print_osc4 15 "ca/ca/d0"

    print_osc_rgb 10 "f5/f5/f5"
    print_osc_rgb 11 "13/14/1f"
    print_osc_rgb 12 "f5/f5/f5"
    print_osc_rgb 17 "f5/f5/f5"
    print_osc_rgb 19 "13/14/1f"
}

do_linux() {
    print_linux 0 "#f5f5f5"
    print_linux 1 "#b81414"
    print_linux 2 "#1b9f6b"
    print_linux 3 "#d28f79"
    print_linux 4 "#aa5a24"
    print_linux 5 "#9e40a3"
    print_linux 6 "#fe8330"
    print_linux 7 "#f5f5f5"
    print_linux 8 "#5c5855"
    print_linux 9 "#e8bbd0"
    print_linux 10 "#006400"
    print_linux 11 "#4a4543"
    print_linux 12 "#a16a94"
    print_linux 13 "#a020f0"
    print_linux 14 "#ff69b4"
    print_linux 15 "#cacad0"
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
