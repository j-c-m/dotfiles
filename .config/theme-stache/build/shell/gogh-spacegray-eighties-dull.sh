#!/usr/bin/env bash

# Source:   gogh
# Theme:    Spacegray Eighties Dull
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
    print_osc4 0 "15/17/1c"
    print_osc4 1 "b2/4a/56"
    print_osc4 2 "92/b4/77"
    print_osc4 3 "c6/73/5a"
    print_osc4 4 "7c/8f/a5"
    print_osc4 5 "a5/78/9e"
    print_osc4 6 "80/cd/cb"
    print_osc4 7 "b3/b8/c3"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ec/5f/67"
    print_osc4 10 "89/e9/86"
    print_osc4 11 "fe/c2/54"
    print_osc4 12 "54/86/c0"
    print_osc4 13 "bf/83/c1"
    print_osc4 14 "58/c2/c1"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c9/c6/bc"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "c9/c6/bc"
    print_osc_rgb 17 "c9/c6/bc"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#15171c"
    print_linux 1 "#b24a56"
    print_linux 2 "#92b477"
    print_linux 3 "#c6735a"
    print_linux 4 "#7c8fa5"
    print_linux 5 "#a5789e"
    print_linux 6 "#80cdcb"
    print_linux 7 "#c9c6bc"
    print_linux 8 "#555555"
    print_linux 9 "#ec5f67"
    print_linux 10 "#89e986"
    print_linux 11 "#fec254"
    print_linux 12 "#5486c0"
    print_linux 13 "#bf83c1"
    print_linux 14 "#58c2c1"
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
