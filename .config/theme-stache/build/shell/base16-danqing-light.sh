#!/usr/bin/env bash

# Source:   base16
# Theme:    DanQing Light
# Author:   Wenhan Zhu (Cosmos) (zhuwenhan950913@gmail.com)
# Variant:  light

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
    print_osc4 0 "fc/fe/fd"
    print_osc4 1 "f9/90/6f"
    print_osc4 2 "8a/b3/61"
    print_osc4 3 "f0/c2/39"
    print_osc4 4 "b0/a4/e3"
    print_osc4 5 "cc/a4/e3"
    print_osc4 6 "30/df/f3"
    print_osc4 7 "5a/60/5d"
    print_osc4 8 "ca/d8/d2"
    print_osc4 9 "f9/90/6f"
    print_osc4 10 "8a/b3/61"
    print_osc4 11 "f0/c2/39"
    print_osc4 12 "b0/a4/e3"
    print_osc4 13 "cc/a4/e3"
    print_osc4 14 "30/df/f3"
    print_osc4 15 "2d/30/2f"

    print_osc_rgb 10 "5a/60/5d"
    print_osc_rgb 11 "fc/fe/fd"
    print_osc_rgb 12 "5a/60/5d"
    print_osc_rgb 17 "43/48/46"
    print_osc_rgb 19 "ec/f6/f2"
}

do_linux() {
    print_linux 0 "#fcfefd"
    print_linux 1 "#f9906f"
    print_linux 2 "#8ab361"
    print_linux 3 "#f0c239"
    print_linux 4 "#b0a4e3"
    print_linux 5 "#cca4e3"
    print_linux 6 "#30dff3"
    print_linux 7 "#5a605d"
    print_linux 8 "#cad8d2"
    print_linux 9 "#f9906f"
    print_linux 10 "#8ab361"
    print_linux 11 "#f0c239"
    print_linux 12 "#b0a4e3"
    print_linux 13 "#cca4e3"
    print_linux 14 "#30dff3"
    print_linux 15 "#2d302f"
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
