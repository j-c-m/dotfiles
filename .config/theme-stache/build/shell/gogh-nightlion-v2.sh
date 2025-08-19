#!/usr/bin/env bash

# Source:   gogh
# Theme:    Nightlion V2
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
    print_osc4 0 "4c/4c/4c"
    print_osc4 1 "bb/00/00"
    print_osc4 2 "04/f6/23"
    print_osc4 3 "f3/f1/67"
    print_osc4 4 "64/d0/f0"
    print_osc4 5 "ce/6f/db"
    print_osc4 6 "00/da/df"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "7d/f7/1d"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "62/cb/e8"
    print_osc4 13 "ff/9b/f5"
    print_osc4 14 "00/cc/d8"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "17/17/17"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "bb/bb/bb"
    print_osc_rgb 19 "17/17/17"
}

do_linux() {
    print_linux 0 "#4c4c4c"
    print_linux 1 "#bb0000"
    print_linux 2 "#04f623"
    print_linux 3 "#f3f167"
    print_linux 4 "#64d0f0"
    print_linux 5 "#ce6fdb"
    print_linux 6 "#00dadf"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#555555"
    print_linux 9 "#ff5555"
    print_linux 10 "#7df71d"
    print_linux 11 "#ffff55"
    print_linux 12 "#62cbe8"
    print_linux 13 "#ff9bf5"
    print_linux 14 "#00ccd8"
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
