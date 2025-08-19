#!/usr/bin/env bash

# Source:   gogh
# Theme:    Atom
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
    print_osc4 1 "fd/5f/f1"
    print_osc4 2 "87/c3/8a"
    print_osc4 3 "ff/d7/b1"
    print_osc4 4 "85/be/fd"
    print_osc4 5 "b9/b6/fc"
    print_osc4 6 "85/be/fd"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "00/00/00"
    print_osc4 9 "fd/5f/f1"
    print_osc4 10 "94/fa/36"
    print_osc4 11 "f5/ff/a8"
    print_osc4 12 "96/cb/fe"
    print_osc4 13 "b9/b6/fc"
    print_osc4 14 "85/be/fd"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "c5/c8/c6"
    print_osc_rgb 11 "16/17/19"
    print_osc_rgb 12 "c5/c8/c6"
    print_osc_rgb 17 "c5/c8/c6"
    print_osc_rgb 19 "16/17/19"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fd5ff1"
    print_linux 2 "#87c38a"
    print_linux 3 "#ffd7b1"
    print_linux 4 "#85befd"
    print_linux 5 "#b9b6fc"
    print_linux 6 "#85befd"
    print_linux 7 "#c5c8c6"
    print_linux 8 "#000000"
    print_linux 9 "#fd5ff1"
    print_linux 10 "#94fa36"
    print_linux 11 "#f5ffa8"
    print_linux 12 "#96cbfe"
    print_linux 13 "#b9b6fc"
    print_linux 14 "#85befd"
    print_linux 15 "#e0e0e0"
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
