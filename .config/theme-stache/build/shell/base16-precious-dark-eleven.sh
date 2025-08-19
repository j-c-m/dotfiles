#!/usr/bin/env bash

# Source:   base16
# Theme:    Precious Dark Eleven
# Author:   4lex4 &lt;4lex49@zoho.com&gt;
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
    print_osc4 0 "1c/1e/20"
    print_osc4 1 "ff/87/82"
    print_osc4 2 "95/b6/58"
    print_osc4 3 "d0/a5/43"
    print_osc4 4 "68/b0/ee"
    print_osc4 5 "b7/99/fe"
    print_osc4 6 "42/bd/a7"
    print_osc4 7 "b8/b7/b6"
    print_osc4 8 "85/85/85"
    print_osc4 9 "ff/87/82"
    print_osc4 10 "95/b6/58"
    print_osc4 11 "d0/a5/43"
    print_osc4 12 "68/b0/ee"
    print_osc4 13 "b7/99/fe"
    print_osc4 14 "42/bd/a7"
    print_osc4 15 "b8/b7/b6"

    print_osc_rgb 10 "b8/b7/b6"
    print_osc_rgb 11 "1c/1e/20"
    print_osc_rgb 12 "b8/b7/b6"
    print_osc_rgb 17 "b8/b7/b6"
    print_osc_rgb 19 "29/2b/2d"
}

do_linux() {
    print_linux 0 "#1c1e20"
    print_linux 1 "#ff8782"
    print_linux 2 "#95b658"
    print_linux 3 "#d0a543"
    print_linux 4 "#68b0ee"
    print_linux 5 "#b799fe"
    print_linux 6 "#42bda7"
    print_linux 7 "#b8b7b6"
    print_linux 8 "#858585"
    print_linux 9 "#ff8782"
    print_linux 10 "#95b658"
    print_linux 11 "#d0a543"
    print_linux 12 "#68b0ee"
    print_linux 13 "#b799fe"
    print_linux 14 "#42bda7"
    print_linux 15 "#b8b7b6"
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
