#!/usr/bin/env bash

# Source:   base16
# Theme:    caroline
# Author:   ed (https://codeberg.org/ed)
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
    print_osc4 0 "1c/12/13"
    print_osc4 1 "c2/4f/57"
    print_osc4 2 "80/6c/61"
    print_osc4 3 "f2/81/71"
    print_osc4 4 "68/4c/59"
    print_osc4 5 "a6/36/50"
    print_osc4 6 "6b/65/66"
    print_osc4 7 "a8/75/69"
    print_osc4 8 "6d/47/45"
    print_osc4 9 "c2/4f/57"
    print_osc4 10 "80/6c/61"
    print_osc4 11 "f2/81/71"
    print_osc4 12 "68/4c/59"
    print_osc4 13 "a6/36/50"
    print_osc4 14 "6b/65/66"
    print_osc4 15 "e3/a6/8c"

    print_osc_rgb 10 "a8/75/69"
    print_osc_rgb 11 "1c/12/13"
    print_osc_rgb 12 "a8/75/69"
    print_osc_rgb 17 "c5/8d/7b"
    print_osc_rgb 19 "3a/24/25"
}

do_linux() {
    print_linux 0 "#1c1213"
    print_linux 1 "#c24f57"
    print_linux 2 "#806c61"
    print_linux 3 "#f28171"
    print_linux 4 "#684c59"
    print_linux 5 "#a63650"
    print_linux 6 "#6b6566"
    print_linux 7 "#a87569"
    print_linux 8 "#6d4745"
    print_linux 9 "#c24f57"
    print_linux 10 "#806c61"
    print_linux 11 "#f28171"
    print_linux 12 "#684c59"
    print_linux 13 "#a63650"
    print_linux 14 "#6b6566"
    print_linux 15 "#e3a68c"
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
