#!/usr/bin/env bash

# Source:   base16
# Theme:    Circus
# Author:   Stephan Boyer (https://github.com/stepchowfun) and Esther Wang (https://github.com/ewang12)
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "dc/65/7d"
    print_osc4 2 "84/b9/7c"
    print_osc4 3 "c3/ba/63"
    print_osc4 4 "63/9e/e4"
    print_osc4 5 "b8/88/e2"
    print_osc4 6 "4b/b1/a7"
    print_osc4 7 "a7/a7/a7"
    print_osc4 8 "5f/5a/60"
    print_osc4 9 "dc/65/7d"
    print_osc4 10 "84/b9/7c"
    print_osc4 11 "c3/ba/63"
    print_osc4 12 "63/9e/e4"
    print_osc4 13 "b8/88/e2"
    print_osc4 14 "4b/b1/a7"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "a7/a7/a7"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "a7/a7/a7"
    print_osc_rgb 17 "80/80/80"
    print_osc_rgb 19 "20/20/20"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#dc657d"
    print_linux 2 "#84b97c"
    print_linux 3 "#c3ba63"
    print_linux 4 "#639ee4"
    print_linux 5 "#b888e2"
    print_linux 6 "#4bb1a7"
    print_linux 7 "#a7a7a7"
    print_linux 8 "#5f5a60"
    print_linux 9 "#dc657d"
    print_linux 10 "#84b97c"
    print_linux 11 "#c3ba63"
    print_linux 12 "#639ee4"
    print_linux 13 "#b888e2"
    print_linux 14 "#4bb1a7"
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
