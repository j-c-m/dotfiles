#!/usr/bin/env bash

# Source:   gogh
# Theme:    Modus Vivendi Tinted
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
    print_osc4 0 "0d/0e/1c"
    print_osc4 1 "ff/5f/59"
    print_osc4 2 "44/bc/44"
    print_osc4 3 "d0/bc/00"
    print_osc4 4 "2f/af/ff"
    print_osc4 5 "fe/ac/d0"
    print_osc4 6 "00/d3/d0"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "1d/22/35"
    print_osc4 9 "ff/5f/5f"
    print_osc4 10 "44/df/44"
    print_osc4 11 "ef/ef/00"
    print_osc4 12 "33/8f/ff"
    print_osc4 13 "ff/66/ff"
    print_osc4 14 "00/ef/f0"
    print_osc4 15 "98/98/98"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "0d/0e/1c"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "0d/0e/1c"
}

do_linux() {
    print_linux 0 "#0d0e1c"
    print_linux 1 "#ff5f59"
    print_linux 2 "#44bc44"
    print_linux 3 "#d0bc00"
    print_linux 4 "#2fafff"
    print_linux 5 "#feacd0"
    print_linux 6 "#00d3d0"
    print_linux 7 "#ffffff"
    print_linux 8 "#1d2235"
    print_linux 9 "#ff5f5f"
    print_linux 10 "#44df44"
    print_linux 11 "#efef00"
    print_linux 12 "#338fff"
    print_linux 13 "#ff66ff"
    print_linux 14 "#00eff0"
    print_linux 15 "#989898"
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
