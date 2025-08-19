#!/usr/bin/env bash

# Source:   iterm
# Theme:    Grey-green
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "fd/14/14"
    print_osc4 2 "73/ff/00"
    print_osc4 3 "f0/ff/01"
    print_osc4 4 "00/dd/ff"
    print_osc4 5 "ff/00/ef"
    print_osc4 6 "00/ff/bb"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ff/39/39"
    print_osc4 10 "00/ff/43"
    print_osc4 11 "ff/d1/00"
    print_osc4 12 "00/ae/ff"
    print_osc4 13 "ff/00/8a"
    print_osc4 14 "00/ff/d2"
    print_osc4 15 "f4/ec/ec"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/2a/1a"
    print_osc_rgb 12 "ff/f3/00"
    print_osc_rgb 17 "50/7e/4f"
    print_osc_rgb 19 "e1/e1/e1"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fd1414"
    print_linux 2 "#73ff00"
    print_linux 3 "#f0ff01"
    print_linux 4 "#00ddff"
    print_linux 5 "#ff00ef"
    print_linux 6 "#00ffbb"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#ff3939"
    print_linux 10 "#00ff43"
    print_linux 11 "#ffd100"
    print_linux 12 "#00aeff"
    print_linux 13 "#ff008a"
    print_linux 14 "#00ffd2"
    print_linux 15 "#f4ecec"
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
