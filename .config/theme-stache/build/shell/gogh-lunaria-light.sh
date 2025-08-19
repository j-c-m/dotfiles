#!/usr/bin/env bash

# Source:   gogh
# Theme:    Lunaria Light
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
    print_osc4 0 "3e/3c/3d"
    print_osc4 1 "78/3c/1f"
    print_osc4 2 "49/7d/46"
    print_osc4 3 "8f/75/0b"
    print_osc4 4 "3f/35/66"
    print_osc4 5 "79/3f/62"
    print_osc4 6 "37/78/a9"
    print_osc4 7 "d5/cf/cc"
    print_osc4 8 "48/46/46"
    print_osc4 9 "b0/62/40"
    print_osc4 10 "7b/c1/75"
    print_osc4 11 "dc/b7/35"
    print_osc4 12 "5c/4f/89"
    print_osc4 13 "b5/68/95"
    print_osc4 14 "64/ba/ff"
    print_osc4 15 "eb/e4/e1"

    print_osc_rgb 10 "48/46/46"
    print_osc_rgb 11 "eb/e4/e1"
    print_osc_rgb 12 "48/46/46"
    print_osc_rgb 17 "48/46/46"
    print_osc_rgb 19 "eb/e4/e1"
}

do_linux() {
    print_linux 0 "#3e3c3d"
    print_linux 1 "#783c1f"
    print_linux 2 "#497d46"
    print_linux 3 "#8f750b"
    print_linux 4 "#3f3566"
    print_linux 5 "#793f62"
    print_linux 6 "#3778a9"
    print_linux 7 "#484646"
    print_linux 8 "#484646"
    print_linux 9 "#b06240"
    print_linux 10 "#7bc175"
    print_linux 11 "#dcb735"
    print_linux 12 "#5c4f89"
    print_linux 13 "#b56895"
    print_linux 14 "#64baff"
    print_linux 15 "#ebe4e1"
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
