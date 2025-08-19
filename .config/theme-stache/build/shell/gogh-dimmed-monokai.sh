#!/usr/bin/env bash

# Source:   gogh
# Theme:    Dimmed Monokai
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
    print_osc4 0 "3a/3d/43"
    print_osc4 1 "be/3f/48"
    print_osc4 2 "87/9a/3b"
    print_osc4 3 "c5/a6/35"
    print_osc4 4 "4f/76/a1"
    print_osc4 5 "85/5c/8d"
    print_osc4 6 "57/8f/a4"
    print_osc4 7 "b9/bc/ba"
    print_osc4 8 "88/89/87"
    print_osc4 9 "fb/00/1f"
    print_osc4 10 "0f/72/2f"
    print_osc4 11 "c4/70/33"
    print_osc4 12 "18/6d/e3"
    print_osc4 13 "fb/00/67"
    print_osc4 14 "2e/70/6d"
    print_osc4 15 "fd/ff/b9"

    print_osc_rgb 10 "b9/bc/ba"
    print_osc_rgb 11 "1f/1f/1f"
    print_osc_rgb 12 "b9/bc/ba"
    print_osc_rgb 17 "b9/bc/ba"
    print_osc_rgb 19 "1f/1f/1f"
}

do_linux() {
    print_linux 0 "#3a3d43"
    print_linux 1 "#be3f48"
    print_linux 2 "#879a3b"
    print_linux 3 "#c5a635"
    print_linux 4 "#4f76a1"
    print_linux 5 "#855c8d"
    print_linux 6 "#578fa4"
    print_linux 7 "#b9bcba"
    print_linux 8 "#888987"
    print_linux 9 "#fb001f"
    print_linux 10 "#0f722f"
    print_linux 11 "#c47033"
    print_linux 12 "#186de3"
    print_linux 13 "#fb0067"
    print_linux 14 "#2e706d"
    print_linux 15 "#fdffb9"
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
