#!/usr/bin/env bash

# Source:   iterm
# Theme:    Urple
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
    print_osc4 1 "af/42/5b"
    print_osc4 2 "37/a3/15"
    print_osc4 3 "ac/5b/41"
    print_osc4 4 "55/4d/9a"
    print_osc4 5 "6c/3b/a1"
    print_osc4 6 "80/80/80"
    print_osc4 7 "87/79/9c"
    print_osc4 8 "5c/31/25"
    print_osc4 9 "ff/63/87"
    print_osc4 10 "28/e5/1f"
    print_osc4 11 "f0/80/61"
    print_osc4 12 "85/79/ed"
    print_osc4 13 "a0/5d/ee"
    print_osc4 14 "ea/ea/ea"
    print_osc4 15 "bf/a3/ff"

    print_osc_rgb 10 "86/79/9a"
    print_osc_rgb 11 "1b/1b/23"
    print_osc_rgb 12 "a0/62/ea"
    print_osc_rgb 17 "a0/62/ea"
    print_osc_rgb 19 "1b/1a/22"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#af425b"
    print_linux 2 "#37a315"
    print_linux 3 "#ac5b41"
    print_linux 4 "#554d9a"
    print_linux 5 "#6c3ba1"
    print_linux 6 "#808080"
    print_linux 7 "#86799a"
    print_linux 8 "#5c3125"
    print_linux 9 "#ff6387"
    print_linux 10 "#28e51f"
    print_linux 11 "#f08061"
    print_linux 12 "#8579ed"
    print_linux 13 "#a05dee"
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
