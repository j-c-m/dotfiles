#!/usr/bin/env bash

# Source:   iterm
# Theme:    Duotone Dark
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
    print_osc4 0 "1f/1c/27"
    print_osc4 1 "d8/39/3d"
    print_osc4 2 "2d/cc/72"
    print_osc4 3 "d8/b7/6e"
    print_osc4 4 "ff/c1/83"
    print_osc4 5 "dd/8d/40"
    print_osc4 6 "23/88/ff"
    print_osc4 7 "b6/a0/ff"
    print_osc4 8 "35/31/46"
    print_osc4 9 "d8/39/3d"
    print_osc4 10 "2d/cc/72"
    print_osc4 11 "d8/b7/6e"
    print_osc4 12 "ff/c1/83"
    print_osc4 13 "dd/8d/40"
    print_osc4 14 "23/88/ff"
    print_osc4 15 "e9/e4/ff"

    print_osc_rgb 10 "b6/a0/ff"
    print_osc_rgb 11 "1f/1c/27"
    print_osc_rgb 12 "ff/97/38"
    print_osc_rgb 17 "35/31/46"
    print_osc_rgb 19 "b6/a2/ff"
}

do_linux() {
    print_linux 0 "#1f1c27"
    print_linux 1 "#d8393d"
    print_linux 2 "#2dcc72"
    print_linux 3 "#d8b76e"
    print_linux 4 "#ffc183"
    print_linux 5 "#dd8d40"
    print_linux 6 "#2388ff"
    print_linux 7 "#b6a0ff"
    print_linux 8 "#353146"
    print_linux 9 "#d8393d"
    print_linux 10 "#2dcc72"
    print_linux 11 "#d8b76e"
    print_linux 12 "#ffc183"
    print_linux 13 "#dd8d40"
    print_linux 14 "#2388ff"
    print_linux 15 "#e9e4ff"
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
