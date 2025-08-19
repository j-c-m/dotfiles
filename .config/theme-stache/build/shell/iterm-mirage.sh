#!/usr/bin/env bash

# Source:   iterm
# Theme:    Mirage
# Author:   unknown
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
    print_osc4 0 "01/16/27"
    print_osc4 1 "ff/99/99"
    print_osc4 2 "85/cc/95"
    print_osc4 3 "ff/d7/00"
    print_osc4 4 "7f/b5/ff"
    print_osc4 5 "dd/b3/ff"
    print_osc4 6 "21/c7/a8"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "57/56/56"
    print_osc4 9 "ff/99/99"
    print_osc4 10 "85/cc/95"
    print_osc4 11 "ff/d7/00"
    print_osc4 12 "7f/b5/ff"
    print_osc4 13 "dd/b3/ff"
    print_osc4 14 "85/cc/95"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a6/b2/c0"
    print_osc_rgb 11 "1b/27/38"
    print_osc_rgb 12 "dd/b3/ff"
    print_osc_rgb 17 "27/39/51"
    print_osc_rgb 19 "d3/db/e4"
}

do_linux() {
    print_linux 0 "#011627"
    print_linux 1 "#ff9999"
    print_linux 2 "#85cc95"
    print_linux 3 "#ffd700"
    print_linux 4 "#7fb5ff"
    print_linux 5 "#ddb3ff"
    print_linux 6 "#21c7a8"
    print_linux 7 "#a6b2c0"
    print_linux 8 "#575656"
    print_linux 9 "#ff9999"
    print_linux 10 "#85cc95"
    print_linux 11 "#ffd700"
    print_linux 12 "#7fb5ff"
    print_linux 13 "#ddb3ff"
    print_linux 14 "#85cc95"
    print_linux 15 "#ffffff"
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
