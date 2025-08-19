#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mar
# Author:   
# Variant:  light

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
    print_osc4 1 "b5/40/7b"
    print_osc4 2 "7b/b5/40"
    print_osc4 3 "b5/7b/40"
    print_osc4 4 "40/7b/b5"
    print_osc4 5 "7b/40/b5"
    print_osc4 6 "40/b5/7b"
    print_osc4 7 "f8/f8/f8"
    print_osc4 8 "73/73/73"
    print_osc4 9 "cd/73/a0"
    print_osc4 10 "a0/cd/73"
    print_osc4 11 "cd/a0/73"
    print_osc4 12 "73/a0/cd"
    print_osc4 13 "a0/73/cd"
    print_osc4 14 "73/cd/a0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "23/47/6a"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "23/47/6a"
    print_osc_rgb 17 "23/47/6a"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b5407b"
    print_linux 2 "#7bb540"
    print_linux 3 "#b57b40"
    print_linux 4 "#407bb5"
    print_linux 5 "#7b40b5"
    print_linux 6 "#40b57b"
    print_linux 7 "#23476a"
    print_linux 8 "#737373"
    print_linux 9 "#cd73a0"
    print_linux 10 "#a0cd73"
    print_linux 11 "#cda073"
    print_linux 12 "#73a0cd"
    print_linux 13 "#a073cd"
    print_linux 14 "#73cda0"
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
