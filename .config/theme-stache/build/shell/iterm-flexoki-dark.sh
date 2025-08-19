#!/usr/bin/env bash

# Source:   iterm
# Theme:    flexoki-dark
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
    print_osc4 0 "10/0f/0f"
    print_osc4 1 "d1/4d/41"
    print_osc4 2 "87/9a/39"
    print_osc4 3 "d0/a2/15"
    print_osc4 4 "43/85/be"
    print_osc4 5 "ce/5d/97"
    print_osc4 6 "3a/a9/9f"
    print_osc4 7 "87/85/80"
    print_osc4 8 "57/56/53"
    print_osc4 9 "af/30/29"
    print_osc4 10 "66/80/0b"
    print_osc4 11 "ad/83/01"
    print_osc4 12 "20/5e/a6"
    print_osc4 13 "a0/2f/6f"
    print_osc4 14 "24/83/7b"
    print_osc4 15 "ce/cd/c3"

    print_osc_rgb 10 "ce/cd/c3"
    print_osc_rgb 11 "10/0f/0f"
    print_osc_rgb 12 "ce/cd/c3"
    print_osc_rgb 17 "ce/cd/c3"
    print_osc_rgb 19 "10/0f/0f"
}

do_linux() {
    print_linux 0 "#100f0f"
    print_linux 1 "#d14d41"
    print_linux 2 "#879a39"
    print_linux 3 "#d0a215"
    print_linux 4 "#4385be"
    print_linux 5 "#ce5d97"
    print_linux 6 "#3aa99f"
    print_linux 7 "#cecdc3"
    print_linux 8 "#575653"
    print_linux 9 "#af3029"
    print_linux 10 "#66800b"
    print_linux 11 "#ad8301"
    print_linux 12 "#205ea6"
    print_linux 13 "#a02f6f"
    print_linux 14 "#24837b"
    print_linux 15 "#cecdc3"
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
