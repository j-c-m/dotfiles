#!/usr/bin/env bash

# Source:   gogh
# Theme:    Ir Black
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
    print_osc4 0 "4e/4e/4e"
    print_osc4 1 "ff/6c/60"
    print_osc4 2 "a8/ff/60"
    print_osc4 3 "ff/ff/b6"
    print_osc4 4 "69/cb/fe"
    print_osc4 5 "ff/73/fd"
    print_osc4 6 "c6/c5/fe"
    print_osc4 7 "ee/ee/ee"
    print_osc4 8 "7c/7c/7c"
    print_osc4 9 "ff/b6/b0"
    print_osc4 10 "ce/ff/ac"
    print_osc4 11 "ff/ff/cb"
    print_osc4 12 "b5/dc/fe"
    print_osc4 13 "ff/9c/fe"
    print_osc4 14 "df/df/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ee/ee/ee"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/a5/60"
    print_osc_rgb 17 "ee/ee/ee"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4e4e4e"
    print_linux 1 "#ff6c60"
    print_linux 2 "#a8ff60"
    print_linux 3 "#ffffb6"
    print_linux 4 "#69cbfe"
    print_linux 5 "#ff73fd"
    print_linux 6 "#c6c5fe"
    print_linux 7 "#eeeeee"
    print_linux 8 "#7c7c7c"
    print_linux 9 "#ffb6b0"
    print_linux 10 "#ceffac"
    print_linux 11 "#ffffcb"
    print_linux 12 "#b5dcfe"
    print_linux 13 "#ff9cfe"
    print_linux 14 "#dfdffe"
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
