#!/usr/bin/env bash

# Source:   iterm
# Theme:    3024 Day
# Author:   unknown
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
    print_osc4 0 "09/03/00"
    print_osc4 1 "db/2d/20"
    print_osc4 2 "01/a2/52"
    print_osc4 3 "fd/ed/02"
    print_osc4 4 "01/a0/e4"
    print_osc4 5 "a1/6a/94"
    print_osc4 6 "b5/e4/f4"
    print_osc4 7 "a5/a2/a2"
    print_osc4 8 "5c/58/55"
    print_osc4 9 "e8/bb/d0"
    print_osc4 10 "3a/34/32"
    print_osc4 11 "4a/45/43"
    print_osc4 12 "80/7d/7c"
    print_osc4 13 "d6/d5/d4"
    print_osc4 14 "cd/ab/53"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "4a/45/43"
    print_osc_rgb 11 "f7/f7/f7"
    print_osc_rgb 12 "4a/45/43"
    print_osc_rgb 17 "a5/a2/a2"
    print_osc_rgb 19 "4a/45/43"
}

do_linux() {
    print_linux 0 "#090300"
    print_linux 1 "#db2d20"
    print_linux 2 "#01a252"
    print_linux 3 "#fded02"
    print_linux 4 "#01a0e4"
    print_linux 5 "#a16a94"
    print_linux 6 "#b5e4f4"
    print_linux 7 "#4a4543"
    print_linux 8 "#5c5855"
    print_linux 9 "#e8bbd0"
    print_linux 10 "#3a3432"
    print_linux 11 "#4a4543"
    print_linux 12 "#807d7c"
    print_linux 13 "#d6d5d4"
    print_linux 14 "#cdab53"
    print_linux 15 "#f7f7f7"
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
