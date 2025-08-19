#!/usr/bin/env bash

# Source:   iterm
# Theme:    Afterglow
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
    print_osc4 0 "15/15/15"
    print_osc4 1 "ac/41/42"
    print_osc4 2 "7e/8d/50"
    print_osc4 3 "e5/b5/67"
    print_osc4 4 "6c/99/ba"
    print_osc4 5 "9e/4e/85"
    print_osc4 6 "7d/d5/cf"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "50/50/50"
    print_osc4 9 "ac/41/42"
    print_osc4 10 "7e/8d/50"
    print_osc4 11 "e5/b5/66"
    print_osc4 12 "6c/99/bb"
    print_osc4 13 "9e/4e/85"
    print_osc4 14 "7d/d5/cf"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "30/30/30"
    print_osc_rgb 19 "d0/d0/d0"
}

do_linux() {
    print_linux 0 "#151515"
    print_linux 1 "#ac4142"
    print_linux 2 "#7e8d50"
    print_linux 3 "#e5b567"
    print_linux 4 "#6c99ba"
    print_linux 5 "#9e4e85"
    print_linux 6 "#7dd5cf"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#505050"
    print_linux 9 "#ac4142"
    print_linux 10 "#7e8d50"
    print_linux 11 "#e5b566"
    print_linux 12 "#6c99bb"
    print_linux 13 "#9e4e85"
    print_linux 14 "#7dd5cf"
    print_linux 15 "#f5f5f5"
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
