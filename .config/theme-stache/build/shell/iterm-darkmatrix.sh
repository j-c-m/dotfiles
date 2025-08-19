#!/usr/bin/env bash

# Source:   iterm
# Theme:    darkmatrix
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
    print_osc4 0 "09/10/13"
    print_osc4 1 "00/65/36"
    print_osc4 2 "6f/a6/4c"
    print_osc4 3 "7e/80/00"
    print_osc4 4 "2c/9a/84"
    print_osc4 5 "45/2d/53"
    print_osc4 6 "11/4d/53"
    print_osc4 7 "00/65/36"
    print_osc4 8 "33/33/33"
    print_osc4 9 "00/73/3d"
    print_osc4 10 "90/d7/62"
    print_osc4 11 "e2/e5/00"
    print_osc4 12 "46/d8/b8"
    print_osc4 13 "4a/30/59"
    print_osc4 14 "12/54/5a"
    print_osc4 15 "00/65/36"

    print_osc_rgb 10 "3e/57/15"
    print_osc_rgb 11 "07/0c/0e"
    print_osc_rgb 12 "9f/a8/6e"
    print_osc_rgb 17 "0f/19/1c"
    print_osc_rgb 19 "00/ff/87"
}

do_linux() {
    print_linux 0 "#091013"
    print_linux 1 "#006536"
    print_linux 2 "#6fa64c"
    print_linux 3 "#7e8000"
    print_linux 4 "#2c9a84"
    print_linux 5 "#452d53"
    print_linux 6 "#114d53"
    print_linux 7 "#3e5715"
    print_linux 8 "#333333"
    print_linux 9 "#00733d"
    print_linux 10 "#90d762"
    print_linux 11 "#e2e500"
    print_linux 12 "#46d8b8"
    print_linux 13 "#4a3059"
    print_linux 14 "#12545a"
    print_linux 15 "#006536"
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
