#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyo Night Storm
# Author:   Michaël Ball
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
    print_osc4 0 "24/28/3b"
    print_osc4 1 "c0/ca/f5"
    print_osc4 2 "9e/ce/6a"
    print_osc4 3 "0d/b9/d7"
    print_osc4 4 "2a/c3/de"
    print_osc4 5 "bb/9a/f7"
    print_osc4 6 "b4/f9/f8"
    print_osc4 7 "a9/b1/d6"
    print_osc4 8 "44/4b/6a"
    print_osc4 9 "c0/ca/f5"
    print_osc4 10 "9e/ce/6a"
    print_osc4 11 "0d/b9/d7"
    print_osc4 12 "2a/c3/de"
    print_osc4 13 "bb/9a/f7"
    print_osc4 14 "b4/f9/f8"
    print_osc4 15 "d5/d6/db"

    print_osc_rgb 10 "a9/b1/d6"
    print_osc_rgb 11 "24/28/3b"
    print_osc_rgb 12 "a9/b1/d6"
    print_osc_rgb 17 "cb/cc/d1"
    print_osc_rgb 19 "16/16/1e"
}

do_linux() {
    print_linux 0 "#24283b"
    print_linux 1 "#c0caf5"
    print_linux 2 "#9ece6a"
    print_linux 3 "#0db9d7"
    print_linux 4 "#2ac3de"
    print_linux 5 "#bb9af7"
    print_linux 6 "#b4f9f8"
    print_linux 7 "#a9b1d6"
    print_linux 8 "#444b6a"
    print_linux 9 "#c0caf5"
    print_linux 10 "#9ece6a"
    print_linux 11 "#0db9d7"
    print_linux 12 "#2ac3de"
    print_linux 13 "#bb9af7"
    print_linux 14 "#b4f9f8"
    print_linux 15 "#d5d6db"
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
