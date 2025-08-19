#!/usr/bin/env bash

# Source:   gogh
# Theme:    Pixiefloss
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "2f/29/42"
    print_osc4 1 "ff/85/7f"
    print_osc4 2 "48/b6/85"
    print_osc4 3 "e6/c0/00"
    print_osc4 4 "ae/81/ff"
    print_osc4 5 "ef/61/55"
    print_osc4 6 "c2/ff/df"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "75/50/7b"
    print_osc4 9 "f1/56/8e"
    print_osc4 10 "5a/db/a2"
    print_osc4 11 "d5/a4/25"
    print_osc4 12 "c5/a3/ff"
    print_osc4 13 "ef/61/55"
    print_osc4 14 "c2/ff/ff"
    print_osc4 15 "f8/f8/f0"

    print_osc_rgb 10 "d1/ca/e8"
    print_osc_rgb 11 "24/1f/33"
    print_osc_rgb 12 "d1/ca/e8"
    print_osc_rgb 17 "d1/ca/e8"
    print_osc_rgb 19 "24/1f/33"
}

do_linux() {
    print_linux 0 "#2f2942"
    print_linux 1 "#ff857f"
    print_linux 2 "#48b685"
    print_linux 3 "#e6c000"
    print_linux 4 "#ae81ff"
    print_linux 5 "#ef6155"
    print_linux 6 "#c2ffdf"
    print_linux 7 "#d1cae8"
    print_linux 8 "#75507b"
    print_linux 9 "#f1568e"
    print_linux 10 "#5adba2"
    print_linux 11 "#d5a425"
    print_linux 12 "#c5a3ff"
    print_linux 13 "#ef6155"
    print_linux 14 "#c2ffff"
    print_linux 15 "#f8f8f0"
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
