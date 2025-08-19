#!/usr/bin/env bash

# Source:   iterm
# Theme:    Red Alert
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "d5/2e/4d"
    print_osc4 2 "71/be/6b"
    print_osc4 3 "be/b8/6b"
    print_osc4 4 "47/9b/ed"
    print_osc4 5 "e8/78/d6"
    print_osc4 6 "6b/be/b8"
    print_osc4 7 "d6/d6/d6"
    print_osc4 8 "26/26/26"
    print_osc4 9 "e0/24/53"
    print_osc4 10 "af/f0/8b"
    print_osc4 11 "df/dd/b7"
    print_osc4 12 "65/a9/f0"
    print_osc4 13 "dd/b7/df"
    print_osc4 14 "b7/df/dd"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "76/24/23"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "07/36/42"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d52e4d"
    print_linux 2 "#71be6b"
    print_linux 3 "#beb86b"
    print_linux 4 "#479bed"
    print_linux 5 "#e878d6"
    print_linux 6 "#6bbeb8"
    print_linux 7 "#ffffff"
    print_linux 8 "#262626"
    print_linux 9 "#e02453"
    print_linux 10 "#aff08b"
    print_linux 11 "#dfddb7"
    print_linux 12 "#65a9f0"
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
