#!/usr/bin/env bash

# Source:   gogh
# Theme:    Omni
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "19/16/22"
    print_osc4 1 "e9/63/79"
    print_osc4 2 "67/e4/80"
    print_osc4 3 "e8/9e/64"
    print_osc4 4 "78/d1/e1"
    print_osc4 5 "98/8b/c7"
    print_osc4 6 "ff/79/c6"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "00/00/00"
    print_osc4 9 "e9/63/79"
    print_osc4 10 "67/e4/80"
    print_osc4 11 "e8/9e/64"
    print_osc4 12 "78/d1/e1"
    print_osc4 13 "98/8b/c7"
    print_osc4 14 "ff/79/c6"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ab/b2/bf"
    print_osc_rgb 11 "19/16/22"
    print_osc_rgb 12 "ab/b2/bf"
    print_osc_rgb 17 "ab/b2/bf"
    print_osc_rgb 19 "19/16/22"
}

do_linux() {
    print_linux 0 "#191622"
    print_linux 1 "#e96379"
    print_linux 2 "#67e480"
    print_linux 3 "#e89e64"
    print_linux 4 "#78d1e1"
    print_linux 5 "#988bc7"
    print_linux 6 "#ff79c6"
    print_linux 7 "#abb2bf"
    print_linux 8 "#000000"
    print_linux 9 "#e96379"
    print_linux 10 "#67e480"
    print_linux 11 "#e89e64"
    print_linux 12 "#78d1e1"
    print_linux 13 "#988bc7"
    print_linux 14 "#ff79c6"
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
