#!/usr/bin/env bash

# Source:   gogh
# Theme:    Wild Cherry
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
    print_osc4 0 "00/05/07"
    print_osc4 1 "d9/40/85"
    print_osc4 2 "2a/b2/50"
    print_osc4 3 "ff/d1/6f"
    print_osc4 4 "88/3c/dc"
    print_osc4 5 "ec/ec/ec"
    print_osc4 6 "c1/b8/b7"
    print_osc4 7 "ff/f8/de"
    print_osc4 8 "00/9c/c9"
    print_osc4 9 "da/6b/ac"
    print_osc4 10 "f4/dc/a5"
    print_osc4 11 "ea/c0/66"
    print_osc4 12 "30/8c/ba"
    print_osc4 13 "ae/63/6b"
    print_osc4 14 "ff/91/9d"
    print_osc4 15 "e4/83/8d"

    print_osc_rgb 10 "da/fa/ff"
    print_osc_rgb 11 "1f/17/26"
    print_osc_rgb 12 "da/fa/ff"
    print_osc_rgb 17 "da/fa/ff"
    print_osc_rgb 19 "1f/17/26"
}

do_linux() {
    print_linux 0 "#000507"
    print_linux 1 "#d94085"
    print_linux 2 "#2ab250"
    print_linux 3 "#ffd16f"
    print_linux 4 "#883cdc"
    print_linux 5 "#ececec"
    print_linux 6 "#c1b8b7"
    print_linux 7 "#dafaff"
    print_linux 8 "#009cc9"
    print_linux 9 "#da6bac"
    print_linux 10 "#f4dca5"
    print_linux 11 "#eac066"
    print_linux 12 "#308cba"
    print_linux 13 "#ae636b"
    print_linux 14 "#ff919d"
    print_linux 15 "#e4838d"
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
