#!/usr/bin/env bash

# Source:   base16
# Theme:    tarot
# Author:   ed (https://codeberg.org/ed)
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
    print_osc4 0 "0e/09/1d"
    print_osc4 1 "c5/32/53"
    print_osc4 2 "a6/8e/5a"
    print_osc4 3 "ff/65/65"
    print_osc4 4 "6e/60/80"
    print_osc4 5 "a4/57/82"
    print_osc4 6 "8c/97/85"
    print_osc4 7 "aa/55/6f"
    print_osc4 8 "74/31/6b"
    print_osc4 9 "c5/32/53"
    print_osc4 10 "a6/8e/5a"
    print_osc4 11 "ff/65/65"
    print_osc4 12 "6e/60/80"
    print_osc4 13 "a4/57/82"
    print_osc4 14 "8c/97/85"
    print_osc4 15 "dc/8f/7c"

    print_osc_rgb 10 "aa/55/6f"
    print_osc_rgb 11 "0e/09/1d"
    print_osc_rgb 12 "aa/55/6f"
    print_osc_rgb 17 "c4/68/6d"
    print_osc_rgb 19 "2a/15/3c"
}

do_linux() {
    print_linux 0 "#0e091d"
    print_linux 1 "#c53253"
    print_linux 2 "#a68e5a"
    print_linux 3 "#ff6565"
    print_linux 4 "#6e6080"
    print_linux 5 "#a45782"
    print_linux 6 "#8c9785"
    print_linux 7 "#aa556f"
    print_linux 8 "#74316b"
    print_linux 9 "#c53253"
    print_linux 10 "#a68e5a"
    print_linux 11 "#ff6565"
    print_linux 12 "#6e6080"
    print_linux 13 "#a45782"
    print_linux 14 "#8c9785"
    print_linux 15 "#dc8f7c"
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
