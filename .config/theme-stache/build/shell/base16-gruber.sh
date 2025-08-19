#!/usr/bin/env bash

# Source:   base16
# Theme:    Gruber
# Author:   Patel, Nimai &lt;nimai.m.patel@gmail.com&gt;, colors from www.github.com/rexim/gruber-darker-theme
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
    print_osc4 0 "18/18/18"
    print_osc4 1 "f4/38/41"
    print_osc4 2 "73/c9/36"
    print_osc4 3 "ff/dd/33"
    print_osc4 4 "96/a6/c8"
    print_osc4 5 "9e/95/c7"
    print_osc4 6 "95/a9/9f"
    print_osc4 7 "f4/f4/ff"
    print_osc4 8 "52/49/4e"
    print_osc4 9 "f4/38/41"
    print_osc4 10 "73/c9/36"
    print_osc4 11 "ff/dd/33"
    print_osc4 12 "96/a6/c8"
    print_osc4 13 "9e/95/c7"
    print_osc4 14 "95/a9/9f"
    print_osc4 15 "e4/e4/ef"

    print_osc_rgb 10 "f4/f4/ff"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "f4/f4/ff"
    print_osc_rgb 17 "f5/f5/f5"
    print_osc_rgb 19 "45/3d/41"
}

do_linux() {
    print_linux 0 "#181818"
    print_linux 1 "#f43841"
    print_linux 2 "#73c936"
    print_linux 3 "#ffdd33"
    print_linux 4 "#96a6c8"
    print_linux 5 "#9e95c7"
    print_linux 6 "#95a99f"
    print_linux 7 "#f4f4ff"
    print_linux 8 "#52494e"
    print_linux 9 "#f43841"
    print_linux 10 "#73c936"
    print_linux 11 "#ffdd33"
    print_linux 12 "#96a6c8"
    print_linux 13 "#9e95c7"
    print_linux 14 "#95a99f"
    print_linux 15 "#e4e4ef"
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
