#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Dawn
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "4a/4b/4e"
    print_osc4 1 "a3/2a/3a"
    print_osc4 2 "20/66/20"
    print_osc4 3 "74/53/00"
    print_osc4 4 "4b/52/9a"
    print_osc4 5 "8d/37/7e"
    print_osc4 6 "08/67/84"
    print_osc4 7 "de/e2/e0"
    print_osc4 8 "67/63/64"
    print_osc4 9 "a6/48/22"
    print_osc4 10 "18/74/08"
    print_osc4 11 "8b/59/0a"
    print_osc4 12 "5c/59/b2"
    print_osc4 13 "8e/45/a8"
    print_osc4 14 "3f/64/9c"
    print_osc4 15 "ef/f0/f2"

    print_osc_rgb 10 "4a/4b/4e"
    print_osc_rgb 11 "ef/f0/f2"
    print_osc_rgb 12 "4a/4b/4e"
    print_osc_rgb 17 "4a/4b/4e"
    print_osc_rgb 19 "ef/f0/f2"
}

do_linux() {
    print_linux 0 "#4a4b4e"
    print_linux 1 "#a32a3a"
    print_linux 2 "#206620"
    print_linux 3 "#745300"
    print_linux 4 "#4b529a"
    print_linux 5 "#8d377e"
    print_linux 6 "#086784"
    print_linux 7 "#4a4b4e"
    print_linux 8 "#676364"
    print_linux 9 "#a64822"
    print_linux 10 "#187408"
    print_linux 11 "#8b590a"
    print_linux 12 "#5c59b2"
    print_linux 13 "#8e45a8"
    print_linux 14 "#3f649c"
    print_linux 15 "#eff0f2"
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
