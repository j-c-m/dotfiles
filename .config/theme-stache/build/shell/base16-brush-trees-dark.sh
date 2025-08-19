#!/usr/bin/env bash

# Source:   base16
# Theme:    Brush Trees Dark
# Author:   Abraham White &lt;abelincoln.white@gmail.com&gt;
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
    print_osc4 0 "48/58/67"
    print_osc4 1 "b3/86/86"
    print_osc4 2 "87/b3/86"
    print_osc4 3 "aa/b3/86"
    print_osc4 4 "86/8c/b3"
    print_osc4 5 "b3/86/b2"
    print_osc4 6 "86/b3/b3"
    print_osc4 7 "b0/c5/c8"
    print_osc4 8 "82/99/a1"
    print_osc4 9 "b3/86/86"
    print_osc4 10 "87/b3/86"
    print_osc4 11 "aa/b3/86"
    print_osc4 12 "86/8c/b3"
    print_osc4 13 "b3/86/b2"
    print_osc4 14 "86/b3/b3"
    print_osc4 15 "e3/ef/ef"

    print_osc_rgb 10 "b0/c5/c8"
    print_osc_rgb 11 "48/58/67"
    print_osc_rgb 12 "b0/c5/c8"
    print_osc_rgb 17 "c9/db/dc"
    print_osc_rgb 19 "5a/6d/7a"
}

do_linux() {
    print_linux 0 "#485867"
    print_linux 1 "#b38686"
    print_linux 2 "#87b386"
    print_linux 3 "#aab386"
    print_linux 4 "#868cb3"
    print_linux 5 "#b386b2"
    print_linux 6 "#86b3b3"
    print_linux 7 "#b0c5c8"
    print_linux 8 "#8299a1"
    print_linux 9 "#b38686"
    print_linux 10 "#87b386"
    print_linux 11 "#aab386"
    print_linux 12 "#868cb3"
    print_linux 13 "#b386b2"
    print_linux 14 "#86b3b3"
    print_linux 15 "#e3efef"
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
