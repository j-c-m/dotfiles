#!/usr/bin/env bash

# Source:   gogh
# Theme:    Soft Server
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "a2/68/6a"
    print_osc4 2 "9a/a5/6a"
    print_osc4 3 "a3/90/6a"
    print_osc4 4 "6b/8f/a3"
    print_osc4 5 "6a/71/a3"
    print_osc4 6 "6b/a5/8f"
    print_osc4 7 "99/a3/a2"
    print_osc4 8 "66/6c/6c"
    print_osc4 9 "dd/5c/60"
    print_osc4 10 "bf/df/55"
    print_osc4 11 "de/b3/60"
    print_osc4 12 "62/b1/df"
    print_osc4 13 "60/6e/df"
    print_osc4 14 "64/e3/9c"
    print_osc4 15 "d2/e0/de"

    print_osc_rgb 10 "99/a3/a2"
    print_osc_rgb 11 "24/26/26"
    print_osc_rgb 12 "99/a3/a2"
    print_osc_rgb 17 "99/a3/a2"
    print_osc_rgb 19 "24/26/26"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#a2686a"
    print_linux 2 "#9aa56a"
    print_linux 3 "#a3906a"
    print_linux 4 "#6b8fa3"
    print_linux 5 "#6a71a3"
    print_linux 6 "#6ba58f"
    print_linux 7 "#99a3a2"
    print_linux 8 "#666c6c"
    print_linux 9 "#dd5c60"
    print_linux 10 "#bfdf55"
    print_linux 11 "#deb360"
    print_linux 12 "#62b1df"
    print_linux 13 "#606edf"
    print_linux 14 "#64e39c"
    print_linux 15 "#d2e0de"
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
