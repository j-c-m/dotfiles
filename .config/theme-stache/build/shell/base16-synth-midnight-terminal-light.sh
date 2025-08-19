#!/usr/bin/env bash

# Source:   base16
# Theme:    Synth Midnight Terminal Light
# Author:   Michaël Ball (http://github.com/michael-ball/)
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
    print_osc4 0 "dd/df/e0"
    print_osc4 1 "b5/3b/50"
    print_osc4 2 "06/ea/61"
    print_osc4 3 "c9/d3/64"
    print_osc4 4 "03/ae/ff"
    print_osc4 5 "ea/5c/e2"
    print_osc4 6 "42/ff/f9"
    print_osc4 7 "28/29/2a"
    print_osc4 8 "a3/a5/a6"
    print_osc4 9 "b5/3b/50"
    print_osc4 10 "06/ea/61"
    print_osc4 11 "c9/d3/64"
    print_osc4 12 "03/ae/ff"
    print_osc4 13 "ea/5c/e2"
    print_osc4 14 "42/ff/f9"
    print_osc4 15 "05/06/08"

    print_osc_rgb 10 "28/29/2a"
    print_osc_rgb 11 "dd/df/e0"
    print_osc_rgb 12 "28/29/2a"
    print_osc_rgb 17 "1a/1b/1c"
    print_osc_rgb 19 "cf/d1/d2"
}

do_linux() {
    print_linux 0 "#dddfe0"
    print_linux 1 "#b53b50"
    print_linux 2 "#06ea61"
    print_linux 3 "#c9d364"
    print_linux 4 "#03aeff"
    print_linux 5 "#ea5ce2"
    print_linux 6 "#42fff9"
    print_linux 7 "#28292a"
    print_linux 8 "#a3a5a6"
    print_linux 9 "#b53b50"
    print_linux 10 "#06ea61"
    print_linux 11 "#c9d364"
    print_linux 12 "#03aeff"
    print_linux 13 "#ea5ce2"
    print_linux 14 "#42fff9"
    print_linux 15 "#050608"
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
