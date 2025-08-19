#!/usr/bin/env bash

# Source:   base16
# Theme:    Seti UI
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
    print_osc4 0 "15/17/18"
    print_osc4 1 "cd/3f/45"
    print_osc4 2 "9f/ca/56"
    print_osc4 3 "e6/cd/69"
    print_osc4 4 "55/b5/db"
    print_osc4 5 "a0/74/c4"
    print_osc4 6 "55/db/be"
    print_osc4 7 "d6/d6/d6"
    print_osc4 8 "41/53/5b"
    print_osc4 9 "cd/3f/45"
    print_osc4 10 "9f/ca/56"
    print_osc4 11 "e6/cd/69"
    print_osc4 12 "55/b5/db"
    print_osc4 13 "a0/74/c4"
    print_osc4 14 "55/db/be"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d6/d6/d6"
    print_osc_rgb 11 "15/17/18"
    print_osc_rgb 12 "d6/d6/d6"
    print_osc_rgb 17 "ee/ee/ee"
    print_osc_rgb 19 "28/2a/2b"
}

do_linux() {
    print_linux 0 "#151718"
    print_linux 1 "#cd3f45"
    print_linux 2 "#9fca56"
    print_linux 3 "#e6cd69"
    print_linux 4 "#55b5db"
    print_linux 5 "#a074c4"
    print_linux 6 "#55dbbe"
    print_linux 7 "#d6d6d6"
    print_linux 8 "#41535b"
    print_linux 9 "#cd3f45"
    print_linux 10 "#9fca56"
    print_linux 11 "#e6cd69"
    print_linux 12 "#55b5db"
    print_linux 13 "#a074c4"
    print_linux 14 "#55dbbe"
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
