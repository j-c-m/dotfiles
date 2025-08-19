#!/usr/bin/env bash

# Source:   iterm
# Theme:    SoftServer
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "a1/68/69"
    print_osc4 2 "99/a5/69"
    print_osc4 3 "a2/90/69"
    print_osc4 4 "6a/8f/a3"
    print_osc4 5 "69/71/a3"
    print_osc4 6 "6b/a4/8f"
    print_osc4 7 "99/a3/a2"
    print_osc4 8 "66/6c/6b"
    print_osc4 9 "dc/5b/5f"
    print_osc4 10 "bf/de/54"
    print_osc4 11 "de/b3/5f"
    print_osc4 12 "62/b1/df"
    print_osc4 13 "5f/6e/de"
    print_osc4 14 "64/e3/9c"
    print_osc4 15 "d1/df/de"

    print_osc_rgb 10 "99/a3/a2"
    print_osc_rgb 11 "24/26/26"
    print_osc_rgb 12 "d1/df/de"
    print_osc_rgb 17 "7f/87/86"
    print_osc_rgb 19 "ef/ff/fd"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#a16869"
    print_linux 2 "#99a569"
    print_linux 3 "#a29069"
    print_linux 4 "#6a8fa3"
    print_linux 5 "#6971a3"
    print_linux 6 "#6ba48f"
    print_linux 7 "#99a3a2"
    print_linux 8 "#666c6b"
    print_linux 9 "#dc5b5f"
    print_linux 10 "#bfde54"
    print_linux 11 "#deb35f"
    print_linux 12 "#62b1df"
    print_linux 13 "#5f6ede"
    print_linux 14 "#64e39c"
    print_linux 15 "#d1dfde"
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
