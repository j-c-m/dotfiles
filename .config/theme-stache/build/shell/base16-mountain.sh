#!/usr/bin/env bash

# Source:   base16
# Theme:    Mountain
# Author:   gnsfujiwara (https://github.com/gnsfujiwara)
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
    print_osc4 0 "0f/0f/0f"
    print_osc4 1 "ac/8a/8c"
    print_osc4 2 "8a/ac/8b"
    print_osc4 3 "ac/a9/8a"
    print_osc4 4 "8f/8a/ac"
    print_osc4 5 "ac/8a/ac"
    print_osc4 6 "8a/ab/ac"
    print_osc4 7 "ca/ca/ca"
    print_osc4 8 "39/39/39"
    print_osc4 9 "ac/8a/8c"
    print_osc4 10 "8a/ac/8b"
    print_osc4 11 "ac/a9/8a"
    print_osc4 12 "8f/8a/ac"
    print_osc4 13 "ac/8a/ac"
    print_osc4 14 "8a/ab/ac"
    print_osc4 15 "f0/f0/f0"

    print_osc_rgb 10 "ca/ca/ca"
    print_osc_rgb 11 "0f/0f/0f"
    print_osc_rgb 12 "ca/ca/ca"
    print_osc_rgb 17 "e7/e7/e7"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#0f0f0f"
    print_linux 1 "#ac8a8c"
    print_linux 2 "#8aac8b"
    print_linux 3 "#aca98a"
    print_linux 4 "#8f8aac"
    print_linux 5 "#ac8aac"
    print_linux 6 "#8aabac"
    print_linux 7 "#cacaca"
    print_linux 8 "#393939"
    print_linux 9 "#ac8a8c"
    print_linux 10 "#8aac8b"
    print_linux 11 "#aca98a"
    print_linux 12 "#8f8aac"
    print_linux 13 "#ac8aac"
    print_linux 14 "#8aabac"
    print_linux 15 "#f0f0f0"
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
