#!/usr/bin/env bash

# Source:   base16
# Theme:    Qualia
# Author:   isaacwhanson
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
    print_osc4 0 "10/10/10"
    print_osc4 1 "ef/a6/a2"
    print_osc4 2 "80/c9/90"
    print_osc4 3 "e6/a3/dc"
    print_osc4 4 "50/ca/cd"
    print_osc4 5 "e0/af/85"
    print_osc4 6 "c8/c8/74"
    print_osc4 7 "c0/c0/c0"
    print_osc4 8 "45/45/45"
    print_osc4 9 "ef/a6/a2"
    print_osc4 10 "80/c9/90"
    print_osc4 11 "e6/a3/dc"
    print_osc4 12 "50/ca/cd"
    print_osc4 13 "e0/af/85"
    print_osc4 14 "c8/c8/74"
    print_osc4 15 "45/45/45"

    print_osc_rgb 10 "c0/c0/c0"
    print_osc_rgb 11 "10/10/10"
    print_osc_rgb 12 "c0/c0/c0"
    print_osc_rgb 17 "c0/c0/c0"
    print_osc_rgb 19 "45/45/45"
}

do_linux() {
    print_linux 0 "#101010"
    print_linux 1 "#efa6a2"
    print_linux 2 "#80c990"
    print_linux 3 "#e6a3dc"
    print_linux 4 "#50cacd"
    print_linux 5 "#e0af85"
    print_linux 6 "#c8c874"
    print_linux 7 "#c0c0c0"
    print_linux 8 "#454545"
    print_linux 9 "#efa6a2"
    print_linux 10 "#80c990"
    print_linux 11 "#e6a3dc"
    print_linux 12 "#50cacd"
    print_linux 13 "#e0af85"
    print_linux 14 "#c8c874"
    print_linux 15 "#454545"
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
