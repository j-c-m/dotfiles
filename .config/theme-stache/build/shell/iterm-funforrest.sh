#!/usr/bin/env bash

# Source:   iterm
# Theme:    FunForrest
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
    print_osc4 1 "d5/25/2b"
    print_osc4 2 "90/9b/00"
    print_osc4 3 "bd/8a/13"
    print_osc4 4 "46/98/a2"
    print_osc4 5 "8c/42/31"
    print_osc4 6 "d9/81/12"
    print_osc4 7 "dd/c1/65"
    print_osc4 8 "7e/69/54"
    print_osc4 9 "e4/59/1b"
    print_osc4 10 "bf/c6/59"
    print_osc4 11 "ff/ca/1b"
    print_osc4 12 "7c/c9/ce"
    print_osc4 13 "d1/63/49"
    print_osc4 14 "e6/a9/6b"
    print_osc4 15 "ff/e9/a3"

    print_osc_rgb 10 "dd/c1/65"
    print_osc_rgb 11 "24/12/00"
    print_osc_rgb 12 "e5/59/1c"
    print_osc_rgb 17 "e5/59/1c"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d5252b"
    print_linux 2 "#909b00"
    print_linux 3 "#bd8a13"
    print_linux 4 "#4698a2"
    print_linux 5 "#8c4231"
    print_linux 6 "#d98112"
    print_linux 7 "#ddc165"
    print_linux 8 "#7e6954"
    print_linux 9 "#e4591b"
    print_linux 10 "#bfc659"
    print_linux 11 "#ffca1b"
    print_linux 12 "#7cc9ce"
    print_linux 13 "#d16349"
    print_linux 14 "#e6a96b"
    print_linux 15 "#ffe9a3"
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
