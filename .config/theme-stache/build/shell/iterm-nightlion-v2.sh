#!/usr/bin/env bash

# Source:   iterm
# Theme:    NightLion v2
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
    print_osc4 0 "4c/4c/4c"
    print_osc4 1 "bb/00/00"
    print_osc4 2 "03/f6/22"
    print_osc4 3 "f2/f0/67"
    print_osc4 4 "63/d0/f0"
    print_osc4 5 "ce/6f/da"
    print_osc4 6 "00/d9/df"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "7d/f6/1c"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "62/ca/e7"
    print_osc4 13 "ff/9a/f5"
    print_osc4 14 "00/cc/d7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "17/17/17"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4c4c4c"
    print_linux 1 "#bb0000"
    print_linux 2 "#03f622"
    print_linux 3 "#f2f067"
    print_linux 4 "#63d0f0"
    print_linux 5 "#ce6fda"
    print_linux 6 "#00d9df"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#555555"
    print_linux 9 "#ff5555"
    print_linux 10 "#7df61c"
    print_linux 11 "#ffff55"
    print_linux 12 "#62cae7"
    print_linux 13 "#ff9af5"
    print_linux 14 "#00ccd7"
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
