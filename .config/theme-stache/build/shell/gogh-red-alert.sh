#!/usr/bin/env bash

# Source:   gogh
# Theme:    Red Alert
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "d6/2e/4e"
    print_osc4 2 "71/be/6b"
    print_osc4 3 "be/b8/6b"
    print_osc4 4 "48/9b/ee"
    print_osc4 5 "e9/79/d7"
    print_osc4 6 "6b/be/b8"
    print_osc4 7 "d6/d6/d6"
    print_osc4 8 "26/26/26"
    print_osc4 9 "e0/25/53"
    print_osc4 10 "af/f0/8c"
    print_osc4 11 "df/dd/b7"
    print_osc4 12 "65/aa/f1"
    print_osc4 13 "dd/b7/df"
    print_osc4 14 "b7/df/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "76/24/23"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "76/24/23"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d62e4e"
    print_linux 2 "#71be6b"
    print_linux 3 "#beb86b"
    print_linux 4 "#489bee"
    print_linux 5 "#e979d7"
    print_linux 6 "#6bbeb8"
    print_linux 7 "#ffffff"
    print_linux 8 "#262626"
    print_linux 9 "#e02553"
    print_linux 10 "#aff08c"
    print_linux 11 "#dfddb7"
    print_linux 12 "#65aaf1"
    print_linux 13 "#ddb7df"
    print_linux 14 "#b7dfdd"
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
