#!/usr/bin/env bash

# Source:   iterm
# Theme:    Snazzy
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
    print_osc4 1 "fb/42/45"
    print_osc4 2 "50/fa/7b"
    print_osc4 3 "f0/fa/8b"
    print_osc4 4 "49/b9/fe"
    print_osc4 5 "fb/4c/b3"
    print_osc4 6 "8b/e9/fd"
    print_osc4 7 "ed/ed/ec"
    print_osc4 8 "55/55/55"
    print_osc4 9 "fb/42/45"
    print_osc4 10 "50/fa/7b"
    print_osc4 11 "f0/fa/8b"
    print_osc4 12 "49/b9/fe"
    print_osc4 13 "fb/4c/b3"
    print_osc4 14 "8b/e9/fd"
    print_osc4 15 "ed/ed/ec"

    print_osc_rgb 10 "eb/ec/e6"
    print_osc_rgb 11 "1e/1f/28"
    print_osc_rgb 12 "e4/e4/e4"
    print_osc_rgb 17 "80/ad/c5"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fb4245"
    print_linux 2 "#50fa7b"
    print_linux 3 "#f0fa8b"
    print_linux 4 "#49b9fe"
    print_linux 5 "#fb4cb3"
    print_linux 6 "#8be9fd"
    print_linux 7 "#ebece6"
    print_linux 8 "#555555"
    print_linux 9 "#fb4245"
    print_linux 10 "#50fa7b"
    print_linux 11 "#f0fa8b"
    print_linux 12 "#49b9fe"
    print_linux 13 "#fb4cb3"
    print_linux 14 "#8be9fd"
    print_linux 15 "#ededec"
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
