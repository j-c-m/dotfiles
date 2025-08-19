#!/usr/bin/env bash

# Source:   gogh
# Theme:    Acme
# Author:   plan9-for-vimspace (https://github.com/plan9-for-vimspace/acme-colors)
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "10/10/10"
    print_osc4 1 "30/30/30"
    print_osc4 2 "cc/cc/7c"
    print_osc4 3 "ff/ff/ca"
    print_osc4 4 "ea/ff/ff"
    print_osc4 5 "50/50/50"
    print_osc4 6 "ae/ee/ee"
    print_osc4 7 "fc/fc/ce"
    print_osc4 8 "10/10/10"
    print_osc4 9 "30/30/30"
    print_osc4 10 "cc/cc/7c"
    print_osc4 11 "ff/ff/ca"
    print_osc4 12 "ea/ff/ff"
    print_osc4 13 "50/50/50"
    print_osc4 14 "ae/ee/ee"
    print_osc4 15 "fc/fc/ce"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ea"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "00/00/00"
    print_osc_rgb 19 "ff/ff/ea"
}

do_linux() {
    print_linux 0 "#101010"
    print_linux 1 "#303030"
    print_linux 2 "#cccc7c"
    print_linux 3 "#ffffca"
    print_linux 4 "#eaffff"
    print_linux 5 "#505050"
    print_linux 6 "#aeeeee"
    print_linux 7 "#000000"
    print_linux 8 "#101010"
    print_linux 9 "#303030"
    print_linux 10 "#cccc7c"
    print_linux 11 "#ffffca"
    print_linux 12 "#eaffff"
    print_linux 13 "#505050"
    print_linux 14 "#aeeeee"
    print_linux 15 "#fcfcce"
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
