#!/usr/bin/env bash

# Source:   iterm
# Theme:    Kanagawa Wave
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
    print_osc4 0 "09/06/18"
    print_osc4 1 "c3/40/43"
    print_osc4 2 "76/94/6a"
    print_osc4 3 "c0/a3/6e"
    print_osc4 4 "7e/9c/d8"
    print_osc4 5 "95/7f/b8"
    print_osc4 6 "6a/95/89"
    print_osc4 7 "c8/c0/93"
    print_osc4 8 "72/71/69"
    print_osc4 9 "e8/24/24"
    print_osc4 10 "98/bb/6c"
    print_osc4 11 "e6/c3/84"
    print_osc4 12 "7f/b4/ca"
    print_osc4 13 "93/8a/a9"
    print_osc4 14 "7a/a8/9f"
    print_osc4 15 "dc/d7/ba"

    print_osc_rgb 10 "dc/d7/ba"
    print_osc_rgb 11 "1f/1f/28"
    print_osc_rgb 12 "c8/c0/93"
    print_osc_rgb 17 "2d/4f/67"
    print_osc_rgb 19 "c8/c0/93"
}

do_linux() {
    print_linux 0 "#090618"
    print_linux 1 "#c34043"
    print_linux 2 "#76946a"
    print_linux 3 "#c0a36e"
    print_linux 4 "#7e9cd8"
    print_linux 5 "#957fb8"
    print_linux 6 "#6a9589"
    print_linux 7 "#dcd7ba"
    print_linux 8 "#727169"
    print_linux 9 "#e82424"
    print_linux 10 "#98bb6c"
    print_linux 11 "#e6c384"
    print_linux 12 "#7fb4ca"
    print_linux 13 "#938aa9"
    print_linux 14 "#7aa89f"
    print_linux 15 "#dcd7ba"
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
