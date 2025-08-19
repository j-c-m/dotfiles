#!/usr/bin/env bash

# Source:   gogh
# Theme:    Mona Lisa
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
    print_osc4 0 "35/1b/0e"
    print_osc4 1 "9b/29/1c"
    print_osc4 2 "63/62/32"
    print_osc4 3 "c3/6e/28"
    print_osc4 4 "51/5c/5d"
    print_osc4 5 "9b/1d/29"
    print_osc4 6 "58/80/56"
    print_osc4 7 "f7/d7/5c"
    print_osc4 8 "87/42/28"
    print_osc4 9 "ff/43/31"
    print_osc4 10 "b4/b2/64"
    print_osc4 11 "ff/95/66"
    print_osc4 12 "9e/b2/b4"
    print_osc4 13 "ff/5b/6a"
    print_osc4 14 "8a/cd/8f"
    print_osc4 15 "ff/e5/98"

    print_osc_rgb 10 "f7/d6/6a"
    print_osc_rgb 11 "12/0b/0d"
    print_osc_rgb 12 "f7/d6/6a"
    print_osc_rgb 17 "f7/d6/6a"
    print_osc_rgb 19 "12/0b/0d"
}

do_linux() {
    print_linux 0 "#351b0e"
    print_linux 1 "#9b291c"
    print_linux 2 "#636232"
    print_linux 3 "#c36e28"
    print_linux 4 "#515c5d"
    print_linux 5 "#9b1d29"
    print_linux 6 "#588056"
    print_linux 7 "#f7d66a"
    print_linux 8 "#874228"
    print_linux 9 "#ff4331"
    print_linux 10 "#b4b264"
    print_linux 11 "#ff9566"
    print_linux 12 "#9eb2b4"
    print_linux 13 "#ff5b6a"
    print_linux 14 "#8acd8f"
    print_linux 15 "#ffe598"
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
