#!/usr/bin/env bash

# Source:   gogh
# Theme:    Blue Dolphin
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "29/2d/3e"
    print_osc4 1 "ff/82/88"
    print_osc4 2 "b4/e8/8d"
    print_osc4 3 "f4/d6/9f"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "e9/c1/ff"
    print_osc4 6 "89/eb/ff"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "43/47/58"
    print_osc4 9 "ff/8b/92"
    print_osc4 10 "dd/ff/a7"
    print_osc4 11 "ff/e5/85"
    print_osc4 12 "9c/c4/ff"
    print_osc4 13 "dd/b0/f6"
    print_osc4 14 "a3/f7/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c5/f2/ff"
    print_osc_rgb 11 "00/69/84"
    print_osc_rgb 12 "ff/cc/00"
    print_osc_rgb 17 "c5/f2/ff"
    print_osc_rgb 19 "00/69/84"
}

do_linux() {
    print_linux 0 "#292d3e"
    print_linux 1 "#ff8288"
    print_linux 2 "#b4e88d"
    print_linux 3 "#f4d69f"
    print_linux 4 "#82aaff"
    print_linux 5 "#e9c1ff"
    print_linux 6 "#89ebff"
    print_linux 7 "#c5f2ff"
    print_linux 8 "#434758"
    print_linux 9 "#ff8b92"
    print_linux 10 "#ddffa7"
    print_linux 11 "#ffe585"
    print_linux 12 "#9cc4ff"
    print_linux 13 "#ddb0f6"
    print_linux 14 "#a3f7ff"
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
