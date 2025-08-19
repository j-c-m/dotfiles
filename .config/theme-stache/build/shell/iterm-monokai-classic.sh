#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Classic
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
    print_osc4 0 "27/28/21"
    print_osc4 1 "f8/25/71"
    print_osc4 2 "a6/e1/2e"
    print_osc4 3 "e5/da/74"
    print_osc4 4 "fc/96/1f"
    print_osc4 5 "ae/80/ff"
    print_osc4 6 "66/d9/ef"
    print_osc4 7 "fc/ff/f0"
    print_osc4 8 "6d/70/66"
    print_osc4 9 "f8/25/71"
    print_osc4 10 "a6/e1/2e"
    print_osc4 11 "e5/da/74"
    print_osc4 12 "fc/96/1f"
    print_osc4 13 "ae/80/ff"
    print_osc4 14 "66/d9/ef"
    print_osc4 15 "fc/ff/f0"

    print_osc_rgb 10 "fc/ff/f0"
    print_osc_rgb 11 "27/28/21"
    print_osc_rgb 12 "c0/c1/b5"
    print_osc_rgb 17 "57/57/4f"
    print_osc_rgb 19 "fc/ff/f0"
}

do_linux() {
    print_linux 0 "#272821"
    print_linux 1 "#f82571"
    print_linux 2 "#a6e12e"
    print_linux 3 "#e5da74"
    print_linux 4 "#fc961f"
    print_linux 5 "#ae80ff"
    print_linux 6 "#66d9ef"
    print_linux 7 "#fcfff0"
    print_linux 8 "#6d7066"
    print_linux 9 "#f82571"
    print_linux 10 "#a6e12e"
    print_linux 11 "#e5da74"
    print_linux 12 "#fc961f"
    print_linux 13 "#ae80ff"
    print_linux 14 "#66d9ef"
    print_linux 15 "#fcfff0"
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
