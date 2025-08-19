#!/usr/bin/env bash

# Source:   iterm
# Theme:    jubi
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
    print_osc4 0 "3b/36/50"
    print_osc4 1 "cf/7b/98"
    print_osc4 2 "90/a9/4b"
    print_osc4 3 "6e/bf/c0"
    print_osc4 4 "57/6e/a6"
    print_osc4 5 "bc/4f/68"
    print_osc4 6 "75/a7/d2"
    print_osc4 7 "c3/d3/de"
    print_osc4 8 "a8/74/ce"
    print_osc4 9 "de/8f/aa"
    print_osc4 10 "bc/dd/60"
    print_osc4 11 "86/e8/ea"
    print_osc4 12 "8b/9e/cc"
    print_osc4 13 "e1/6b/86"
    print_osc4 14 "b7/c9/ef"
    print_osc4 15 "d4/e5/f0"

    print_osc_rgb 10 "c3/d3/de"
    print_osc_rgb 11 "26/2b/33"
    print_osc_rgb 12 "c3/d3/de"
    print_osc_rgb 17 "5b/51/83"
    print_osc_rgb 19 "1d/1b/2d"
}

do_linux() {
    print_linux 0 "#3b3650"
    print_linux 1 "#cf7b98"
    print_linux 2 "#90a94b"
    print_linux 3 "#6ebfc0"
    print_linux 4 "#576ea6"
    print_linux 5 "#bc4f68"
    print_linux 6 "#75a7d2"
    print_linux 7 "#c3d3de"
    print_linux 8 "#a874ce"
    print_linux 9 "#de8faa"
    print_linux 10 "#bcdd60"
    print_linux 11 "#86e8ea"
    print_linux 12 "#8b9ecc"
    print_linux 13 "#e16b86"
    print_linux 14 "#b7c9ef"
    print_linux 15 "#d4e5f0"
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
