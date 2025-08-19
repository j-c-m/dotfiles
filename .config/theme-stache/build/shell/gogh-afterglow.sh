#!/usr/bin/env bash

# Source:   gogh
# Theme:    Afterglow
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
    print_osc4 0 "15/15/15"
    print_osc4 1 "a5/3c/23"
    print_osc4 2 "7b/92/46"
    print_osc4 3 "d3/a0/4d"
    print_osc4 4 "6c/99/bb"
    print_osc4 5 "9f/4e/85"
    print_osc4 6 "7d/d6/cf"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "50/50/50"
    print_osc4 9 "a5/3c/23"
    print_osc4 10 "7b/92/46"
    print_osc4 11 "d3/a0/4d"
    print_osc4 12 "54/7c/99"
    print_osc4 13 "9f/4e/85"
    print_osc4 14 "7d/d6/cf"
    print_osc4 15 "f5/f5/f5"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "d0/d0/d0"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#151515"
    print_linux 1 "#a53c23"
    print_linux 2 "#7b9246"
    print_linux 3 "#d3a04d"
    print_linux 4 "#6c99bb"
    print_linux 5 "#9f4e85"
    print_linux 6 "#7dd6cf"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#505050"
    print_linux 9 "#a53c23"
    print_linux 10 "#7b9246"
    print_linux 11 "#d3a04d"
    print_linux 12 "#547c99"
    print_linux 13 "#9f4e85"
    print_linux 14 "#7dd6cf"
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
