#!/usr/bin/env bash

# Source:   iterm
# Theme:    JetBrains Darcula
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "fa/53/55"
    print_osc4 2 "12/6e/00"
    print_osc4 3 "c2/c3/00"
    print_osc4 4 "45/81/eb"
    print_osc4 5 "fa/54/ff"
    print_osc4 6 "33/c2/c1"
    print_osc4 7 "ad/ad/ad"
    print_osc4 8 "55/55/55"
    print_osc4 9 "fb/71/72"
    print_osc4 10 "67/ff/4f"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "6d/9d/f1"
    print_osc4 13 "fb/82/ff"
    print_osc4 14 "60/d3/d1"
    print_osc4 15 "ee/ee/ee"

    print_osc_rgb 10 "ad/ad/ad"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "1a/32/72"
    print_osc_rgb 19 "ad/ad/ad"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fa5355"
    print_linux 2 "#126e00"
    print_linux 3 "#c2c300"
    print_linux 4 "#4581eb"
    print_linux 5 "#fa54ff"
    print_linux 6 "#33c2c1"
    print_linux 7 "#adadad"
    print_linux 8 "#555555"
    print_linux 9 "#fb7172"
    print_linux 10 "#67ff4f"
    print_linux 11 "#ffff00"
    print_linux 12 "#6d9df1"
    print_linux 13 "#fb82ff"
    print_linux 14 "#60d3d1"
    print_linux 15 "#eeeeee"
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
