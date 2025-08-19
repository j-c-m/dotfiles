#!/usr/bin/env bash

# Source:   gogh
# Theme:    Nightfly
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
    print_osc4 0 "1d/3b/53"
    print_osc4 1 "fc/51/4e"
    print_osc4 2 "a1/cd/5e"
    print_osc4 3 "e3/d1/8a"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "7f/db/ca"
    print_osc4 7 "a1/aa/b8"
    print_osc4 8 "7c/8f/8f"
    print_osc4 9 "ff/58/74"
    print_osc4 10 "21/c7/a8"
    print_osc4 11 "ec/c4/8d"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "ae/81/ff"
    print_osc4 14 "7f/db/ca"
    print_osc4 15 "d6/de/eb"

    print_osc_rgb 10 "bd/c1/c6"
    print_osc_rgb 11 "01/16/27"
    print_osc_rgb 12 "9c/a1/aa"
    print_osc_rgb 17 "bd/c1/c6"
    print_osc_rgb 19 "01/16/27"
}

do_linux() {
    print_linux 0 "#1d3b53"
    print_linux 1 "#fc514e"
    print_linux 2 "#a1cd5e"
    print_linux 3 "#e3d18a"
    print_linux 4 "#82aaff"
    print_linux 5 "#c792ea"
    print_linux 6 "#7fdbca"
    print_linux 7 "#bdc1c6"
    print_linux 8 "#7c8f8f"
    print_linux 9 "#ff5874"
    print_linux 10 "#21c7a8"
    print_linux 11 "#ecc48d"
    print_linux 12 "#82aaff"
    print_linux 13 "#ae81ff"
    print_linux 14 "#7fdbca"
    print_linux 15 "#d6deeb"
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
