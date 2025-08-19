#!/usr/bin/env bash

# Source:   gogh
# Theme:    Grape
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
    print_osc4 0 "2d/28/3f"
    print_osc4 1 "ed/22/61"
    print_osc4 2 "1f/a9/1b"
    print_osc4 3 "8d/dc/20"
    print_osc4 4 "48/7d/f4"
    print_osc4 5 "8d/35/c9"
    print_osc4 6 "3b/de/ed"
    print_osc4 7 "9e/9e/a0"
    print_osc4 8 "59/51/6a"
    print_osc4 9 "f0/72/9a"
    print_osc4 10 "53/aa/5e"
    print_osc4 11 "b2/dc/87"
    print_osc4 12 "a9/bc/ec"
    print_osc4 13 "ad/81/c2"
    print_osc4 14 "9d/e3/eb"
    print_osc4 15 "a2/88/f7"

    print_osc_rgb 10 "9f/9f/a1"
    print_osc_rgb 11 "17/14/23"
    print_osc_rgb 12 "9f/9f/a1"
    print_osc_rgb 17 "9f/9f/a1"
    print_osc_rgb 19 "17/14/23"
}

do_linux() {
    print_linux 0 "#2d283f"
    print_linux 1 "#ed2261"
    print_linux 2 "#1fa91b"
    print_linux 3 "#8ddc20"
    print_linux 4 "#487df4"
    print_linux 5 "#8d35c9"
    print_linux 6 "#3bdeed"
    print_linux 7 "#9f9fa1"
    print_linux 8 "#59516a"
    print_linux 9 "#f0729a"
    print_linux 10 "#53aa5e"
    print_linux 11 "#b2dc87"
    print_linux 12 "#a9bcec"
    print_linux 13 "#ad81c2"
    print_linux 14 "#9de3eb"
    print_linux 15 "#a288f7"
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
