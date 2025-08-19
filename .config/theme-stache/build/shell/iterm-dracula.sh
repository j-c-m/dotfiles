#!/usr/bin/env bash

# Source:   iterm
# Theme:    Dracula
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
    print_osc4 0 "20/21/2b"
    print_osc4 1 "ff/54/54"
    print_osc4 2 "4f/fa/7b"
    print_osc4 3 "f1/fa/8b"
    print_osc4 4 "bd/93/f9"
    print_osc4 5 "ff/78/c6"
    print_osc4 6 "8b/e8/fd"
    print_osc4 7 "f7/f7/f1"
    print_osc4 8 "61/72/a3"
    print_osc4 9 "ff/6e/6e"
    print_osc4 10 "69/ff/94"
    print_osc4 11 "ff/ff/a5"
    print_osc4 12 "d5/ab/ff"
    print_osc4 13 "ff/91/de"
    print_osc4 14 "a3/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "f7/f7/f1"
    print_osc_rgb 11 "28/29/36"
    print_osc_rgb 12 "f7/f7/f1"
    print_osc_rgb 17 "44/46/59"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#20212b"
    print_linux 1 "#ff5454"
    print_linux 2 "#4ffa7b"
    print_linux 3 "#f1fa8b"
    print_linux 4 "#bd93f9"
    print_linux 5 "#ff78c6"
    print_linux 6 "#8be8fd"
    print_linux 7 "#f7f7f1"
    print_linux 8 "#6172a3"
    print_linux 9 "#ff6e6e"
    print_linux 10 "#69ff94"
    print_linux 11 "#ffffa5"
    print_linux 12 "#d5abff"
    print_linux 13 "#ff91de"
    print_linux 14 "#a3ffff"
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
