#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ibm3270
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
    print_osc4 0 "22/22/22"
    print_osc4 1 "f0/18/18"
    print_osc4 2 "24/d8/30"
    print_osc4 3 "f0/d8/24"
    print_osc4 4 "78/90/f0"
    print_osc4 5 "f0/78/d8"
    print_osc4 6 "54/e4/e4"
    print_osc4 7 "a5/a5/a5"
    print_osc4 8 "88/88/88"
    print_osc4 9 "ef/83/83"
    print_osc4 10 "7e/d6/84"
    print_osc4 11 "ef/e2/8b"
    print_osc4 12 "b3/bf/ef"
    print_osc4 13 "ef/b3/e3"
    print_osc4 14 "9c/e2/e2"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fd/fd/fd"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "fd/fd/fd"
    print_osc_rgb 17 "fd/fd/fd"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#222222"
    print_linux 1 "#f01818"
    print_linux 2 "#24d830"
    print_linux 3 "#f0d824"
    print_linux 4 "#7890f0"
    print_linux 5 "#f078d8"
    print_linux 6 "#54e4e4"
    print_linux 7 "#fdfdfd"
    print_linux 8 "#888888"
    print_linux 9 "#ef8383"
    print_linux 10 "#7ed684"
    print_linux 11 "#efe28b"
    print_linux 12 "#b3bfef"
    print_linux 13 "#efb3e3"
    print_linux 14 "#9ce2e2"
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
