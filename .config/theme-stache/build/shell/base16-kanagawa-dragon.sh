#!/usr/bin/env bash

# Source:   base16
# Theme:    Kanagawa Dragon
# Author:   Tommaso Laurenzi (https://github.com/rebelot)
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
    print_osc4 0 "0d/0c/0c"
    print_osc4 1 "c4/74/6e"
    print_osc4 2 "87/a9/87"
    print_osc4 3 "c4/b2/8a"
    print_osc4 4 "8b/a4/b0"
    print_osc4 5 "89/92/a7"
    print_osc4 6 "8e/a4/a2"
    print_osc4 7 "c5/c9/c5"
    print_osc4 8 "73/7c/73"
    print_osc4 9 "c4/74/6e"
    print_osc4 10 "87/a9/87"
    print_osc4 11 "c4/b2/8a"
    print_osc4 12 "8b/a4/b0"
    print_osc4 13 "89/92/a7"
    print_osc4 14 "8e/a4/a2"
    print_osc4 15 "c5/c9/c5"

    print_osc_rgb 10 "c5/c9/c5"
    print_osc_rgb 11 "0d/0c/0c"
    print_osc_rgb 12 "c5/c9/c5"
    print_osc_rgb 17 "7a/83/82"
    print_osc_rgb 19 "1d/1c/19"
}

do_linux() {
    print_linux 0 "#0d0c0c"
    print_linux 1 "#c4746e"
    print_linux 2 "#87a987"
    print_linux 3 "#c4b28a"
    print_linux 4 "#8ba4b0"
    print_linux 5 "#8992a7"
    print_linux 6 "#8ea4a2"
    print_linux 7 "#c5c9c5"
    print_linux 8 "#737c73"
    print_linux 9 "#c4746e"
    print_linux 10 "#87a987"
    print_linux 11 "#c4b28a"
    print_linux 12 "#8ba4b0"
    print_linux 13 "#8992a7"
    print_linux 14 "#8ea4a2"
    print_linux 15 "#c5c9c5"
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
