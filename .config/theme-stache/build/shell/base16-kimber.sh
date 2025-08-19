#!/usr/bin/env bash

# Source:   base16
# Theme:    Kimber
# Author:   Mishka Nguyen (https://github.com/akhsiM)
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
    print_osc4 0 "22/22/22"
    print_osc4 1 "c8/8c/8c"
    print_osc4 2 "99/c8/99"
    print_osc4 3 "d8/b5/6d"
    print_osc4 4 "53/7c/9c"
    print_osc4 5 "86/ca/cd"
    print_osc4 6 "78/b4/b4"
    print_osc4 7 "de/de/e7"
    print_osc4 8 "64/46/46"
    print_osc4 9 "c8/8c/8c"
    print_osc4 10 "99/c8/99"
    print_osc4 11 "d8/b5/6d"
    print_osc4 12 "53/7c/9c"
    print_osc4 13 "86/ca/cd"
    print_osc4 14 "78/b4/b4"
    print_osc4 15 "ff/ff/e6"

    print_osc_rgb 10 "de/de/e7"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "de/de/e7"
    print_osc_rgb 17 "c3/c3/b4"
    print_osc_rgb 19 "31/31/31"
}

do_linux() {
    print_linux 0 "#222222"
    print_linux 1 "#c88c8c"
    print_linux 2 "#99c899"
    print_linux 3 "#d8b56d"
    print_linux 4 "#537c9c"
    print_linux 5 "#86cacd"
    print_linux 6 "#78b4b4"
    print_linux 7 "#dedee7"
    print_linux 8 "#644646"
    print_linux 9 "#c88c8c"
    print_linux 10 "#99c899"
    print_linux 11 "#d8b56d"
    print_linux 12 "#537c9c"
    print_linux 13 "#86cacd"
    print_linux 14 "#78b4b4"
    print_linux 15 "#ffffe6"
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
