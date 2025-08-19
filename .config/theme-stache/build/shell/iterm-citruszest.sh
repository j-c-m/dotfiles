#!/usr/bin/env bash

# Source:   iterm
# Theme:    citruszest
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
    print_osc4 0 "40/40/40"
    print_osc4 1 "ff/54/54"
    print_osc4 2 "00/cc/7a"
    print_osc4 3 "ff/d4/00"
    print_osc4 4 "00/bf/ff"
    print_osc4 5 "ff/8f/fd"
    print_osc4 6 "48/d1/cc"
    print_osc4 7 "bf/bf/bf"
    print_osc4 8 "80/80/80"
    print_osc4 9 "ff/1a/75"
    print_osc4 10 "1a/ff/a3"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "33/cf/ff"
    print_osc4 13 "ff/b1/fe"
    print_osc4 14 "00/ff/f2"
    print_osc4 15 "f9/f9/f9"

    print_osc_rgb 10 "bf/bf/bf"
    print_osc_rgb 11 "12/12/12"
    print_osc_rgb 12 "66/66/66"
    print_osc_rgb 17 "ff/8c/00"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#404040"
    print_linux 1 "#ff5454"
    print_linux 2 "#00cc7a"
    print_linux 3 "#ffd400"
    print_linux 4 "#00bfff"
    print_linux 5 "#ff8ffd"
    print_linux 6 "#48d1cc"
    print_linux 7 "#bfbfbf"
    print_linux 8 "#808080"
    print_linux 9 "#ff1a75"
    print_linux 10 "#1affa3"
    print_linux 11 "#ffff00"
    print_linux 12 "#33cfff"
    print_linux 13 "#ffb1fe"
    print_linux 14 "#00fff2"
    print_linux 15 "#f9f9f9"
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
