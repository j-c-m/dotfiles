#!/usr/bin/env bash

# Source:   gogh
# Theme:    Google Light
# Author:   
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
    print_osc4 0 "20/21/24"
    print_osc4 1 "ea/43/35"
    print_osc4 2 "34/a8/53"
    print_osc4 3 "fb/bc/04"
    print_osc4 4 "42/85/f4"
    print_osc4 5 "a1/42/f4"
    print_osc4 6 "24/c1/e0"
    print_osc4 7 "e8/ea/ed"
    print_osc4 8 "5f/63/68"
    print_osc4 9 "ea/43/35"
    print_osc4 10 "34/a8/53"
    print_osc4 11 "fb/bc/05"
    print_osc4 12 "42/85/f4"
    print_osc4 13 "a1/42/f4"
    print_osc4 14 "24/c1/e0"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "5f/63/68"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "5f/63/68"
    print_osc_rgb 17 "5f/63/68"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#202124"
    print_linux 1 "#ea4335"
    print_linux 2 "#34a853"
    print_linux 3 "#fbbc04"
    print_linux 4 "#4285f4"
    print_linux 5 "#a142f4"
    print_linux 6 "#24c1e0"
    print_linux 7 "#5f6368"
    print_linux 8 "#5f6368"
    print_linux 9 "#ea4335"
    print_linux 10 "#34a853"
    print_linux 11 "#fbbc05"
    print_linux 12 "#4285f4"
    print_linux 13 "#a142f4"
    print_linux 14 "#24c1e0"
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
