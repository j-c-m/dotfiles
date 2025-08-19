#!/usr/bin/env bash

# Source:   base16
# Theme:    selenized-white
# Author:   Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "bf/00/00"
    print_osc4 2 "00/84/00"
    print_osc4 3 "af/85/00"
    print_osc4 4 "00/54/cf"
    print_osc4 5 "6b/40/c3"
    print_osc4 6 "00/9a/8a"
    print_osc4 7 "47/47/47"
    print_osc4 8 "87/87/87"
    print_osc4 9 "bf/00/00"
    print_osc4 10 "00/84/00"
    print_osc4 11 "af/85/00"
    print_osc4 12 "00/54/cf"
    print_osc4 13 "6b/40/c3"
    print_osc4 14 "00/9a/8a"
    print_osc4 15 "28/28/28"

    print_osc_rgb 10 "47/47/47"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "47/47/47"
    print_osc_rgb 17 "28/28/28"
    print_osc_rgb 19 "eb/eb/eb"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#bf0000"
    print_linux 2 "#008400"
    print_linux 3 "#af8500"
    print_linux 4 "#0054cf"
    print_linux 5 "#6b40c3"
    print_linux 6 "#009a8a"
    print_linux 7 "#474747"
    print_linux 8 "#878787"
    print_linux 9 "#bf0000"
    print_linux 10 "#008400"
    print_linux 11 "#af8500"
    print_linux 12 "#0054cf"
    print_linux 13 "#6b40c3"
    print_linux 14 "#009a8a"
    print_linux 15 "#282828"
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
