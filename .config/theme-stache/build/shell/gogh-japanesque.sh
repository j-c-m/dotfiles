#!/usr/bin/env bash

# Source:   gogh
# Theme:    Japanesque
# Author:   
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
    print_osc4 0 "34/39/35"
    print_osc4 1 "cf/3f/61"
    print_osc4 2 "7b/b7/5b"
    print_osc4 3 "e9/b3/2a"
    print_osc4 4 "4c/9a/d4"
    print_osc4 5 "a5/7f/c4"
    print_osc4 6 "38/9a/ad"
    print_osc4 7 "fa/fa/f6"
    print_osc4 8 "59/5b/59"
    print_osc4 9 "d1/8f/a6"
    print_osc4 10 "76/7f/2c"
    print_osc4 11 "78/59/2f"
    print_osc4 12 "13/59/79"
    print_osc4 13 "60/42/91"
    print_osc4 14 "76/bb/ca"
    print_osc4 15 "b2/b5/ae"

    print_osc_rgb 10 "f7/f6/ec"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "f7/f6/ec"
    print_osc_rgb 17 "f7/f6/ec"
    print_osc_rgb 19 "1e/1e/1e"
}

do_linux() {
    print_linux 0 "#343935"
    print_linux 1 "#cf3f61"
    print_linux 2 "#7bb75b"
    print_linux 3 "#e9b32a"
    print_linux 4 "#4c9ad4"
    print_linux 5 "#a57fc4"
    print_linux 6 "#389aad"
    print_linux 7 "#f7f6ec"
    print_linux 8 "#595b59"
    print_linux 9 "#d18fa6"
    print_linux 10 "#767f2c"
    print_linux 11 "#78592f"
    print_linux 12 "#135979"
    print_linux 13 "#604291"
    print_linux 14 "#76bbca"
    print_linux 15 "#b2b5ae"
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
