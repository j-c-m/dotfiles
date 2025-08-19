#!/usr/bin/env bash

# Source:   gogh
# Theme:    Panda
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "1f/1f/20"
    print_osc4 1 "fb/05/5a"
    print_osc4 2 "26/ff/d4"
    print_osc4 3 "fd/aa/5a"
    print_osc4 4 "5c/9f/ff"
    print_osc4 5 "fc/59/a6"
    print_osc4 6 "26/ff/d4"
    print_osc4 7 "f0/f0/f0"
    print_osc4 8 "5c/63/70"
    print_osc4 9 "fb/05/5a"
    print_osc4 10 "26/ff/d4"
    print_osc4 11 "fe/be/7e"
    print_osc4 12 "55/ad/ff"
    print_osc4 13 "fd/95/d0"
    print_osc4 14 "26/ff/d4"
    print_osc4 15 "f0/f0/f0"

    print_osc_rgb 10 "f0/f0/f0"
    print_osc_rgb 11 "1d/1e/20"
    print_osc_rgb 12 "f0/f0/f0"
    print_osc_rgb 17 "f0/f0/f0"
    print_osc_rgb 19 "1d/1e/20"
}

do_linux() {
    print_linux 0 "#1f1f20"
    print_linux 1 "#fb055a"
    print_linux 2 "#26ffd4"
    print_linux 3 "#fdaa5a"
    print_linux 4 "#5c9fff"
    print_linux 5 "#fc59a6"
    print_linux 6 "#26ffd4"
    print_linux 7 "#f0f0f0"
    print_linux 8 "#5c6370"
    print_linux 9 "#fb055a"
    print_linux 10 "#26ffd4"
    print_linux 11 "#febe7e"
    print_linux 12 "#55adff"
    print_linux 13 "#fd95d0"
    print_linux 14 "#26ffd4"
    print_linux 15 "#f0f0f0"
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
