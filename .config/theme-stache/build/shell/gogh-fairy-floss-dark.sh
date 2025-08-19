#!/usr/bin/env bash

# Source:   gogh
# Theme:    Fairy Floss Dark
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
    print_osc4 0 "42/39/5d"
    print_osc4 1 "a8/75/7b"
    print_osc4 2 "ff/85/7f"
    print_osc4 3 "e6/c0/00"
    print_osc4 4 "ae/81/ff"
    print_osc4 5 "71/67/99"
    print_osc4 6 "c2/ff/df"
    print_osc4 7 "f8/f8/f2"
    print_osc4 8 "75/50/7b"
    print_osc4 9 "ff/b8/d1"
    print_osc4 10 "f1/56/8e"
    print_osc4 11 "d5/a4/25"
    print_osc4 12 "c5/a3/ff"
    print_osc4 13 "80/77/a8"
    print_osc4 14 "c2/ff/ff"
    print_osc4 15 "f8/f8/f0"

    print_osc_rgb 10 "c2/ff/df"
    print_osc_rgb 11 "42/39/5d"
    print_osc_rgb 12 "ff/b8/d1"
    print_osc_rgb 17 "c2/ff/df"
    print_osc_rgb 19 "42/39/5d"
}

do_linux() {
    print_linux 0 "#42395d"
    print_linux 1 "#a8757b"
    print_linux 2 "#ff857f"
    print_linux 3 "#e6c000"
    print_linux 4 "#ae81ff"
    print_linux 5 "#716799"
    print_linux 6 "#c2ffdf"
    print_linux 7 "#c2ffdf"
    print_linux 8 "#75507b"
    print_linux 9 "#ffb8d1"
    print_linux 10 "#f1568e"
    print_linux 11 "#d5a425"
    print_linux 12 "#c5a3ff"
    print_linux 13 "#8077a8"
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
