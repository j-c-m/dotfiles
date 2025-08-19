#!/usr/bin/env bash

# Source:   gogh
# Theme:    Lunaria Eclipse
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
    print_osc4 0 "32/3f/46"
    print_osc4 1 "83/61/5b"
    print_osc4 2 "7f/97/81"
    print_osc4 3 "a6/98/75"
    print_osc4 4 "53/51/6f"
    print_osc4 5 "85/68/80"
    print_osc4 6 "7d/96/b2"
    print_osc4 7 "c9/cd/d7"
    print_osc4 8 "3d/49/50"
    print_osc4 9 "ba/90/88"
    print_osc4 10 "be/db/c1"
    print_osc4 11 "f1/df/b4"
    print_osc4 12 "76/74/95"
    print_osc4 13 "be/9c/b8"
    print_osc4 14 "bc/db/ff"
    print_osc4 15 "df/e2/ed"

    print_osc_rgb 10 "c9/cd/d7"
    print_osc_rgb 11 "32/3f/46"
    print_osc_rgb 12 "c9/cd/d7"
    print_osc_rgb 17 "c9/cd/d7"
    print_osc_rgb 19 "32/3f/46"
}

do_linux() {
    print_linux 0 "#323f46"
    print_linux 1 "#83615b"
    print_linux 2 "#7f9781"
    print_linux 3 "#a69875"
    print_linux 4 "#53516f"
    print_linux 5 "#856880"
    print_linux 6 "#7d96b2"
    print_linux 7 "#c9cdd7"
    print_linux 8 "#3d4950"
    print_linux 9 "#ba9088"
    print_linux 10 "#bedbc1"
    print_linux 11 "#f1dfb4"
    print_linux 12 "#767495"
    print_linux 13 "#be9cb8"
    print_linux 14 "#bcdbff"
    print_linux 15 "#dfe2ed"
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
