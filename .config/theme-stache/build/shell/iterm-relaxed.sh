#!/usr/bin/env bash

# Source:   iterm
# Theme:    Relaxed
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
    print_osc4 0 "14/14/14"
    print_osc4 1 "bb/56/53"
    print_osc4 2 "90/9d/62"
    print_osc4 3 "ea/c1/79"
    print_osc4 4 "69/86/98"
    print_osc4 5 "b0/65/97"
    print_osc4 6 "c9/df/ff"
    print_osc4 7 "d8/d8/d8"
    print_osc4 8 "62/62/62"
    print_osc4 9 "bb/56/53"
    print_osc4 10 "9f/ab/76"
    print_osc4 11 "ea/c1/79"
    print_osc4 12 "7d/a9/c7"
    print_osc4 13 "b0/65/97"
    print_osc4 14 "ab/ba/cf"
    print_osc4 15 "f7/f7/f7"

    print_osc_rgb 10 "d8/d8/d8"
    print_osc_rgb 11 "34/3a/43"
    print_osc_rgb 12 "d8/d8/d8"
    print_osc_rgb 17 "6a/79/84"
    print_osc_rgb 19 "d8/d8/d8"
}

do_linux() {
    print_linux 0 "#141414"
    print_linux 1 "#bb5653"
    print_linux 2 "#909d62"
    print_linux 3 "#eac179"
    print_linux 4 "#698698"
    print_linux 5 "#b06597"
    print_linux 6 "#c9dfff"
    print_linux 7 "#d8d8d8"
    print_linux 8 "#626262"
    print_linux 9 "#bb5653"
    print_linux 10 "#9fab76"
    print_linux 11 "#eac179"
    print_linux 12 "#7da9c7"
    print_linux 13 "#b06597"
    print_linux 14 "#abbacf"
    print_linux 15 "#f7f7f7"
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
