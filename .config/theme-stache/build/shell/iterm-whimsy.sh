#!/usr/bin/env bash

# Source:   iterm
# Theme:    Whimsy
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
    print_osc4 0 "53/51/78"
    print_osc4 1 "ef/64/87"
    print_osc4 2 "5e/ca/89"
    print_osc4 3 "fd/d8/77"
    print_osc4 4 "65/ae/f7"
    print_osc4 5 "aa/7f/f0"
    print_osc4 6 "43/c1/be"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "53/51/77"
    print_osc4 9 "ef/64/87"
    print_osc4 10 "5e/ca/89"
    print_osc4 11 "fd/d8/77"
    print_osc4 12 "65/ae/f7"
    print_osc4 13 "aa/7f/f0"
    print_osc4 14 "43/c1/be"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b3/b0/d6"
    print_osc_rgb 11 "29/28/3b"
    print_osc_rgb 12 "b3/b0/d6"
    print_osc_rgb 17 "3d/3c/58"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#535178"
    print_linux 1 "#ef6487"
    print_linux 2 "#5eca89"
    print_linux 3 "#fdd877"
    print_linux 4 "#65aef7"
    print_linux 5 "#aa7ff0"
    print_linux 6 "#43c1be"
    print_linux 7 "#b3b0d6"
    print_linux 8 "#535177"
    print_linux 9 "#ef6487"
    print_linux 10 "#5eca89"
    print_linux 11 "#fdd877"
    print_linux 12 "#65aef7"
    print_linux 13 "#aa7ff0"
    print_linux 14 "#43c1be"
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
