#!/usr/bin/env bash

# Source:   iterm
# Theme:    Vesper
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
    print_osc4 0 "10/10/10"
    print_osc4 1 "f5/a1/91"
    print_osc4 2 "90/b9/9f"
    print_osc4 3 "e6/b9/9d"
    print_osc4 4 "ac/a1/cf"
    print_osc4 5 "e2/9e/ca"
    print_osc4 6 "ea/83/a5"
    print_osc4 7 "a0/a0/a0"
    print_osc4 8 "7e/7e/7e"
    print_osc4 9 "ff/80/80"
    print_osc4 10 "99/ff/e4"
    print_osc4 11 "ff/c7/99"
    print_osc4 12 "b9/ae/da"
    print_osc4 13 "ec/aa/d6"
    print_osc4 14 "f5/91/b2"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "ac/b1/ab"
    print_osc_rgb 17 "98/80/49"
    print_osc_rgb 19 "ac/b1/ab"
}

do_linux() {
    print_linux 0 "#101010"
    print_linux 1 "#f5a191"
    print_linux 2 "#90b99f"
    print_linux 3 "#e6b99d"
    print_linux 4 "#aca1cf"
    print_linux 5 "#e29eca"
    print_linux 6 "#ea83a5"
    print_linux 7 "#ffffff"
    print_linux 8 "#7e7e7e"
    print_linux 9 "#ff8080"
    print_linux 10 "#99ffe4"
    print_linux 11 "#ffc799"
    print_linux 12 "#b9aeda"
    print_linux 13 "#ecaad6"
    print_linux 14 "#f591b2"
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
