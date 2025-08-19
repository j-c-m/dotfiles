#!/usr/bin/env bash

# Source:   gogh
# Theme:    Urple
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "b0/42/5b"
    print_osc4 2 "37/a4/15"
    print_osc4 3 "ad/5c/42"
    print_osc4 4 "56/4d/9b"
    print_osc4 5 "6c/3c/a1"
    print_osc4 6 "80/80/80"
    print_osc4 7 "87/79/9c"
    print_osc4 8 "5d/32/25"
    print_osc4 9 "ff/63/88"
    print_osc4 10 "29/e6/20"
    print_osc4 11 "f0/81/61"
    print_osc4 12 "86/7a/ed"
    print_osc4 13 "a0/5e/ee"
    print_osc4 14 "ea/ea/ea"
    print_osc4 15 "bf/a3/ff"

    print_osc_rgb 10 "87/7a/9b"
    print_osc_rgb 11 "1b/1b/23"
    print_osc_rgb 12 "87/7a/9b"
    print_osc_rgb 17 "87/7a/9b"
    print_osc_rgb 19 "1b/1b/23"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#b0425b"
    print_linux 2 "#37a415"
    print_linux 3 "#ad5c42"
    print_linux 4 "#564d9b"
    print_linux 5 "#6c3ca1"
    print_linux 6 "#808080"
    print_linux 7 "#877a9b"
    print_linux 8 "#5d3225"
    print_linux 9 "#ff6388"
    print_linux 10 "#29e620"
    print_linux 11 "#f08161"
    print_linux 12 "#867aed"
    print_linux 13 "#a05eee"
    print_linux 14 "#eaeaea"
    print_linux 15 "#bfa3ff"
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
