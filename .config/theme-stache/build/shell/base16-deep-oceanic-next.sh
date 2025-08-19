#!/usr/bin/env bash

# Source:   base16
# Theme:    Deep Oceanic Next
# Author:   spearkkk (https://github.com/spearkkk)
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
    print_osc4 0 "00/1c/1f"
    print_osc4 1 "d3/46/4d"
    print_osc4 2 "63/b7/84"
    print_osc4 3 "f3/b8/63"
    print_osc4 4 "56/8c/cf"
    print_osc4 5 "8b/66/d6"
    print_osc4 6 "4f/b7/ae"
    print_osc4 7 "d4/e1/e8"
    print_osc4 8 "00/48/52"
    print_osc4 9 "d3/46/4d"
    print_osc4 10 "63/b7/84"
    print_osc4 11 "f3/b8/63"
    print_osc4 12 "56/8c/cf"
    print_osc4 13 "8b/66/d6"
    print_osc4 14 "4f/b7/ae"
    print_osc4 15 "f2/f7/f9"

    print_osc_rgb 10 "d4/e1/e8"
    print_osc_rgb 11 "00/1c/1f"
    print_osc_rgb 12 "d4/e1/e8"
    print_osc_rgb 17 "e0/e9/ef"
    print_osc_rgb 19 "00/29/31"
}

do_linux() {
    print_linux 0 "#001c1f"
    print_linux 1 "#d3464d"
    print_linux 2 "#63b784"
    print_linux 3 "#f3b863"
    print_linux 4 "#568ccf"
    print_linux 5 "#8b66d6"
    print_linux 6 "#4fb7ae"
    print_linux 7 "#d4e1e8"
    print_linux 8 "#004852"
    print_linux 9 "#d3464d"
    print_linux 10 "#63b784"
    print_linux 11 "#f3b863"
    print_linux 12 "#568ccf"
    print_linux 13 "#8b66d6"
    print_linux 14 "#4fb7ae"
    print_linux 15 "#f2f7f9"
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
