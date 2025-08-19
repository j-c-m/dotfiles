#!/usr/bin/env bash

# Source:   iterm
# Theme:    Havn Skumring
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
    print_osc4 0 "24/2c/46"
    print_osc4 1 "ea/55/3e"
    print_osc4 2 "6d/ac/7a"
    print_osc4 3 "f8/b3/30"
    print_osc4 4 "59/6b/f7"
    print_osc4 5 "7b/71/9d"
    print_osc4 6 "d4/88/c1"
    print_osc4 7 "dc/e0/ee"
    print_osc4 8 "1f/28/41"
    print_osc4 9 "d0/72/63"
    print_osc4 10 "8b/9d/8e"
    print_osc4 11 "ea/c4/8b"
    print_osc4 12 "50/86/cb"
    print_osc4 13 "9a/7b/ee"
    print_osc4 14 "d0/79/b5"
    print_osc4 15 "fe/f5/e0"

    print_osc_rgb 10 "d6/db/eb"
    print_osc_rgb 11 "11/15/21"
    print_osc_rgb 12 "27/79/6e"
    print_osc_rgb 17 "2b/51/4a"
    print_osc_rgb 19 "db/df/ef"
}

do_linux() {
    print_linux 0 "#242c46"
    print_linux 1 "#ea553e"
    print_linux 2 "#6dac7a"
    print_linux 3 "#f8b330"
    print_linux 4 "#596bf7"
    print_linux 5 "#7b719d"
    print_linux 6 "#d488c1"
    print_linux 7 "#d6dbeb"
    print_linux 8 "#1f2841"
    print_linux 9 "#d07263"
    print_linux 10 "#8b9d8e"
    print_linux 11 "#eac48b"
    print_linux 12 "#5086cb"
    print_linux 13 "#9a7bee"
    print_linux 14 "#d079b5"
    print_linux 15 "#fef5e0"
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
