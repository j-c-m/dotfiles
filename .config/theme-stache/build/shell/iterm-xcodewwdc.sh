#!/usr/bin/env bash

# Source:   iterm
# Theme:    xcodewwdc
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
    print_osc4 0 "49/4d/5c"
    print_osc4 1 "bb/38/3a"
    print_osc4 2 "94/c6/6e"
    print_osc4 3 "d2/8e/5d"
    print_osc4 4 "88/84/c5"
    print_osc4 5 "b7/39/99"
    print_osc4 6 "00/ab/a4"
    print_osc4 7 "e7/e8/eb"
    print_osc4 8 "7f/86/9e"
    print_osc4 9 "bb/38/3a"
    print_osc4 10 "94/c6/6e"
    print_osc4 11 "d2/8e/5d"
    print_osc4 12 "88/84/c5"
    print_osc4 13 "b7/39/99"
    print_osc4 14 "00/ab/a4"
    print_osc4 15 "e7/e8/eb"

    print_osc_rgb 10 "e7/e8/eb"
    print_osc_rgb 11 "29/2c/36"
    print_osc_rgb 12 "e7/e8/eb"
    print_osc_rgb 17 "49/4d/5c"
    print_osc_rgb 19 "e7/e8/eb"
}

do_linux() {
    print_linux 0 "#494d5c"
    print_linux 1 "#bb383a"
    print_linux 2 "#94c66e"
    print_linux 3 "#d28e5d"
    print_linux 4 "#8884c5"
    print_linux 5 "#b73999"
    print_linux 6 "#00aba4"
    print_linux 7 "#e7e8eb"
    print_linux 8 "#7f869e"
    print_linux 9 "#bb383a"
    print_linux 10 "#94c66e"
    print_linux 11 "#d28e5d"
    print_linux 12 "#8884c5"
    print_linux 13 "#b73999"
    print_linux 14 "#00aba4"
    print_linux 15 "#e7e8eb"
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
