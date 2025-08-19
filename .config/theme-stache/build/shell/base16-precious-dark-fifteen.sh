#!/usr/bin/env bash

# Source:   base16
# Theme:    Precious Dark Fifteen
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
    print_osc4 0 "23/26/2b"
    print_osc4 1 "ff/87/82"
    print_osc4 2 "95/b6/59"
    print_osc4 3 "cf/a5/46"
    print_osc4 4 "66/b0/ef"
    print_osc4 5 "b7/99/ff"
    print_osc4 6 "42/bd/a7"
    print_osc4 7 "ba/b9/b6"
    print_osc4 8 "89/89/89"
    print_osc4 9 "ff/87/82"
    print_osc4 10 "95/b6/59"
    print_osc4 11 "cf/a5/46"
    print_osc4 12 "66/b0/ef"
    print_osc4 13 "b7/99/ff"
    print_osc4 14 "42/bd/a7"
    print_osc4 15 "ba/b9/b6"

    print_osc_rgb 10 "ba/b9/b6"
    print_osc_rgb 11 "23/26/2b"
    print_osc_rgb 12 "ba/b9/b6"
    print_osc_rgb 17 "ba/b9/b6"
    print_osc_rgb 19 "30/33/37"
}

do_linux() {
    print_linux 0 "#23262b"
    print_linux 1 "#ff8782"
    print_linux 2 "#95b659"
    print_linux 3 "#cfa546"
    print_linux 4 "#66b0ef"
    print_linux 5 "#b799ff"
    print_linux 6 "#42bda7"
    print_linux 7 "#bab9b6"
    print_linux 8 "#898989"
    print_linux 9 "#ff8782"
    print_linux 10 "#95b659"
    print_linux 11 "#cfa546"
    print_linux 12 "#66b0ef"
    print_linux 13 "#b799ff"
    print_linux 14 "#42bda7"
    print_linux 15 "#bab9b6"
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
