#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sea Shells
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
    print_osc4 0 "17/38/4c"
    print_osc4 1 "d1/51/23"
    print_osc4 2 "02/7c/9b"
    print_osc4 3 "fc/a0/2f"
    print_osc4 4 "1e/49/50"
    print_osc4 5 "68/d4/f1"
    print_osc4 6 "50/a3/b5"
    print_osc4 7 "de/b8/8d"
    print_osc4 8 "43/4b/53"
    print_osc4 9 "d4/86/78"
    print_osc4 10 "62/8d/98"
    print_osc4 11 "fd/d3/9f"
    print_osc4 12 "1b/bc/dd"
    print_osc4 13 "bb/e3/ee"
    print_osc4 14 "87/ac/b4"
    print_osc4 15 "fe/e4/ce"

    print_osc_rgb 10 "de/b8/8d"
    print_osc_rgb 11 "09/14/1b"
    print_osc_rgb 12 "de/b8/8d"
    print_osc_rgb 17 "de/b8/8d"
    print_osc_rgb 19 "09/14/1b"
}

do_linux() {
    print_linux 0 "#17384c"
    print_linux 1 "#d15123"
    print_linux 2 "#027c9b"
    print_linux 3 "#fca02f"
    print_linux 4 "#1e4950"
    print_linux 5 "#68d4f1"
    print_linux 6 "#50a3b5"
    print_linux 7 "#deb88d"
    print_linux 8 "#434b53"
    print_linux 9 "#d48678"
    print_linux 10 "#628d98"
    print_linux 11 "#fdd39f"
    print_linux 12 "#1bbcdd"
    print_linux 13 "#bbe3ee"
    print_linux 14 "#87acb4"
    print_linux 15 "#fee4ce"
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
