#!/usr/bin/env bash

# Source:   iterm
# Theme:    darkermatrix
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
    print_osc4 0 "09/10/13"
    print_osc4 1 "00/2e/18"
    print_osc4 2 "6f/a6/4c"
    print_osc4 3 "59/59/00"
    print_osc4 4 "00/cb/6b"
    print_osc4 5 "41/2a/4d"
    print_osc4 6 "12/54/59"
    print_osc4 7 "00/2e/19"
    print_osc4 8 "33/33/33"
    print_osc4 9 "00/38/1d"
    print_osc4 10 "90/d7/62"
    print_osc4 11 "e2/e5/00"
    print_osc4 12 "00/ff/87"
    print_osc4 13 "41/2a/4d"
    print_osc4 14 "17/6c/73"
    print_osc4 15 "00/38/1e"

    print_osc_rgb 10 "28/38/0d"
    print_osc_rgb 11 "07/0c/0e"
    print_osc_rgb 12 "37/3a/26"
    print_osc_rgb 17 "0f/19/1c"
    print_osc_rgb 19 "00/ff/87"
}

do_linux() {
    print_linux 0 "#091013"
    print_linux 1 "#002e18"
    print_linux 2 "#6fa64c"
    print_linux 3 "#595900"
    print_linux 4 "#00cb6b"
    print_linux 5 "#412a4d"
    print_linux 6 "#125459"
    print_linux 7 "#28380d"
    print_linux 8 "#333333"
    print_linux 9 "#00381d"
    print_linux 10 "#90d762"
    print_linux 11 "#e2e500"
    print_linux 12 "#00ff87"
    print_linux 13 "#412a4d"
    print_linux 14 "#176c73"
    print_linux 15 "#00381e"
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
