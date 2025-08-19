#!/usr/bin/env bash

# Source:   gogh
# Theme:    Summer Pop
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
    print_osc4 0 "66/66/66"
    print_osc4 1 "ff/1e/8e"
    print_osc4 2 "8e/ff/1e"
    print_osc4 3 "ff/fb/00"
    print_osc4 4 "1e/8e/ff"
    print_osc4 5 "e5/00/e5"
    print_osc4 6 "00/e5/e5"
    print_osc4 7 "e5/e5/e5"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ff/1e/8e"
    print_osc4 10 "8e/ff/1e"
    print_osc4 11 "ff/fb/00"
    print_osc4 12 "1e/8e/ff"
    print_osc4 13 "e5/00/e5"
    print_osc4 14 "00/e5/e5"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "27/28/22"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "27/28/22"
}

do_linux() {
    print_linux 0 "#666666"
    print_linux 1 "#ff1e8e"
    print_linux 2 "#8eff1e"
    print_linux 3 "#fffb00"
    print_linux 4 "#1e8eff"
    print_linux 5 "#e500e5"
    print_linux 6 "#00e5e5"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#ff1e8e"
    print_linux 10 "#8eff1e"
    print_linux 11 "#fffb00"
    print_linux 12 "#1e8eff"
    print_linux 13 "#e500e5"
    print_linux 14 "#00e5e5"
    print_linux 15 "#e5e5e5"
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
