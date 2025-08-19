#!/usr/bin/env bash

# Source:   base16
# Theme:    vice
# Author:   Thomas Leon Highbaugh thighbaugh@zoho.com
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
    print_osc4 0 "17/19/1e"
    print_osc4 1 "ff/29/a8"
    print_osc4 2 "0b/ad/ff"
    print_osc4 3 "f0/ff/aa"
    print_osc4 4 "00/ea/ff"
    print_osc4 5 "00/f6/d9"
    print_osc4 6 "82/65/ff"
    print_osc4 7 "8b/9c/be"
    print_osc4 8 "38/3a/47"
    print_osc4 9 "ff/29/a8"
    print_osc4 10 "0b/ad/ff"
    print_osc4 11 "f0/ff/aa"
    print_osc4 12 "00/ea/ff"
    print_osc4 13 "00/f6/d9"
    print_osc4 14 "82/65/ff"
    print_osc4 15 "f4/f4/f7"

    print_osc_rgb 10 "8b/9c/be"
    print_osc_rgb 11 "17/19/1e"
    print_osc_rgb 12 "8b/9c/be"
    print_osc_rgb 17 "b2/bf/d9"
    print_osc_rgb 19 "22/26/2d"
}

do_linux() {
    print_linux 0 "#17191e"
    print_linux 1 "#ff29a8"
    print_linux 2 "#0badff"
    print_linux 3 "#f0ffaa"
    print_linux 4 "#00eaff"
    print_linux 5 "#00f6d9"
    print_linux 6 "#8265ff"
    print_linux 7 "#8b9cbe"
    print_linux 8 "#383a47"
    print_linux 9 "#ff29a8"
    print_linux 10 "#0badff"
    print_linux 11 "#f0ffaa"
    print_linux 12 "#00eaff"
    print_linux 13 "#00f6d9"
    print_linux 14 "#8265ff"
    print_linux 15 "#f4f4f7"
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
