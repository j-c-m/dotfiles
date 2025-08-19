#!/usr/bin/env bash

# Source:   gogh
# Theme:    Atelier Cave
# Author:   Bram de Haan (http://atelierbram.github.io/syntax-highlighting/atelier-schemes/cave)
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
    print_osc4 0 "19/17/1c"
    print_osc4 1 "be/46/78"
    print_osc4 2 "2a/92/92"
    print_osc4 3 "a0/6e/3b"
    print_osc4 4 "57/6d/db"
    print_osc4 5 "95/5a/e7"
    print_osc4 6 "39/8b/c6"
    print_osc4 7 "8b/87/92"
    print_osc4 8 "65/5f/6d"
    print_osc4 9 "aa/57/3c"
    print_osc4 10 "2a/92/92"
    print_osc4 11 "a0/6e/3b"
    print_osc4 12 "57/6d/db"
    print_osc4 13 "95/5a/e7"
    print_osc4 14 "39/8b/c6"
    print_osc4 15 "ef/ec/f4"

    print_osc_rgb 10 "7e/78/87"
    print_osc_rgb 11 "19/17/1c"
    print_osc_rgb 12 "7e/78/87"
    print_osc_rgb 17 "7e/78/87"
    print_osc_rgb 19 "19/17/1c"
}

do_linux() {
    print_linux 0 "#19171c"
    print_linux 1 "#be4678"
    print_linux 2 "#2a9292"
    print_linux 3 "#a06e3b"
    print_linux 4 "#576ddb"
    print_linux 5 "#955ae7"
    print_linux 6 "#398bc6"
    print_linux 7 "#7e7887"
    print_linux 8 "#655f6d"
    print_linux 9 "#aa573c"
    print_linux 10 "#2a9292"
    print_linux 11 "#a06e3b"
    print_linux 12 "#576ddb"
    print_linux 13 "#955ae7"
    print_linux 14 "#398bc6"
    print_linux 15 "#efecf4"
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
