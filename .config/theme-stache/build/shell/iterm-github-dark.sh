#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitHub Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f7/81/66"
    print_osc4 2 "56/d3/64"
    print_osc4 3 "e3/b3/41"
    print_osc4 4 "6c/a4/f8"
    print_osc4 5 "db/61/a2"
    print_osc4 6 "2b/74/89"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "4c/4c/4c"
    print_osc4 9 "f7/81/66"
    print_osc4 10 "56/d3/64"
    print_osc4 11 "e3/b3/41"
    print_osc4 12 "6c/a4/f8"
    print_osc4 13 "db/61/a2"
    print_osc4 14 "2b/74/89"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "8b/94/9e"
    print_osc_rgb 11 "10/12/16"
    print_osc_rgb 12 "c9/d1/d9"
    print_osc_rgb 17 "3b/50/70"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f78166"
    print_linux 2 "#56d364"
    print_linux 3 "#e3b341"
    print_linux 4 "#6ca4f8"
    print_linux 5 "#db61a2"
    print_linux 6 "#2b7489"
    print_linux 7 "#8b949e"
    print_linux 8 "#4c4c4c"
    print_linux 9 "#f78166"
    print_linux 10 "#56d364"
    print_linux 11 "#e3b341"
    print_linux 12 "#6ca4f8"
    print_linux 13 "#db61a2"
    print_linux 14 "#2b7489"
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
