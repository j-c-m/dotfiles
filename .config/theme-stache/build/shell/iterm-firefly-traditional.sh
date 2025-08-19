#!/usr/bin/env bash

# Source:   iterm
# Theme:    Firefly Traditional
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "c2/37/20"
    print_osc4 2 "33/bc/26"
    print_osc4 3 "af/ad/24"
    print_osc4 4 "5a/63/ff"
    print_osc4 5 "d5/3a/d2"
    print_osc4 6 "33/bb/c7"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "82/82/82"
    print_osc4 9 "ff/3b/1e"
    print_osc4 10 "2e/e7/20"
    print_osc4 11 "ec/ec/16"
    print_osc4 12 "83/8d/ff"
    print_osc4 13 "ff/5c/fe"
    print_osc4 14 "29/f0/f0"
    print_osc4 15 "eb/eb/eb"

    print_osc_rgb 10 "f5/f5/f5"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "00/f9/00"
    print_osc_rgb 17 "cf/ea/c6"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c23720"
    print_linux 2 "#33bc26"
    print_linux 3 "#afad24"
    print_linux 4 "#5a63ff"
    print_linux 5 "#d53ad2"
    print_linux 6 "#33bbc7"
    print_linux 7 "#f5f5f5"
    print_linux 8 "#828282"
    print_linux 9 "#ff3b1e"
    print_linux 10 "#2ee720"
    print_linux 11 "#ecec16"
    print_linux 12 "#838dff"
    print_linux 13 "#ff5cfe"
    print_linux 14 "#29f0f0"
    print_linux 15 "#ebebeb"
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
