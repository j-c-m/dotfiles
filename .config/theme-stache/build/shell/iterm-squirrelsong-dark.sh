#!/usr/bin/env bash

# Source:   iterm
# Theme:    Squirrelsong Dark
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "37/29/1f"
    print_osc4 1 "b9/40/38"
    print_osc4 2 "45/83/36"
    print_osc4 3 "d3/b0/39"
    print_osc4 4 "43/94/c6"
    print_osc4 5 "84/5f/b8"
    print_osc4 6 "2e/97/93"
    print_osc4 7 "d3/b9/a2"
    print_osc4 8 "70/4e/38"
    print_osc4 9 "de/4c/42"
    print_osc4 10 "64/9a/4b"
    print_osc4 11 "e8/c1/3e"
    print_osc4 12 "4b/a4/da"
    print_osc4 13 "9c/70/da"
    print_osc4 14 "5f/ab/a8"
    print_osc4 15 "f1/d3/ba"

    print_osc_rgb 10 "b0/9b/88"
    print_osc_rgb 11 "37/29/1f"
    print_osc_rgb 12 "b0/9b/88"
    print_osc_rgb 17 "5b/3f/2e"
    print_osc_rgb 19 "b0/9b/88"
}

do_linux() {
    print_linux 0 "#37291f"
    print_linux 1 "#b94038"
    print_linux 2 "#458336"
    print_linux 3 "#d3b039"
    print_linux 4 "#4394c6"
    print_linux 5 "#845fb8"
    print_linux 6 "#2e9793"
    print_linux 7 "#b09b88"
    print_linux 8 "#704e38"
    print_linux 9 "#de4c42"
    print_linux 10 "#649a4b"
    print_linux 11 "#e8c13e"
    print_linux 12 "#4ba4da"
    print_linux 13 "#9c70da"
    print_linux 14 "#5faba8"
    print_linux 15 "#f1d3ba"
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
