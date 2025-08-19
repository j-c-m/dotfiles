#!/usr/bin/env bash

# Source:   iterm
# Theme:    Sublette
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "25/30/45"
    print_osc4 1 "ee/55/77"
    print_osc4 2 "55/ee/77"
    print_osc4 3 "ff/dd/88"
    print_osc4 4 "55/88/ff"
    print_osc4 5 "ff/77/cc"
    print_osc4 6 "44/ee/ee"
    print_osc4 7 "f5/f5/da"
    print_osc4 8 "40/55/70"
    print_osc4 9 "ee/66/55"
    print_osc4 10 "99/ee/77"
    print_osc4 11 "ff/ff/77"
    print_osc4 12 "77/bb/ff"
    print_osc4 13 "aa/88/ff"
    print_osc4 14 "55/ff/bb"
    print_osc4 15 "ff/ff/ee"

    print_osc_rgb 10 "cc/ce/d0"
    print_osc_rgb 11 "20/25/35"
    print_osc_rgb 12 "cc/ce/d0"
    print_osc_rgb 17 "cc/ce/d0"
    print_osc_rgb 19 "20/25/35"
}

do_linux() {
    print_linux 0 "#253045"
    print_linux 1 "#ee5577"
    print_linux 2 "#55ee77"
    print_linux 3 "#ffdd88"
    print_linux 4 "#5588ff"
    print_linux 5 "#ff77cc"
    print_linux 6 "#44eeee"
    print_linux 7 "#ccced0"
    print_linux 8 "#405570"
    print_linux 9 "#ee6655"
    print_linux 10 "#99ee77"
    print_linux 11 "#ffff77"
    print_linux 12 "#77bbff"
    print_linux 13 "#aa88ff"
    print_linux 14 "#55ffbb"
    print_linux 15 "#ffffee"
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
