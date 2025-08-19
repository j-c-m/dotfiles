#!/usr/bin/env bash

# Source:   iterm
# Theme:    matrix
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
    print_osc4 0 "0f/19/1c"
    print_osc4 1 "23/75/5a"
    print_osc4 2 "82/d9/67"
    print_osc4 3 "ff/d7/00"
    print_osc4 4 "3f/52/42"
    print_osc4 5 "40/99/31"
    print_osc4 6 "50/b4/5a"
    print_osc4 7 "50/73/50"
    print_osc4 8 "68/80/60"
    print_osc4 9 "2f/c0/79"
    print_osc4 10 "90/d7/62"
    print_osc4 11 "fa/ff/00"
    print_osc4 12 "4f/7e/7e"
    print_osc4 13 "11/ff/25"
    print_osc4 14 "c1/ff/8a"
    print_osc4 15 "67/8c/61"

    print_osc_rgb 10 "42/66/44"
    print_osc_rgb 11 "0f/19/1c"
    print_osc_rgb 12 "38/45/45"
    print_osc_rgb 17 "18/28/2e"
    print_osc_rgb 19 "00/ff/87"
}

do_linux() {
    print_linux 0 "#0f191c"
    print_linux 1 "#23755a"
    print_linux 2 "#82d967"
    print_linux 3 "#ffd700"
    print_linux 4 "#3f5242"
    print_linux 5 "#409931"
    print_linux 6 "#50b45a"
    print_linux 7 "#426644"
    print_linux 8 "#688060"
    print_linux 9 "#2fc079"
    print_linux 10 "#90d762"
    print_linux 11 "#faff00"
    print_linux 12 "#4f7e7e"
    print_linux 13 "#11ff25"
    print_linux 14 "#c1ff8a"
    print_linux 15 "#678c61"
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
