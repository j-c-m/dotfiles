#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tempus Day
# Author:   Protesilaos Stavrou (https://protesilaos.com)
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
    print_osc4 0 "46/43/40"
    print_osc4 1 "c8/10/00"
    print_osc4 2 "10/74/10"
    print_osc4 3 "80/60/00"
    print_osc4 4 "38/5d/c4"
    print_osc4 5 "b6/30/52"
    print_osc4 6 "00/70/70"
    print_osc4 7 "e7/e3/d7"
    print_osc4 8 "68/60/7d"
    print_osc4 9 "b2/40/00"
    print_osc4 10 "42/70/40"
    print_osc4 11 "6f/66/00"
    print_osc4 12 "0f/64/c4"
    print_osc4 13 "80/50/a7"
    print_osc4 14 "33/6c/87"
    print_osc4 15 "f8/f2/e5"

    print_osc_rgb 10 "46/43/40"
    print_osc_rgb 11 "f8/f2/e5"
    print_osc_rgb 12 "46/43/40"
    print_osc_rgb 17 "46/43/40"
    print_osc_rgb 19 "f8/f2/e5"
}

do_linux() {
    print_linux 0 "#464340"
    print_linux 1 "#c81000"
    print_linux 2 "#107410"
    print_linux 3 "#806000"
    print_linux 4 "#385dc4"
    print_linux 5 "#b63052"
    print_linux 6 "#007070"
    print_linux 7 "#464340"
    print_linux 8 "#68607d"
    print_linux 9 "#b24000"
    print_linux 10 "#427040"
    print_linux 11 "#6f6600"
    print_linux 12 "#0f64c4"
    print_linux 13 "#8050a7"
    print_linux 14 "#336c87"
    print_linux 15 "#f8f2e5"
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
