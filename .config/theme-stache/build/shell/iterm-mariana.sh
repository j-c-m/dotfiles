#!/usr/bin/env bash

# Source:   iterm
# Theme:    Mariana
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ec/5f/66"
    print_osc4 2 "99/c7/94"
    print_osc4 3 "f9/ae/58"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "c6/95/c6"
    print_osc4 6 "5f/b4/b4"
    print_osc4 7 "f7/f7/f7"
    print_osc4 8 "33/33/33"
    print_osc4 9 "f9/7b/58"
    print_osc4 10 "ac/d1/a8"
    print_osc4 11 "fa/c7/61"
    print_osc4 12 "85/ad/d6"
    print_osc4 13 "d8/b6/d8"
    print_osc4 14 "82/c4/c4"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "d8/de/e9"
    print_osc_rgb 11 "34/3d/46"
    print_osc_rgb 12 "fb/bb/6a"
    print_osc_rgb 17 "4e/5a/65"
    print_osc_rgb 19 "d8/de/e9"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ec5f66"
    print_linux 2 "#99c794"
    print_linux 3 "#f9ae58"
    print_linux 4 "#6699cc"
    print_linux 5 "#c695c6"
    print_linux 6 "#5fb4b4"
    print_linux 7 "#d8dee9"
    print_linux 8 "#333333"
    print_linux 9 "#f97b58"
    print_linux 10 "#acd1a8"
    print_linux 11 "#fac761"
    print_linux 12 "#85add6"
    print_linux 13 "#d8b6d8"
    print_linux 14 "#82c4c4"
    print_linux 15 "#feffff"
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
