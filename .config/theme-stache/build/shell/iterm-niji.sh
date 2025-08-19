#!/usr/bin/env bash

# Source:   iterm
# Theme:    niji
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "d2/3e/08"
    print_osc4 2 "54/ca/74"
    print_osc4 3 "ff/f7/00"
    print_osc4 4 "2a/b9/ff"
    print_osc4 5 "ff/50/da"
    print_osc4 6 "1e/f9/f5"
    print_osc4 7 "dd/d0/c4"
    print_osc4 8 "51/51/51"
    print_osc4 9 "ff/b7/b7"
    print_osc4 10 "c1/ff/ae"
    print_osc4 11 "fc/ff/b8"
    print_osc4 12 "8e/ff/f3"
    print_osc4 13 "ff/a2/ed"
    print_osc4 14 "bc/ff/c7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "14/15/15"
    print_osc_rgb 12 "ff/c6/63"
    print_osc_rgb 17 "51/51/51"
    print_osc_rgb 19 "ff/c6/63"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#d23e08"
    print_linux 2 "#54ca74"
    print_linux 3 "#fff700"
    print_linux 4 "#2ab9ff"
    print_linux 5 "#ff50da"
    print_linux 6 "#1ef9f5"
    print_linux 7 "#ffffff"
    print_linux 8 "#515151"
    print_linux 9 "#ffb7b7"
    print_linux 10 "#c1ffae"
    print_linux 11 "#fcffb8"
    print_linux 12 "#8efff3"
    print_linux 13 "#ffa2ed"
    print_linux 14 "#bcffc7"
    print_linux 15 "#ffffff"
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
