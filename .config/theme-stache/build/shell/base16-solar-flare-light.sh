#!/usr/bin/env bash

# Source:   base16
# Theme:    Solar Flare Light
# Author:   Chuck Harmston (https://chuck.harmston.ch)
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
    print_osc4 0 "f5/f7/fa"
    print_osc4 1 "ef/52/53"
    print_osc4 2 "7c/c8/44"
    print_osc4 3 "e4/b5/1c"
    print_osc4 4 "33/b5/e1"
    print_osc4 5 "a3/63/d5"
    print_osc4 6 "52/cb/b0"
    print_osc4 7 "58/68/75"
    print_osc4 8 "85/93/9e"
    print_osc4 9 "ef/52/53"
    print_osc4 10 "7c/c8/44"
    print_osc4 11 "e4/b5/1c"
    print_osc4 12 "33/b5/e1"
    print_osc4 13 "a3/63/d5"
    print_osc4 14 "52/cb/b0"
    print_osc4 15 "18/26/2f"

    print_osc_rgb 10 "58/68/75"
    print_osc_rgb 11 "f5/f7/fa"
    print_osc_rgb 12 "58/68/75"
    print_osc_rgb 17 "22/2e/38"
    print_osc_rgb 19 "e8/e9/ed"
}

do_linux() {
    print_linux 0 "#f5f7fa"
    print_linux 1 "#ef5253"
    print_linux 2 "#7cc844"
    print_linux 3 "#e4b51c"
    print_linux 4 "#33b5e1"
    print_linux 5 "#a363d5"
    print_linux 6 "#52cbb0"
    print_linux 7 "#586875"
    print_linux 8 "#85939e"
    print_linux 9 "#ef5253"
    print_linux 10 "#7cc844"
    print_linux 11 "#e4b51c"
    print_linux 12 "#33b5e1"
    print_linux 13 "#a363d5"
    print_linux 14 "#52cbb0"
    print_linux 15 "#18262f"
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
