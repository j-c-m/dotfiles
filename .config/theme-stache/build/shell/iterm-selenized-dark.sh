#!/usr/bin/env bash

# Source:   iterm
# Theme:    selenized-dark
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "17/49/56"
    print_osc4 1 "fa/57/4f"
    print_osc4 2 "74/b9/37"
    print_osc4 3 "da/b3/2d"
    print_osc4 4 "45/94/f6"
    print_osc4 5 "f1/74/be"
    print_osc4 6 "40/c7/b9"
    print_osc4 7 "72/89/8f"
    print_osc4 8 "2d/5b/69"
    print_osc4 9 "ff/66/5c"
    print_osc4 10 "83/c7/46"
    print_osc4 11 "eb/c1/3c"
    print_osc4 12 "58/a2/ff"
    print_osc4 13 "ff/83/cc"
    print_osc4 14 "53/d5/c7"
    print_osc4 15 "ca/d8/d9"

    print_osc_rgb 10 "ac/bc/bc"
    print_osc_rgb 11 "0f/3c/48"
    print_osc_rgb 12 "ac/bc/bc"
    print_osc_rgb 17 "17/49/56"
    print_osc_rgb 19 "53/d5/c7"
}

do_linux() {
    print_linux 0 "#174956"
    print_linux 1 "#fa574f"
    print_linux 2 "#74b937"
    print_linux 3 "#dab32d"
    print_linux 4 "#4594f6"
    print_linux 5 "#f174be"
    print_linux 6 "#40c7b9"
    print_linux 7 "#acbcbc"
    print_linux 8 "#2d5b69"
    print_linux 9 "#ff665c"
    print_linux 10 "#83c746"
    print_linux 11 "#ebc13c"
    print_linux 12 "#58a2ff"
    print_linux 13 "#ff83cc"
    print_linux 14 "#53d5c7"
    print_linux 15 "#cad8d9"
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
