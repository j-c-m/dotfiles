#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ayu Mirage
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
    print_osc4 0 "19/1e/2a"
    print_osc4 1 "ed/82/74"
    print_osc4 2 "a6/cc/70"
    print_osc4 3 "fa/d0/7b"
    print_osc4 4 "6d/cb/fa"
    print_osc4 5 "cf/ba/fa"
    print_osc4 6 "90/e1/c6"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "f2/87/79"
    print_osc4 10 "ba/e6/7e"
    print_osc4 11 "ff/d5/80"
    print_osc4 12 "73/d0/ff"
    print_osc4 13 "d4/bf/ff"
    print_osc4 14 "95/e6/cb"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "cb/cc/c6"
    print_osc_rgb 11 "1f/24/30"
    print_osc_rgb 12 "ff/cc/66"
    print_osc_rgb 17 "33/41/5e"
    print_osc_rgb 19 "cb/cc/c6"
}

do_linux() {
    print_linux 0 "#191e2a"
    print_linux 1 "#ed8274"
    print_linux 2 "#a6cc70"
    print_linux 3 "#fad07b"
    print_linux 4 "#6dcbfa"
    print_linux 5 "#cfbafa"
    print_linux 6 "#90e1c6"
    print_linux 7 "#cbccc6"
    print_linux 8 "#686868"
    print_linux 9 "#f28779"
    print_linux 10 "#bae67e"
    print_linux 11 "#ffd580"
    print_linux 12 "#73d0ff"
    print_linux 13 "#d4bfff"
    print_linux 14 "#95e6cb"
    print_linux 15 "#feffff"
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
