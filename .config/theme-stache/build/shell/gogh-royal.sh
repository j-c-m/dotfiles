#!/usr/bin/env bash

# Source:   gogh
# Theme:    Royal
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
    print_osc4 0 "24/1f/2b"
    print_osc4 1 "91/28/4c"
    print_osc4 2 "23/80/1c"
    print_osc4 3 "b4/9d/27"
    print_osc4 4 "65/80/b0"
    print_osc4 5 "67/4d/96"
    print_osc4 6 "8a/aa/be"
    print_osc4 7 "52/49/66"
    print_osc4 8 "31/2d/3d"
    print_osc4 9 "d5/35/6c"
    print_osc4 10 "2c/d9/46"
    print_osc4 11 "fd/e8/3b"
    print_osc4 12 "90/ba/f9"
    print_osc4 13 "a4/79/e3"
    print_osc4 14 "ac/d4/eb"
    print_osc4 15 "9e/8c/bd"

    print_osc_rgb 10 "51/49/68"
    print_osc_rgb 11 "10/08/15"
    print_osc_rgb 12 "51/49/68"
    print_osc_rgb 17 "51/49/68"
    print_osc_rgb 19 "10/08/15"
}

do_linux() {
    print_linux 0 "#241f2b"
    print_linux 1 "#91284c"
    print_linux 2 "#23801c"
    print_linux 3 "#b49d27"
    print_linux 4 "#6580b0"
    print_linux 5 "#674d96"
    print_linux 6 "#8aaabe"
    print_linux 7 "#514968"
    print_linux 8 "#312d3d"
    print_linux 9 "#d5356c"
    print_linux 10 "#2cd946"
    print_linux 11 "#fde83b"
    print_linux 12 "#90baf9"
    print_linux 13 "#a479e3"
    print_linux 14 "#acd4eb"
    print_linux 15 "#9e8cbd"
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
