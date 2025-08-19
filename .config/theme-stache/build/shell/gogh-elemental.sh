#!/usr/bin/env bash

# Source:   gogh
# Theme:    Elemental
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
    print_osc4 0 "3c/3c/30"
    print_osc4 1 "98/29/0f"
    print_osc4 2 "47/9a/43"
    print_osc4 3 "7f/71/11"
    print_osc4 4 "49/7f/7d"
    print_osc4 5 "7f/4e/2f"
    print_osc4 6 "38/7f/58"
    print_osc4 7 "80/79/74"
    print_osc4 8 "55/54/45"
    print_osc4 9 "e0/50/2a"
    print_osc4 10 "61/e0/70"
    print_osc4 11 "d6/99/27"
    print_osc4 12 "79/d9/d9"
    print_osc4 13 "cd/7c/54"
    print_osc4 14 "59/d5/99"
    print_osc4 15 "ff/f1/e9"

    print_osc_rgb 10 "80/7a/74"
    print_osc_rgb 11 "22/21/1d"
    print_osc_rgb 12 "80/7a/74"
    print_osc_rgb 17 "80/7a/74"
    print_osc_rgb 19 "22/21/1d"
}

do_linux() {
    print_linux 0 "#3c3c30"
    print_linux 1 "#98290f"
    print_linux 2 "#479a43"
    print_linux 3 "#7f7111"
    print_linux 4 "#497f7d"
    print_linux 5 "#7f4e2f"
    print_linux 6 "#387f58"
    print_linux 7 "#807a74"
    print_linux 8 "#555445"
    print_linux 9 "#e0502a"
    print_linux 10 "#61e070"
    print_linux 11 "#d69927"
    print_linux 12 "#79d9d9"
    print_linux 13 "#cd7c54"
    print_linux 14 "#59d599"
    print_linux 15 "#fff1e9"
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
