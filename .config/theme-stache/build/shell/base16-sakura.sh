#!/usr/bin/env bash

# Source:   base16
# Theme:    Sakura
# Author:   Misterio77 (http://github.com/Misterio77)
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
    print_osc4 0 "fe/ed/f3"
    print_osc4 1 "df/2d/52"
    print_osc4 2 "2e/91/6d"
    print_osc4 3 "c2/94/61"
    print_osc4 4 "00/6e/93"
    print_osc4 5 "5e/21/80"
    print_osc4 6 "1d/89/91"
    print_osc4 7 "56/44/48"
    print_osc4 8 "75/5f/64"
    print_osc4 9 "df/2d/52"
    print_osc4 10 "2e/91/6d"
    print_osc4 11 "c2/94/61"
    print_osc4 12 "00/6e/93"
    print_osc4 13 "5e/21/80"
    print_osc4 14 "1d/89/91"
    print_osc4 15 "33/29/2b"

    print_osc_rgb 10 "56/44/48"
    print_osc_rgb 11 "fe/ed/f3"
    print_osc_rgb 12 "56/44/48"
    print_osc_rgb 17 "42/38/3a"
    print_osc_rgb 19 "f8/e2/e7"
}

do_linux() {
    print_linux 0 "#feedf3"
    print_linux 1 "#df2d52"
    print_linux 2 "#2e916d"
    print_linux 3 "#c29461"
    print_linux 4 "#006e93"
    print_linux 5 "#5e2180"
    print_linux 6 "#1d8991"
    print_linux 7 "#564448"
    print_linux 8 "#755f64"
    print_linux 9 "#df2d52"
    print_linux 10 "#2e916d"
    print_linux 11 "#c29461"
    print_linux 12 "#006e93"
    print_linux 13 "#5e2180"
    print_linux 14 "#1d8991"
    print_linux 15 "#33292b"
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
