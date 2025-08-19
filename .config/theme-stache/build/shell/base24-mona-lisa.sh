#!/usr/bin/env bash

# Source:   base24
# Theme:    Mona Lisa
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "11/0b/0d"
    print_osc4 1 "9b/28/1b"
    print_osc4 2 "62/61/32"
    print_osc4 3 "9e/b2/b3"
    print_osc4 4 "51/5b/5c"
    print_osc4 5 "9b/1d/29"
    print_osc4 6 "58/80/56"
    print_osc4 7 "da/b1/4e"
    print_osc4 8 "a2/67/34"
    print_osc4 9 "ff/42/30"
    print_osc4 10 "b3/b1/63"
    print_osc4 11 "ff/95/65"
    print_osc4 12 "9e/b2/b3"
    print_osc4 13 "ff/5b/6a"
    print_osc4 14 "89/cc/8e"
    print_osc4 15 "ff/e5/97"

    print_osc_rgb 10 "da/b1/4e"
    print_osc_rgb 11 "11/0b/0d"
    print_osc_rgb 12 "da/b1/4e"
    print_osc_rgb 17 "f6/d7/5c"
    print_osc_rgb 19 "34/1a/0d"
}

do_linux() {
    print_linux 0 "#110b0d"
    print_linux 1 "#9b281b"
    print_linux 2 "#626132"
    print_linux 3 "#9eb2b3"
    print_linux 4 "#515b5c"
    print_linux 5 "#9b1d29"
    print_linux 6 "#588056"
    print_linux 7 "#dab14e"
    print_linux 8 "#a26734"
    print_linux 9 "#ff4230"
    print_linux 10 "#b3b163"
    print_linux 11 "#ff9565"
    print_linux 12 "#9eb2b3"
    print_linux 13 "#ff5b6a"
    print_linux 14 "#89cc8e"
    print_linux 15 "#ffe597"
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
