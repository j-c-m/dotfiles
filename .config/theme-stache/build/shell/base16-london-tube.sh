#!/usr/bin/env bash

# Source:   base16
# Theme:    London Tube
# Author:   Jan T. Sott
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
    print_osc4 0 "23/1f/20"
    print_osc4 1 "ee/2e/24"
    print_osc4 2 "00/85/3e"
    print_osc4 3 "ff/d2/04"
    print_osc4 4 "00/9d/dc"
    print_osc4 5 "98/00/5d"
    print_osc4 6 "85/ce/bc"
    print_osc4 7 "d9/d8/d8"
    print_osc4 8 "73/71/71"
    print_osc4 9 "ee/2e/24"
    print_osc4 10 "00/85/3e"
    print_osc4 11 "ff/d2/04"
    print_osc4 12 "00/9d/dc"
    print_osc4 13 "98/00/5d"
    print_osc4 14 "85/ce/bc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d9/d8/d8"
    print_osc_rgb 11 "23/1f/20"
    print_osc_rgb 12 "d9/d8/d8"
    print_osc_rgb 17 "e7/e7/e8"
    print_osc_rgb 19 "1c/3f/95"
}

do_linux() {
    print_linux 0 "#231f20"
    print_linux 1 "#ee2e24"
    print_linux 2 "#00853e"
    print_linux 3 "#ffd204"
    print_linux 4 "#009ddc"
    print_linux 5 "#98005d"
    print_linux 6 "#85cebc"
    print_linux 7 "#d9d8d8"
    print_linux 8 "#737171"
    print_linux 9 "#ee2e24"
    print_linux 10 "#00853e"
    print_linux 11 "#ffd204"
    print_linux 12 "#009ddc"
    print_linux 13 "#98005d"
    print_linux 14 "#85cebc"
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
