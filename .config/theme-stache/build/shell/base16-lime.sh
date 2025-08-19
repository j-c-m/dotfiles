#!/usr/bin/env bash

# Source:   base16
# Theme:    lime
# Author:   limelier
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
    print_osc4 0 "1a/1a/2f"
    print_osc4 1 "ff/66/2a"
    print_osc4 2 "8c/d9/7c"
    print_osc4 3 "ff/d1/5e"
    print_osc4 4 "2b/92/6f"
    print_osc4 5 "1b/82/5f"
    print_osc4 6 "4c/ad/83"
    print_osc4 7 "81/81/75"
    print_osc4 8 "31/31/40"
    print_osc4 9 "ff/66/2a"
    print_osc4 10 "8c/d9/7c"
    print_osc4 11 "ff/d1/5e"
    print_osc4 12 "2b/92/6f"
    print_osc4 13 "1b/82/5f"
    print_osc4 14 "4c/ad/83"
    print_osc4 15 "ff/f8/e1"

    print_osc_rgb 10 "81/81/75"
    print_osc_rgb 11 "1a/1a/2f"
    print_osc_rgb 12 "81/81/75"
    print_osc_rgb 17 "ff/f2/d1"
    print_osc_rgb 19 "20/20/30"
}

do_linux() {
    print_linux 0 "#1a1a2f"
    print_linux 1 "#ff662a"
    print_linux 2 "#8cd97c"
    print_linux 3 "#ffd15e"
    print_linux 4 "#2b926f"
    print_linux 5 "#1b825f"
    print_linux 6 "#4cad83"
    print_linux 7 "#818175"
    print_linux 8 "#313140"
    print_linux 9 "#ff662a"
    print_linux 10 "#8cd97c"
    print_linux 11 "#ffd15e"
    print_linux 12 "#2b926f"
    print_linux 13 "#1b825f"
    print_linux 14 "#4cad83"
    print_linux 15 "#fff8e1"
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
