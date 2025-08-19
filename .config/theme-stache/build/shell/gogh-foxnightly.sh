#!/usr/bin/env bash

# Source:   gogh
# Theme:    Foxnightly
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
    print_osc4 0 "2a/2a/2e"
    print_osc4 1 "b9/8e/ff"
    print_osc4 2 "ff/7d/e9"
    print_osc4 3 "72/9f/cf"
    print_osc4 4 "66/a0/5b"
    print_osc4 5 "75/50/7b"
    print_osc4 6 "ac/ac/ae"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "a4/00/00"
    print_osc4 9 "bf/40/40"
    print_osc4 10 "66/a0/5b"
    print_osc4 11 "ff/b8/6c"
    print_osc4 12 "72/9f/cf"
    print_osc4 13 "8f/59/02"
    print_osc4 14 "c4/a0/00"
    print_osc4 15 "5c/35/66"

    print_osc_rgb 10 "d7/d7/db"
    print_osc_rgb 11 "2a/2a/2e"
    print_osc_rgb 12 "d7/d7/db"
    print_osc_rgb 17 "d7/d7/db"
    print_osc_rgb 19 "2a/2a/2e"
}

do_linux() {
    print_linux 0 "#2a2a2e"
    print_linux 1 "#b98eff"
    print_linux 2 "#ff7de9"
    print_linux 3 "#729fcf"
    print_linux 4 "#66a05b"
    print_linux 5 "#75507b"
    print_linux 6 "#acacae"
    print_linux 7 "#d7d7db"
    print_linux 8 "#a40000"
    print_linux 9 "#bf4040"
    print_linux 10 "#66a05b"
    print_linux 11 "#ffb86c"
    print_linux 12 "#729fcf"
    print_linux 13 "#8f5902"
    print_linux 14 "#c4a000"
    print_linux 15 "#5c3566"
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
