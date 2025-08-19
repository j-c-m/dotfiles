#!/usr/bin/env bash

# Source:   gogh
# Theme:    Modus Operandi Tinted
# Author:   
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
    print_osc4 0 "fb/f7/f0"
    print_osc4 1 "a6/00/00"
    print_osc4 2 "00/68/00"
    print_osc4 3 "6f/55/00"
    print_osc4 4 "00/31/a9"
    print_osc4 5 "72/10/45"
    print_osc4 6 "00/5e/8b"
    print_osc4 7 "00/00/00"
    print_osc4 8 "ef/e9/dd"
    print_osc4 9 "d0/00/00"
    print_osc4 10 "00/89/00"
    print_osc4 11 "80/80/00"
    print_osc4 12 "00/00/ff"
    print_osc4 13 "dd/22/dd"
    print_osc4 14 "00/88/99"
    print_osc4 15 "59/59/59"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "fb/f7/f0"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "00/00/00"
    print_osc_rgb 19 "fb/f7/f0"
}

do_linux() {
    print_linux 0 "#fbf7f0"
    print_linux 1 "#a60000"
    print_linux 2 "#006800"
    print_linux 3 "#6f5500"
    print_linux 4 "#0031a9"
    print_linux 5 "#721045"
    print_linux 6 "#005e8b"
    print_linux 7 "#000000"
    print_linux 8 "#efe9dd"
    print_linux 9 "#d00000"
    print_linux 10 "#008900"
    print_linux 11 "#808000"
    print_linux 12 "#0000ff"
    print_linux 13 "#dd22dd"
    print_linux 14 "#008899"
    print_linux 15 "#595959"
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
