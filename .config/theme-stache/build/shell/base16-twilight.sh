#!/usr/bin/env bash

# Source:   base16
# Theme:    Twilight
# Author:   David Hart (https://github.com/hartbit)
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
    print_osc4 0 "1e/1e/1e"
    print_osc4 1 "cf/6a/4c"
    print_osc4 2 "8f/9d/6a"
    print_osc4 3 "f9/ee/98"
    print_osc4 4 "75/87/a6"
    print_osc4 5 "9b/85/9d"
    print_osc4 6 "af/c4/db"
    print_osc4 7 "a7/a7/a7"
    print_osc4 8 "5f/5a/60"
    print_osc4 9 "cf/6a/4c"
    print_osc4 10 "8f/9d/6a"
    print_osc4 11 "f9/ee/98"
    print_osc4 12 "75/87/a6"
    print_osc4 13 "9b/85/9d"
    print_osc4 14 "af/c4/db"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a7/a7/a7"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "a7/a7/a7"
    print_osc_rgb 17 "c3/c3/c3"
    print_osc_rgb 19 "32/35/37"
}

do_linux() {
    print_linux 0 "#1e1e1e"
    print_linux 1 "#cf6a4c"
    print_linux 2 "#8f9d6a"
    print_linux 3 "#f9ee98"
    print_linux 4 "#7587a6"
    print_linux 5 "#9b859d"
    print_linux 6 "#afc4db"
    print_linux 7 "#a7a7a7"
    print_linux 8 "#5f5a60"
    print_linux 9 "#cf6a4c"
    print_linux 10 "#8f9d6a"
    print_linux 11 "#f9ee98"
    print_linux 12 "#7587a6"
    print_linux 13 "#9b859d"
    print_linux 14 "#afc4db"
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
