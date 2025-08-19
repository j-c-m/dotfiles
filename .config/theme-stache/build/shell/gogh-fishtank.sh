#!/usr/bin/env bash

# Source:   gogh
# Theme:    Fishtank
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "03/07/3c"
    print_osc4 1 "c6/00/4a"
    print_osc4 2 "ac/f1/57"
    print_osc4 3 "fe/cd/5e"
    print_osc4 4 "52/5f/b8"
    print_osc4 5 "98/6f/82"
    print_osc4 6 "96/87/63"
    print_osc4 7 "ec/f0/fc"
    print_osc4 8 "6c/5b/30"
    print_osc4 9 "da/4b/8a"
    print_osc4 10 "db/ff/a9"
    print_osc4 11 "fe/e6/a9"
    print_osc4 12 "b2/be/fa"
    print_osc4 13 "fd/a5/cd"
    print_osc4 14 "a5/bd/86"
    print_osc4 15 "f6/ff/ec"

    print_osc_rgb 10 "ec/f0/fe"
    print_osc_rgb 11 "23/25/37"
    print_osc_rgb 12 "ec/f0/fe"
    print_osc_rgb 17 "ec/f0/fe"
    print_osc_rgb 19 "23/25/37"
}

do_linux() {
    print_linux 0 "#03073c"
    print_linux 1 "#c6004a"
    print_linux 2 "#acf157"
    print_linux 3 "#fecd5e"
    print_linux 4 "#525fb8"
    print_linux 5 "#986f82"
    print_linux 6 "#968763"
    print_linux 7 "#ecf0fe"
    print_linux 8 "#6c5b30"
    print_linux 9 "#da4b8a"
    print_linux 10 "#dbffa9"
    print_linux 11 "#fee6a9"
    print_linux 12 "#b2befa"
    print_linux 13 "#fda5cd"
    print_linux 14 "#a5bd86"
    print_linux 15 "#f6ffec"
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
