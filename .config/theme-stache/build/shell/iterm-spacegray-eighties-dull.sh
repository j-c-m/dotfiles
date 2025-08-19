#!/usr/bin/env bash

# Source:   iterm
# Theme:    SpaceGray Eighties Dull
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
    print_osc4 1 "b1/49/56"
    print_osc4 2 "91/b3/77"
    print_osc4 3 "c6/72/5a"
    print_osc4 4 "7b/8f/a4"
    print_osc4 5 "a5/77/9e"
    print_osc4 6 "7f/cc/cb"
    print_osc4 7 "b2/b8/c2"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ec/5f/67"
    print_osc4 10 "88/e9/85"
    print_osc4 11 "fd/c2/53"
    print_osc4 12 "54/85/c0"
    print_osc4 13 "bf/83/c0"
    print_osc4 14 "58/c2/c0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c8/c5/bc"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "26/2e/36"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#15171c"
    print_linux 1 "#b14956"
    print_linux 2 "#91b377"
    print_linux 3 "#c6725a"
    print_linux 4 "#7b8fa4"
    print_linux 5 "#a5779e"
    print_linux 6 "#7fcccb"
    print_linux 7 "#c8c5bc"
    print_linux 8 "#555555"
    print_linux 9 "#ec5f67"
    print_linux 10 "#88e985"
    print_linux 11 "#fdc253"
    print_linux 12 "#5485c0"
    print_linux 13 "#bf83c0"
    print_linux 14 "#58c2c0"
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
