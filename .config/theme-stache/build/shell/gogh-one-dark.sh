#!/usr/bin/env bash

# Source:   gogh
# Theme:    One Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "e0/6c/75"
    print_osc4 2 "98/c3/79"
    print_osc4 3 "d1/9a/66"
    print_osc4 4 "61/af/ef"
    print_osc4 5 "c6/78/dd"
    print_osc4 6 "56/b6/c2"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "5c/63/70"
    print_osc4 9 "e0/6c/75"
    print_osc4 10 "98/c3/79"
    print_osc4 11 "d1/9a/66"
    print_osc4 12 "61/af/ef"
    print_osc4 13 "c6/78/dd"
    print_osc4 14 "56/b6/c2"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "5c/63/70"
    print_osc_rgb 11 "1e/21/27"
    print_osc_rgb 12 "5c/63/70"
    print_osc_rgb 17 "5c/63/70"
    print_osc_rgb 19 "1e/21/27"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e06c75"
    print_linux 2 "#98c379"
    print_linux 3 "#d19a66"
    print_linux 4 "#61afef"
    print_linux 5 "#c678dd"
    print_linux 6 "#56b6c2"
    print_linux 7 "#5c6370"
    print_linux 8 "#5c6370"
    print_linux 9 "#e06c75"
    print_linux 10 "#98c379"
    print_linux 11 "#d19a66"
    print_linux 12 "#61afef"
    print_linux 13 "#c678dd"
    print_linux 14 "#56b6c2"
    print_linux 15 "#fffefe"
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
