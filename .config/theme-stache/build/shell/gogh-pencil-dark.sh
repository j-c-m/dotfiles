#!/usr/bin/env bash

# Source:   gogh
# Theme:    Pencil Dark
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
    print_osc4 0 "21/21/21"
    print_osc4 1 "c3/07/71"
    print_osc4 2 "10/a7/78"
    print_osc4 3 "a8/9c/14"
    print_osc4 4 "00/8e/c4"
    print_osc4 5 "52/3c/79"
    print_osc4 6 "20/a5/ba"
    print_osc4 7 "d9/d9/d9"
    print_osc4 8 "42/42/42"
    print_osc4 9 "fb/00/7a"
    print_osc4 10 "5f/d7/af"
    print_osc4 11 "f3/e4/30"
    print_osc4 12 "20/bb/fc"
    print_osc4 13 "68/55/de"
    print_osc4 14 "4f/b8/cc"
    print_osc4 15 "f1/f1/f1"

    print_osc_rgb 10 "f1/f1/f1"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "f1/f1/f1"
    print_osc_rgb 17 "f1/f1/f1"
    print_osc_rgb 19 "21/21/21"
}

do_linux() {
    print_linux 0 "#212121"
    print_linux 1 "#c30771"
    print_linux 2 "#10a778"
    print_linux 3 "#a89c14"
    print_linux 4 "#008ec4"
    print_linux 5 "#523c79"
    print_linux 6 "#20a5ba"
    print_linux 7 "#f1f1f1"
    print_linux 8 "#424242"
    print_linux 9 "#fb007a"
    print_linux 10 "#5fd7af"
    print_linux 11 "#f3e430"
    print_linux 12 "#20bbfc"
    print_linux 13 "#6855de"
    print_linux 14 "#4fb8cc"
    print_linux 15 "#f1f1f1"
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
