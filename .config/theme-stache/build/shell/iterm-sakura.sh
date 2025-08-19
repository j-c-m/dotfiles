#!/usr/bin/env bash

# Source:   iterm
# Theme:    Sakura
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d4/22/70"
    print_osc4 2 "41/af/1a"
    print_osc4 3 "bc/70/52"
    print_osc4 4 "69/63/aa"
    print_osc4 5 "c7/1f/be"
    print_osc4 6 "92/92/92"
    print_osc4 7 "99/8d/ac"
    print_osc4 8 "78/6c/68"
    print_osc4 9 "f3/1d/99"
    print_osc4 10 "21/e5/29"
    print_osc4 11 "f5/94/74"
    print_osc4 12 "98/91/f1"
    print_osc4 13 "e9/0b/dd"
    print_osc4 14 "ee/ee/ee"
    print_osc4 15 "cb/b6/ff"

    print_osc_rgb 10 "dc/7b/db"
    print_osc_rgb 11 "17/12/1d"
    print_osc_rgb 12 "ff/65/fd"
    print_osc_rgb 17 "c0/5b/be"
    print_osc_rgb 19 "23/23/2d"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d42270"
    print_linux 2 "#41af1a"
    print_linux 3 "#bc7052"
    print_linux 4 "#6963aa"
    print_linux 5 "#c71fbe"
    print_linux 6 "#929292"
    print_linux 7 "#dc7bdb"
    print_linux 8 "#786c68"
    print_linux 9 "#f31d99"
    print_linux 10 "#21e529"
    print_linux 11 "#f59474"
    print_linux 12 "#9891f1"
    print_linux 13 "#e90bdd"
    print_linux 14 "#eeeeee"
    print_linux 15 "#cbb6ff"
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
