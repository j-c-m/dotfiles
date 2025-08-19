#!/usr/bin/env bash

# Source:   base16
# Theme:    Valua
# Author:   Nonetrix (https://github.com/nonetrix)
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
    print_osc4 0 "13/1f/1f"
    print_osc4 1 "d7/58/6e"
    print_osc4 2 "59/d6/78"
    print_osc4 3 "df/e7/54"
    print_osc4 4 "4e/d2/d2"
    print_osc4 5 "a8/74/e0"
    print_osc4 6 "76/db/d2"
    print_osc4 7 "98/c1/a3"
    print_osc4 8 "3e/5c/53"
    print_osc4 9 "d7/58/6e"
    print_osc4 10 "59/d6/78"
    print_osc4 11 "df/e7/54"
    print_osc4 12 "4e/d2/d2"
    print_osc4 13 "a8/74/e0"
    print_osc4 14 "76/db/d2"
    print_osc4 15 "aa/cb/cb"

    print_osc_rgb 10 "98/c1/a3"
    print_osc_rgb 11 "13/1f/1f"
    print_osc_rgb 12 "98/c1/a3"
    print_osc_rgb 17 "a5/cb/b9"
    print_osc_rgb 19 "21/31/32"
}

do_linux() {
    print_linux 0 "#131f1f"
    print_linux 1 "#d7586e"
    print_linux 2 "#59d678"
    print_linux 3 "#dfe754"
    print_linux 4 "#4ed2d2"
    print_linux 5 "#a874e0"
    print_linux 6 "#76dbd2"
    print_linux 7 "#98c1a3"
    print_linux 8 "#3e5c53"
    print_linux 9 "#d7586e"
    print_linux 10 "#59d678"
    print_linux 11 "#dfe754"
    print_linux 12 "#4ed2d2"
    print_linux 13 "#a874e0"
    print_linux 14 "#76dbd2"
    print_linux 15 "#aacbcb"
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
