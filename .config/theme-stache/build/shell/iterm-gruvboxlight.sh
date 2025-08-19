#!/usr/bin/env bash

# Source:   iterm
# Theme:    GruvboxLight
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
    print_osc4 0 "fb/f1/c7"
    print_osc4 1 "9d/00/06"
    print_osc4 2 "79/74/0e"
    print_osc4 3 "b5/76/14"
    print_osc4 4 "07/66/78"
    print_osc4 5 "8f/3f/71"
    print_osc4 6 "42/7b/58"
    print_osc4 7 "3c/38/36"
    print_osc4 8 "9d/83/74"
    print_osc4 9 "cc/24/1d"
    print_osc4 10 "98/97/1a"
    print_osc4 11 "d7/99/21"
    print_osc4 12 "45/85/88"
    print_osc4 13 "b1/61/86"
    print_osc4 14 "68/9d/69"
    print_osc4 15 "7c/6f/64"

    print_osc_rgb 10 "28/28/28"
    print_osc_rgb 11 "fb/f1/c7"
    print_osc_rgb 12 "28/28/28"
    print_osc_rgb 17 "d5/c4/a1"
    print_osc_rgb 19 "66/5c/54"
}

do_linux() {
    print_linux 0 "#fbf1c7"
    print_linux 1 "#9d0006"
    print_linux 2 "#79740e"
    print_linux 3 "#b57614"
    print_linux 4 "#076678"
    print_linux 5 "#8f3f71"
    print_linux 6 "#427b58"
    print_linux 7 "#282828"
    print_linux 8 "#9d8374"
    print_linux 9 "#cc241d"
    print_linux 10 "#98971a"
    print_linux 11 "#d79921"
    print_linux 12 "#458588"
    print_linux 13 "#b16186"
    print_linux 14 "#689d69"
    print_linux 15 "#7c6f64"
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
