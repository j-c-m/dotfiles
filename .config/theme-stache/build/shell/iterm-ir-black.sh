#!/usr/bin/env bash

# Source:   iterm
# Theme:    IR_Black
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
    print_osc4 0 "4f/4f/4f"
    print_osc4 1 "fa/6c/5f"
    print_osc4 2 "a8/fe/60"
    print_osc4 3 "ff/fe/b6"
    print_osc4 4 "96/ca/fd"
    print_osc4 5 "fa/72/fc"
    print_osc4 6 "c6/c4/fd"
    print_osc4 7 "ee/ed/ee"
    print_osc4 8 "7b/7b/7b"
    print_osc4 9 "fc/b6/af"
    print_osc4 10 "ce/ff/ab"
    print_osc4 11 "ff/fe/cc"
    print_osc4 12 "b5/dc/fe"
    print_osc4 13 "fb/9b/fe"
    print_osc4 14 "df/df/fd"
    print_osc4 15 "fe/ff/fe"

    print_osc_rgb 10 "f1/f1/f1"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "7f/7f/7f"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4f4f4f"
    print_linux 1 "#fa6c5f"
    print_linux 2 "#a8fe60"
    print_linux 3 "#fffeb6"
    print_linux 4 "#96cafd"
    print_linux 5 "#fa72fc"
    print_linux 6 "#c6c4fd"
    print_linux 7 "#f1f1f1"
    print_linux 8 "#7b7b7b"
    print_linux 9 "#fcb6af"
    print_linux 10 "#ceffab"
    print_linux 11 "#fffecc"
    print_linux 12 "#b5dcfe"
    print_linux 13 "#fb9bfe"
    print_linux 14 "#dfdffd"
    print_linux 15 "#fefffe"
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
