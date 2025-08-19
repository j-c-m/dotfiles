#!/usr/bin/env bash

# Source:   base16
# Theme:    Atlas
# Author:   Alex Lende (https://ajlende.com)
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
    print_osc4 0 "00/26/35"
    print_osc4 1 "ff/5a/67"
    print_osc4 2 "7f/c0/6e"
    print_osc4 3 "ff/cc/1b"
    print_osc4 4 "14/74/7e"
    print_osc4 5 "9a/70/a4"
    print_osc4 6 "5d/d7/b9"
    print_osc4 7 "a1/a1/9a"
    print_osc4 8 "6c/8b/91"
    print_osc4 9 "ff/5a/67"
    print_osc4 10 "7f/c0/6e"
    print_osc4 11 "ff/cc/1b"
    print_osc4 12 "14/74/7e"
    print_osc4 13 "9a/70/a4"
    print_osc4 14 "5d/d7/b9"
    print_osc4 15 "fa/fa/f8"

    print_osc_rgb 10 "a1/a1/9a"
    print_osc_rgb 11 "00/26/35"
    print_osc_rgb 12 "a1/a1/9a"
    print_osc_rgb 17 "e6/e6/dc"
    print_osc_rgb 19 "00/38/4d"
}

do_linux() {
    print_linux 0 "#002635"
    print_linux 1 "#ff5a67"
    print_linux 2 "#7fc06e"
    print_linux 3 "#ffcc1b"
    print_linux 4 "#14747e"
    print_linux 5 "#9a70a4"
    print_linux 6 "#5dd7b9"
    print_linux 7 "#a1a19a"
    print_linux 8 "#6c8b91"
    print_linux 9 "#ff5a67"
    print_linux 10 "#7fc06e"
    print_linux 11 "#ffcc1b"
    print_linux 12 "#14747e"
    print_linux 13 "#9a70a4"
    print_linux 14 "#5dd7b9"
    print_linux 15 "#fafaf8"
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
