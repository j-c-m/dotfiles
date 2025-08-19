#!/usr/bin/env bash

# Source:   base16
# Theme:    Tokyo Night Terminal Light
# Author:   Michaël Ball
# Variant:  light

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
    print_osc4 0 "d5/d6/db"
    print_osc4 1 "8c/43/51"
    print_osc4 2 "33/63/5c"
    print_osc4 3 "8f/5e/15"
    print_osc4 4 "34/54/8a"
    print_osc4 5 "5a/4a/78"
    print_osc4 6 "0f/4b/6e"
    print_osc4 7 "4c/50/5e"
    print_osc4 8 "96/99/a3"
    print_osc4 9 "8c/43/51"
    print_osc4 10 "33/63/5c"
    print_osc4 11 "8f/5e/15"
    print_osc4 12 "34/54/8a"
    print_osc4 13 "5a/4a/78"
    print_osc4 14 "0f/4b/6e"
    print_osc4 15 "1a/1b/26"

    print_osc_rgb 10 "4c/50/5e"
    print_osc_rgb 11 "d5/d6/db"
    print_osc_rgb 12 "4c/50/5e"
    print_osc_rgb 17 "1a/1b/26"
    print_osc_rgb 19 "cb/cc/d1"
}

do_linux() {
    print_linux 0 "#d5d6db"
    print_linux 1 "#8c4351"
    print_linux 2 "#33635c"
    print_linux 3 "#8f5e15"
    print_linux 4 "#34548a"
    print_linux 5 "#5a4a78"
    print_linux 6 "#0f4b6e"
    print_linux 7 "#4c505e"
    print_linux 8 "#9699a3"
    print_linux 9 "#8c4351"
    print_linux 10 "#33635c"
    print_linux 11 "#8f5e15"
    print_linux 12 "#34548a"
    print_linux 13 "#5a4a78"
    print_linux 14 "#0f4b6e"
    print_linux 15 "#1a1b26"
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
