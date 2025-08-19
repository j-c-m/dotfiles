#!/usr/bin/env bash

# Source:   iterm
# Theme:    One Double Dark
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
    print_osc4 0 "3c/44/52"
    print_osc4 1 "f0/63/72"
    print_osc4 2 "8b/c4/6f"
    print_osc4 3 "ec/be/6f"
    print_osc4 4 "3f/b1/f4"
    print_osc4 5 "d2/73/e3"
    print_osc4 6 "17/b8/c4"
    print_osc4 7 "db/df/e4"
    print_osc4 8 "51/5d/6e"
    print_osc4 9 "fe/76/7a"
    print_osc4 10 "82/d7/82"
    print_osc4 11 "f5/bf/64"
    print_osc4 12 "6c/ca/fe"
    print_osc4 13 "fe/7a/f4"
    print_osc4 14 "00/e4/fa"
    print_osc4 15 "f6/f9/fc"

    print_osc_rgb 10 "db/df/e4"
    print_osc_rgb 11 "28/2b/34"
    print_osc_rgb 12 "f5/df/db"
    print_osc_rgb 17 "58/5a/70"
    print_osc_rgb 19 "cd/d5/f4"
}

do_linux() {
    print_linux 0 "#3c4452"
    print_linux 1 "#f06372"
    print_linux 2 "#8bc46f"
    print_linux 3 "#ecbe6f"
    print_linux 4 "#3fb1f4"
    print_linux 5 "#d273e3"
    print_linux 6 "#17b8c4"
    print_linux 7 "#dbdfe4"
    print_linux 8 "#515d6e"
    print_linux 9 "#fe767a"
    print_linux 10 "#82d782"
    print_linux 11 "#f5bf64"
    print_linux 12 "#6ccafe"
    print_linux 13 "#fe7af4"
    print_linux 14 "#00e4fa"
    print_linux 15 "#f6f9fc"
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
