#!/usr/bin/env bash

# Source:   base16
# Theme:    Blue Forest
# Author:   alonsodomin (https://github.com/alonsodomin)
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
    print_osc4 0 "14/1f/2e"
    print_osc4 1 "ff/fa/b1"
    print_osc4 2 "80/ff/80"
    print_osc4 3 "91/cc/ff"
    print_osc4 4 "a2/cf/f5"
    print_osc4 5 "00/99/ff"
    print_osc4 6 "80/ff/80"
    print_osc4 7 "ff/cc/33"
    print_osc4 8 "a0/ff/a0"
    print_osc4 9 "ff/fa/b1"
    print_osc4 10 "80/ff/80"
    print_osc4 11 "91/cc/ff"
    print_osc4 12 "a2/cf/f5"
    print_osc4 13 "00/99/ff"
    print_osc4 14 "80/ff/80"
    print_osc4 15 "37/57/80"

    print_osc_rgb 10 "ff/cc/33"
    print_osc_rgb 11 "14/1f/2e"
    print_osc_rgb 12 "ff/cc/33"
    print_osc_rgb 17 "91/cc/ff"
    print_osc_rgb 19 "1e/5c/1e"
}

do_linux() {
    print_linux 0 "#141f2e"
    print_linux 1 "#fffab1"
    print_linux 2 "#80ff80"
    print_linux 3 "#91ccff"
    print_linux 4 "#a2cff5"
    print_linux 5 "#0099ff"
    print_linux 6 "#80ff80"
    print_linux 7 "#ffcc33"
    print_linux 8 "#a0ffa0"
    print_linux 9 "#fffab1"
    print_linux 10 "#80ff80"
    print_linux 11 "#91ccff"
    print_linux 12 "#a2cff5"
    print_linux 13 "#0099ff"
    print_linux 14 "#80ff80"
    print_linux 15 "#375780"
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
