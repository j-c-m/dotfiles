#!/usr/bin/env bash

# Source:   iterm
# Theme:    One Double Light
# Author:   unknown
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "44/4b/58"
    print_osc4 1 "f6/47/3f"
    print_osc4 2 "24/a3/43"
    print_osc4 3 "cb/80/00"
    print_osc4 4 "00/86/c1"
    print_osc4 5 "b5/0d/a9"
    print_osc4 6 "00/99/b6"
    print_osc4 7 "eb/d8/d8"
    print_osc4 8 "0d/13/1e"
    print_osc4 9 "fe/36/11"
    print_osc4 10 "00/b9/0d"
    print_osc4 11 "eb/99/00"
    print_osc4 12 "10/64/dd"
    print_osc4 13 "e5/00/d7"
    print_osc4 14 "00/b4/dc"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "37/3a/42"
    print_osc_rgb 11 "fa/f9/f9"
    print_osc_rgb 12 "19/19/19"
    print_osc_rgb 17 "45/4e/5e"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#444b58"
    print_linux 1 "#f6473f"
    print_linux 2 "#24a343"
    print_linux 3 "#cb8000"
    print_linux 4 "#0086c1"
    print_linux 5 "#b50da9"
    print_linux 6 "#0099b6"
    print_linux 7 "#373a42"
    print_linux 8 "#0d131e"
    print_linux 9 "#fe3611"
    print_linux 10 "#00b90d"
    print_linux 11 "#eb9900"
    print_linux 12 "#1064dd"
    print_linux 13 "#e500d7"
    print_linux 14 "#00b4dc"
    print_linux 15 "#fefefe"
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
