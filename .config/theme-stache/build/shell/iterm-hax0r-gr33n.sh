#!/usr/bin/env bash

# Source:   iterm
# Theme:    HaX0R_GR33N
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/1f/0b"
    print_osc4 1 "15/d0/0d"
    print_osc4 2 "15/d0/0d"
    print_osc4 3 "15/d0/0d"
    print_osc4 4 "15/d0/0d"
    print_osc4 5 "15/d0/0d"
    print_osc4 6 "15/d0/0d"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "00/15/10"
    print_osc4 9 "19/e2/0e"
    print_osc4 10 "19/e2/0e"
    print_osc4 11 "19/e2/0e"
    print_osc4 12 "19/e2/0e"
    print_osc4 13 "19/e2/0e"
    print_osc4 14 "19/e2/0e"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "15/b0/0d"
    print_osc_rgb 11 "01/0f/01"
    print_osc_rgb 12 "15/d0/0d"
    print_osc_rgb 17 "d4/ff/c1"
    print_osc_rgb 19 "fd/fd/fd"
}

do_linux() {
    print_linux 0 "#001f0b"
    print_linux 1 "#15d00d"
    print_linux 2 "#15d00d"
    print_linux 3 "#15d00d"
    print_linux 4 "#15d00d"
    print_linux 5 "#15d00d"
    print_linux 6 "#15d00d"
    print_linux 7 "#15b00d"
    print_linux 8 "#001510"
    print_linux 9 "#19e20e"
    print_linux 10 "#19e20e"
    print_linux 11 "#19e20e"
    print_linux 12 "#19e20e"
    print_linux 13 "#19e20e"
    print_linux 14 "#19e20e"
    print_linux 15 "#fefefe"
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
