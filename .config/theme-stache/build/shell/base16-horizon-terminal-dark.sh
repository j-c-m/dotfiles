#!/usr/bin/env bash

# Source:   base16
# Theme:    Horizon Terminal Dark
# Author:   Michaël Ball (http://github.com/michael-ball/)
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
    print_osc4 0 "1c/1e/26"
    print_osc4 1 "e9/56/78"
    print_osc4 2 "29/d3/98"
    print_osc4 3 "fa/c2/9a"
    print_osc4 4 "26/bb/d9"
    print_osc4 5 "ee/64/ac"
    print_osc4 6 "59/e1/e3"
    print_osc4 7 "cb/ce/d0"
    print_osc4 8 "6f/6f/70"
    print_osc4 9 "e9/56/78"
    print_osc4 10 "29/d3/98"
    print_osc4 11 "fa/c2/9a"
    print_osc4 12 "26/bb/d9"
    print_osc4 13 "ee/64/ac"
    print_osc4 14 "59/e1/e3"
    print_osc4 15 "e3/e6/ee"

    print_osc_rgb 10 "cb/ce/d0"
    print_osc_rgb 11 "1c/1e/26"
    print_osc_rgb 12 "cb/ce/d0"
    print_osc_rgb 17 "dc/df/e4"
    print_osc_rgb 19 "23/25/30"
}

do_linux() {
    print_linux 0 "#1c1e26"
    print_linux 1 "#e95678"
    print_linux 2 "#29d398"
    print_linux 3 "#fac29a"
    print_linux 4 "#26bbd9"
    print_linux 5 "#ee64ac"
    print_linux 6 "#59e1e3"
    print_linux 7 "#cbced0"
    print_linux 8 "#6f6f70"
    print_linux 9 "#e95678"
    print_linux 10 "#29d398"
    print_linux 11 "#fac29a"
    print_linux 12 "#26bbd9"
    print_linux 13 "#ee64ac"
    print_linux 14 "#59e1e3"
    print_linux 15 "#e3e6ee"
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
