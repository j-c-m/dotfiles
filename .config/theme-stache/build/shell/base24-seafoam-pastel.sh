#!/usr/bin/env bash

# Source:   base24
# Theme:    Seafoam Pastel
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "24/34/34"
    print_osc4 1 "82/5d/4d"
    print_osc4 2 "71/8c/61"
    print_osc4 3 "79/c3/cf"
    print_osc4 4 "4d/7b/82"
    print_osc4 5 "8a/71/67"
    print_osc4 6 "71/93/93"
    print_osc4 7 "ca/ca/ca"
    print_osc4 8 "9f/9f/9f"
    print_osc4 9 "cf/93/79"
    print_osc4 10 "98/d9/aa"
    print_osc4 11 "fa/e7/9d"
    print_osc4 12 "79/c3/cf"
    print_osc4 13 "d6/b2/a1"
    print_osc4 14 "ad/e0/e0"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "ca/ca/ca"
    print_osc_rgb 11 "24/34/34"
    print_osc_rgb 12 "ca/ca/ca"
    print_osc_rgb 17 "e0/e0/e0"
    print_osc_rgb 19 "75/75/75"
}

do_linux() {
    print_linux 0 "#243434"
    print_linux 1 "#825d4d"
    print_linux 2 "#718c61"
    print_linux 3 "#79c3cf"
    print_linux 4 "#4d7b82"
    print_linux 5 "#8a7167"
    print_linux 6 "#719393"
    print_linux 7 "#cacaca"
    print_linux 8 "#9f9f9f"
    print_linux 9 "#cf9379"
    print_linux 10 "#98d9aa"
    print_linux 11 "#fae79d"
    print_linux 12 "#79c3cf"
    print_linux 13 "#d6b2a1"
    print_linux 14 "#ade0e0"
    print_linux 15 "#e0e0e0"
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
