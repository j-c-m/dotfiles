#!/usr/bin/env bash

# Source:   base16
# Theme:    Gruvbox Light
# Author:   Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)
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
    print_osc4 0 "fb/f1/c7"
    print_osc4 1 "cc/24/1d"
    print_osc4 2 "98/97/1a"
    print_osc4 3 "d7/99/21"
    print_osc4 4 "45/85/88"
    print_osc4 5 "b1/62/86"
    print_osc4 6 "68/9d/6a"
    print_osc4 7 "3c/38/36"
    print_osc4 8 "bd/ae/93"
    print_osc4 9 "cc/24/1d"
    print_osc4 10 "98/97/1a"
    print_osc4 11 "d7/99/21"
    print_osc4 12 "45/85/88"
    print_osc4 13 "b1/62/86"
    print_osc4 14 "68/9d/6a"
    print_osc4 15 "1d/20/21"

    print_osc_rgb 10 "3c/38/36"
    print_osc_rgb 11 "fb/f1/c7"
    print_osc_rgb 12 "3c/38/36"
    print_osc_rgb 17 "28/28/28"
    print_osc_rgb 19 "eb/db/b2"
}

do_linux() {
    print_linux 0 "#fbf1c7"
    print_linux 1 "#cc241d"
    print_linux 2 "#98971a"
    print_linux 3 "#d79921"
    print_linux 4 "#458588"
    print_linux 5 "#b16286"
    print_linux 6 "#689d6a"
    print_linux 7 "#3c3836"
    print_linux 8 "#bdae93"
    print_linux 9 "#cc241d"
    print_linux 10 "#98971a"
    print_linux 11 "#d79921"
    print_linux 12 "#458588"
    print_linux 13 "#b16286"
    print_linux 14 "#689d6a"
    print_linux 15 "#1d2021"
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
