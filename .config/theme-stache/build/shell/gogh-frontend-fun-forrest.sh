#!/usr/bin/env bash

# Source:   gogh
# Theme:    Frontend Fun Forrest
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "d6/26/2b"
    print_osc4 2 "91/9c/00"
    print_osc4 3 "be/8a/13"
    print_osc4 4 "46/99/a3"
    print_osc4 5 "8d/43/31"
    print_osc4 6 "da/82/13"
    print_osc4 7 "dd/c2/65"
    print_osc4 8 "7f/6a/55"
    print_osc4 9 "e5/5a/1c"
    print_osc4 10 "bf/c6/5a"
    print_osc4 11 "ff/cb/1b"
    print_osc4 12 "7c/c9/cf"
    print_osc4 13 "d2/63/49"
    print_osc4 14 "e6/a9/6b"
    print_osc4 15 "ff/ea/a3"

    print_osc_rgb 10 "de/c1/65"
    print_osc_rgb 11 "25/12/00"
    print_osc_rgb 12 "de/c1/65"
    print_osc_rgb 17 "de/c1/65"
    print_osc_rgb 19 "25/12/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d6262b"
    print_linux 2 "#919c00"
    print_linux 3 "#be8a13"
    print_linux 4 "#4699a3"
    print_linux 5 "#8d4331"
    print_linux 6 "#da8213"
    print_linux 7 "#dec165"
    print_linux 8 "#7f6a55"
    print_linux 9 "#e55a1c"
    print_linux 10 "#bfc65a"
    print_linux 11 "#ffcb1b"
    print_linux 12 "#7cc9cf"
    print_linux 13 "#d26349"
    print_linux 14 "#e6a96b"
    print_linux 15 "#ffeaa3"
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
