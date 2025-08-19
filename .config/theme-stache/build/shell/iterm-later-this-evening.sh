#!/usr/bin/env bash

# Source:   iterm
# Theme:    Later This Evening
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
    print_osc4 0 "2b/2b/2b"
    print_osc4 1 "d3/5a/5f"
    print_osc4 2 "af/ba/66"
    print_osc4 3 "e5/d2/89"
    print_osc4 4 "a0/b9/d5"
    print_osc4 5 "bf/92/d5"
    print_osc4 6 "91/be/b6"
    print_osc4 7 "3b/3c/3c"
    print_osc4 8 "44/47/47"
    print_osc4 9 "d3/22/2e"
    print_osc4 10 "aa/bb/39"
    print_osc4 11 "e4/bd/39"
    print_osc4 12 "65/99/d5"
    print_osc4 13 "aa/52/d5"
    print_osc4 14 "5f/bf/ad"
    print_osc4 15 "c0/c2/c2"

    print_osc_rgb 10 "94/94/94"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "42/42/42"
    print_osc_rgb 17 "42/42/42"
    print_osc_rgb 19 "94/94/94"
}

do_linux() {
    print_linux 0 "#2b2b2b"
    print_linux 1 "#d35a5f"
    print_linux 2 "#afba66"
    print_linux 3 "#e5d289"
    print_linux 4 "#a0b9d5"
    print_linux 5 "#bf92d5"
    print_linux 6 "#91beb6"
    print_linux 7 "#949494"
    print_linux 8 "#444747"
    print_linux 9 "#d3222e"
    print_linux 10 "#aabb39"
    print_linux 11 "#e4bd39"
    print_linux 12 "#6599d5"
    print_linux 13 "#aa52d5"
    print_linux 14 "#5fbfad"
    print_linux 15 "#c0c2c2"
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
