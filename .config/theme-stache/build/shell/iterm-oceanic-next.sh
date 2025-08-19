#!/usr/bin/env bash

# Source:   iterm
# Theme:    Oceanic-Next
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
    print_osc4 0 "15/2b/34"
    print_osc4 1 "eb/5f/66"
    print_osc4 2 "99/c6/93"
    print_osc4 3 "fa/c7/62"
    print_osc4 4 "66/98/cb"
    print_osc4 5 "c4/93/c4"
    print_osc4 6 "5f/b2/b2"
    print_osc4 7 "fe/fe/fe"
    print_osc4 8 "65/72/7d"
    print_osc4 9 "eb/5f/66"
    print_osc4 10 "99/c6/93"
    print_osc4 11 "fa/c7/62"
    print_osc4 12 "66/98/cb"
    print_osc4 13 "c4/93/c4"
    print_osc4 14 "5f/b2/b2"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "c0/c4/cd"
    print_osc_rgb 11 "15/2b/34"
    print_osc_rgb 12 "c0/c4/cd"
    print_osc_rgb 17 "4f/5a/65"
    print_osc_rgb 19 "c0/c4/cd"
}

do_linux() {
    print_linux 0 "#152b34"
    print_linux 1 "#eb5f66"
    print_linux 2 "#99c693"
    print_linux 3 "#fac762"
    print_linux 4 "#6698cb"
    print_linux 5 "#c493c4"
    print_linux 6 "#5fb2b2"
    print_linux 7 "#c0c4cd"
    print_linux 8 "#65727d"
    print_linux 9 "#eb5f66"
    print_linux 10 "#99c693"
    print_linux 11 "#fac762"
    print_linux 12 "#6698cb"
    print_linux 13 "#c493c4"
    print_linux 14 "#5fb2b2"
    print_linux 15 "#fefefe"
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
