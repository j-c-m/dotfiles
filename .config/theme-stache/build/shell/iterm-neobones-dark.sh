#!/usr/bin/env bash

# Source:   iterm
# Theme:    neobones_dark
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
    print_osc4 0 "0e/18/1f"
    print_osc4 1 "de/6e/7c"
    print_osc4 2 "90/ff/6b"
    print_osc4 3 "b7/7e/63"
    print_osc4 4 "81/90/d4"
    print_osc4 5 "b2/79/a7"
    print_osc4 6 "66/a5/ad"
    print_osc4 7 "c6/d5/cf"
    print_osc4 8 "26/39/44"
    print_osc4 9 "e8/83/8f"
    print_osc4 10 "a0/ff/85"
    print_osc4 11 "d6/8c/67"
    print_osc4 12 "92/a0/e2"
    print_osc4 13 "cf/86/c1"
    print_osc4 14 "65/b8/c1"
    print_osc4 15 "98/a3/9e"

    print_osc_rgb 10 "c6/d5/cf"
    print_osc_rgb 11 "0e/18/1f"
    print_osc_rgb 12 "ce/dd/d7"
    print_osc_rgb 17 "3a/3e/3c"
    print_osc_rgb 19 "c6/d5/cf"
}

do_linux() {
    print_linux 0 "#0e181f"
    print_linux 1 "#de6e7c"
    print_linux 2 "#90ff6b"
    print_linux 3 "#b77e63"
    print_linux 4 "#8190d4"
    print_linux 5 "#b279a7"
    print_linux 6 "#66a5ad"
    print_linux 7 "#c6d5cf"
    print_linux 8 "#263944"
    print_linux 9 "#e8838f"
    print_linux 10 "#a0ff85"
    print_linux 11 "#d68c67"
    print_linux 12 "#92a0e2"
    print_linux 13 "#cf86c1"
    print_linux 14 "#65b8c1"
    print_linux 15 "#98a39e"
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
