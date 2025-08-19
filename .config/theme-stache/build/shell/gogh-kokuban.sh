#!/usr/bin/env bash

# Source:   gogh
# Theme:    Kokuban
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
    print_osc4 0 "2e/87/44"
    print_osc4 1 "d8/4e/4c"
    print_osc4 2 "95/da/5a"
    print_osc4 3 "d6/e2/64"
    print_osc4 4 "4b/9e/d7"
    print_osc4 5 "94/5f/c5"
    print_osc4 6 "d8/9b/25"
    print_osc4 7 "d8/e2/d7"
    print_osc4 8 "34/93/4f"
    print_osc4 9 "ff/4f/59"
    print_osc4 10 "af/f5/6a"
    print_osc4 11 "fc/ff/75"
    print_osc4 12 "57/ae/ff"
    print_osc4 13 "ae/63/e9"
    print_osc4 14 "ff/aa/2b"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "d8/e2/d7"
    print_osc_rgb 11 "0d/4a/08"
    print_osc_rgb 12 "d8/e2/d7"
    print_osc_rgb 17 "d8/e2/d7"
    print_osc_rgb 19 "0d/4a/08"
}

do_linux() {
    print_linux 0 "#2e8744"
    print_linux 1 "#d84e4c"
    print_linux 2 "#95da5a"
    print_linux 3 "#d6e264"
    print_linux 4 "#4b9ed7"
    print_linux 5 "#945fc5"
    print_linux 6 "#d89b25"
    print_linux 7 "#d8e2d7"
    print_linux 8 "#34934f"
    print_linux 9 "#ff4f59"
    print_linux 10 "#aff56a"
    print_linux 11 "#fcff75"
    print_linux 12 "#57aeff"
    print_linux 13 "#ae63e9"
    print_linux 14 "#ffaa2b"
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
