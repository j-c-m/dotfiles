#!/usr/bin/env bash

# Source:   gogh
# Theme:    Vs Code Light+
# Author:   
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "02/02/02"
    print_osc4 1 "cd/32/32"
    print_osc4 2 "00/bc/00"
    print_osc4 3 "a5/a9/00"
    print_osc4 4 "07/52/a8"
    print_osc4 5 "bc/05/bc"
    print_osc4 6 "05/98/bc"
    print_osc4 7 "34/34/34"
    print_osc4 8 "5e/5e/5e"
    print_osc4 9 "cd/33/33"
    print_osc4 10 "1b/ce/1a"
    print_osc4 11 "ad/bb/5b"
    print_osc4 12 "07/52/a8"
    print_osc4 13 "c4/51/ce"
    print_osc4 14 "52/a8/c7"
    print_osc4 15 "a6/a3/a6"

    print_osc_rgb 10 "02/02/02"
    print_osc_rgb 11 "f9/f9/f9"
    print_osc_rgb 12 "02/02/02"
    print_osc_rgb 17 "02/02/02"
    print_osc_rgb 19 "f9/f9/f9"
}

do_linux() {
    print_linux 0 "#020202"
    print_linux 1 "#cd3232"
    print_linux 2 "#00bc00"
    print_linux 3 "#a5a900"
    print_linux 4 "#0752a8"
    print_linux 5 "#bc05bc"
    print_linux 6 "#0598bc"
    print_linux 7 "#020202"
    print_linux 8 "#5e5e5e"
    print_linux 9 "#cd3333"
    print_linux 10 "#1bce1a"
    print_linux 11 "#adbb5b"
    print_linux 12 "#0752a8"
    print_linux 13 "#c451ce"
    print_linux 14 "#52a8c7"
    print_linux 15 "#a6a3a6"
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
