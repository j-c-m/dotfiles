#!/usr/bin/env bash

# Source:   gogh
# Theme:    Shel
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
    print_osc4 0 "2c/24/23"
    print_osc4 1 "ab/24/63"
    print_osc4 2 "6c/a3/23"
    print_osc4 3 "ab/64/23"
    print_osc4 4 "2c/64/a2"
    print_osc4 5 "6c/24/a2"
    print_osc4 6 "2c/a3/63"
    print_osc4 7 "91/89/88"
    print_osc4 8 "91/89/88"
    print_osc4 9 "f5/88/b9"
    print_osc4 10 "c2/ee/86"
    print_osc4 11 "f5/ba/86"
    print_osc4 12 "8f/ba/ec"
    print_osc4 13 "c2/88/ec"
    print_osc4 14 "8f/ee/b9"
    print_osc4 15 "f5/ee/ec"

    print_osc_rgb 10 "48/82/cd"
    print_osc_rgb 11 "2a/20/1f"
    print_osc_rgb 12 "48/82/cd"
    print_osc_rgb 17 "48/82/cd"
    print_osc_rgb 19 "2a/20/1f"
}

do_linux() {
    print_linux 0 "#2c2423"
    print_linux 1 "#ab2463"
    print_linux 2 "#6ca323"
    print_linux 3 "#ab6423"
    print_linux 4 "#2c64a2"
    print_linux 5 "#6c24a2"
    print_linux 6 "#2ca363"
    print_linux 7 "#4882cd"
    print_linux 8 "#918988"
    print_linux 9 "#f588b9"
    print_linux 10 "#c2ee86"
    print_linux 11 "#f5ba86"
    print_linux 12 "#8fbaec"
    print_linux 13 "#c288ec"
    print_linux 14 "#8feeb9"
    print_linux 15 "#f5eeec"
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
