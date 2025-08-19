#!/usr/bin/env bash

# Source:   iterm
# Theme:    SpaceGray Eighties
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
    print_osc4 0 "15/17/1c"
    print_osc4 1 "ec/5f/67"
    print_osc4 2 "80/a7/63"
    print_osc4 3 "fd/c2/53"
    print_osc4 4 "54/85/c0"
    print_osc4 5 "bf/83/c0"
    print_osc4 6 "57/c2/c0"
    print_osc4 7 "ee/ec/e7"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/69/73"
    print_osc4 10 "93/d3/93"
    print_osc4 11 "ff/d1/56"
    print_osc4 12 "4d/83/d0"
    print_osc4 13 "ff/55/ff"
    print_osc4 14 "83/e8/e4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bd/b9/ae"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "26/2e/35"
    print_osc_rgb 19 "ff/fe/fe"
}

do_linux() {
    print_linux 0 "#15171c"
    print_linux 1 "#ec5f67"
    print_linux 2 "#80a763"
    print_linux 3 "#fdc253"
    print_linux 4 "#5485c0"
    print_linux 5 "#bf83c0"
    print_linux 6 "#57c2c0"
    print_linux 7 "#bdb9ae"
    print_linux 8 "#555555"
    print_linux 9 "#ff6973"
    print_linux 10 "#93d393"
    print_linux 11 "#ffd156"
    print_linux 12 "#4d83d0"
    print_linux 13 "#ff55ff"
    print_linux 14 "#83e8e4"
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
