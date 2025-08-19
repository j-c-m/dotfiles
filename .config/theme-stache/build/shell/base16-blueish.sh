#!/usr/bin/env bash

# Source:   base16
# Theme:    Blueish
# Author:   Ben Mayoras
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
    print_osc4 0 "18/24/30"
    print_osc4 1 "4c/e5/87"
    print_osc4 2 "c3/e8/8d"
    print_osc4 3 "82/aa/ff"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "ff/84/dd"
    print_osc4 6 "5f/d1/ff"
    print_osc4 7 "c8/e1/f8"
    print_osc4 8 "61/6d/78"
    print_osc4 9 "4c/e5/87"
    print_osc4 10 "c3/e8/8d"
    print_osc4 11 "82/aa/ff"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "ff/84/dd"
    print_osc4 14 "5f/d1/ff"
    print_osc4 15 "8f/98/a0"

    print_osc_rgb 10 "c8/e1/f8"
    print_osc_rgb 11 "18/24/30"
    print_osc_rgb 12 "c8/e1/f8"
    print_osc_rgb 17 "dd/ea/f6"
    print_osc_rgb 19 "24/3c/54"
}

do_linux() {
    print_linux 0 "#182430"
    print_linux 1 "#4ce587"
    print_linux 2 "#c3e88d"
    print_linux 3 "#82aaff"
    print_linux 4 "#82aaff"
    print_linux 5 "#ff84dd"
    print_linux 6 "#5fd1ff"
    print_linux 7 "#c8e1f8"
    print_linux 8 "#616d78"
    print_linux 9 "#4ce587"
    print_linux 10 "#c3e88d"
    print_linux 11 "#82aaff"
    print_linux 12 "#82aaff"
    print_linux 13 "#ff84dd"
    print_linux 14 "#5fd1ff"
    print_linux 15 "#8f98a0"
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
