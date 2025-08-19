#!/usr/bin/env bash

# Source:   base16
# Theme:    Gruvbox dark, pale
# Author:   Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "d7/5f/5f"
    print_osc4 2 "af/af/00"
    print_osc4 3 "ff/af/00"
    print_osc4 4 "83/ad/ad"
    print_osc4 5 "d4/85/ad"
    print_osc4 6 "85/ad/85"
    print_osc4 7 "da/b9/97"
    print_osc4 8 "8a/8a/8a"
    print_osc4 9 "d7/5f/5f"
    print_osc4 10 "af/af/00"
    print_osc4 11 "ff/af/00"
    print_osc4 12 "83/ad/ad"
    print_osc4 13 "d4/85/ad"
    print_osc4 14 "85/ad/85"
    print_osc4 15 "eb/db/b2"

    print_osc_rgb 10 "da/b9/97"
    print_osc_rgb 11 "26/26/26"
    print_osc_rgb 12 "da/b9/97"
    print_osc_rgb 17 "d5/c4/a1"
    print_osc_rgb 19 "3a/3a/3a"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#d75f5f"
    print_linux 2 "#afaf00"
    print_linux 3 "#ffaf00"
    print_linux 4 "#83adad"
    print_linux 5 "#d485ad"
    print_linux 6 "#85ad85"
    print_linux 7 "#dab997"
    print_linux 8 "#8a8a8a"
    print_linux 9 "#d75f5f"
    print_linux 10 "#afaf00"
    print_linux 11 "#ffaf00"
    print_linux 12 "#83adad"
    print_linux 13 "#d485ad"
    print_linux 14 "#85ad85"
    print_linux 15 "#ebdbb2"
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
