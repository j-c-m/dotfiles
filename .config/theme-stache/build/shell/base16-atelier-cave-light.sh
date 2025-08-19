#!/usr/bin/env bash

# Source:   base16
# Theme:    Atelier Cave Light
# Author:   Bram de Haan (http://atelierbramdehaan.nl)
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
    print_osc4 0 "ef/ec/f4"
    print_osc4 1 "be/46/78"
    print_osc4 2 "2a/92/92"
    print_osc4 3 "a0/6e/3b"
    print_osc4 4 "57/6d/db"
    print_osc4 5 "95/5a/e7"
    print_osc4 6 "39/8b/c6"
    print_osc4 7 "58/52/60"
    print_osc4 8 "7e/78/87"
    print_osc4 9 "be/46/78"
    print_osc4 10 "2a/92/92"
    print_osc4 11 "a0/6e/3b"
    print_osc4 12 "57/6d/db"
    print_osc4 13 "95/5a/e7"
    print_osc4 14 "39/8b/c6"
    print_osc4 15 "19/17/1c"

    print_osc_rgb 10 "58/52/60"
    print_osc_rgb 11 "ef/ec/f4"
    print_osc_rgb 12 "58/52/60"
    print_osc_rgb 17 "26/23/2a"
    print_osc_rgb 19 "e2/df/e7"
}

do_linux() {
    print_linux 0 "#efecf4"
    print_linux 1 "#be4678"
    print_linux 2 "#2a9292"
    print_linux 3 "#a06e3b"
    print_linux 4 "#576ddb"
    print_linux 5 "#955ae7"
    print_linux 6 "#398bc6"
    print_linux 7 "#585260"
    print_linux 8 "#7e7887"
    print_linux 9 "#be4678"
    print_linux 10 "#2a9292"
    print_linux 11 "#a06e3b"
    print_linux 12 "#576ddb"
    print_linux 13 "#955ae7"
    print_linux 14 "#398bc6"
    print_linux 15 "#19171c"
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
