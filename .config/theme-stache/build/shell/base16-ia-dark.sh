#!/usr/bin/env bash

# Source:   base16
# Theme:    iA Dark
# Author:   iA Inc. (modified by aramisgithub)
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
    print_osc4 0 "1a/1a/1a"
    print_osc4 1 "d8/85/68"
    print_osc4 2 "83/a4/71"
    print_osc4 3 "b9/93/53"
    print_osc4 4 "8e/cc/dd"
    print_osc4 5 "b9/8e/b2"
    print_osc4 6 "7c/9c/ae"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "76/76/76"
    print_osc4 9 "d8/85/68"
    print_osc4 10 "83/a4/71"
    print_osc4 11 "b9/93/53"
    print_osc4 12 "8e/cc/dd"
    print_osc4 13 "b9/8e/b2"
    print_osc4 14 "7c/9c/ae"
    print_osc4 15 "f8/f8/f8"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "1a/1a/1a"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "e8/e8/e8"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#1a1a1a"
    print_linux 1 "#d88568"
    print_linux 2 "#83a471"
    print_linux 3 "#b99353"
    print_linux 4 "#8eccdd"
    print_linux 5 "#b98eb2"
    print_linux 6 "#7c9cae"
    print_linux 7 "#cccccc"
    print_linux 8 "#767676"
    print_linux 9 "#d88568"
    print_linux 10 "#83a471"
    print_linux 11 "#b99353"
    print_linux 12 "#8eccdd"
    print_linux 13 "#b98eb2"
    print_linux 14 "#7c9cae"
    print_linux 15 "#f8f8f8"
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
