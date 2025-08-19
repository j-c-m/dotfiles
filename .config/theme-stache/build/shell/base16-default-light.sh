#!/usr/bin/env bash

# Source:   base16
# Theme:    Default Light
# Author:   Chris Kempson (http://chriskempson.com)
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "f8/f8/f8"
    print_osc4 1 "ab/46/42"
    print_osc4 2 "a1/b5/6c"
    print_osc4 3 "f7/ca/88"
    print_osc4 4 "7c/af/c2"
    print_osc4 5 "ba/8b/af"
    print_osc4 6 "86/c1/b9"
    print_osc4 7 "38/38/38"
    print_osc4 8 "b8/b8/b8"
    print_osc4 9 "ab/46/42"
    print_osc4 10 "a1/b5/6c"
    print_osc4 11 "f7/ca/88"
    print_osc4 12 "7c/af/c2"
    print_osc4 13 "ba/8b/af"
    print_osc4 14 "86/c1/b9"
    print_osc4 15 "18/18/18"

    print_osc_rgb 10 "38/38/38"
    print_osc_rgb 11 "f8/f8/f8"
    print_osc_rgb 12 "38/38/38"
    print_osc_rgb 17 "28/28/28"
    print_osc_rgb 19 "e8/e8/e8"
}

do_linux() {
    print_linux 0 "#f8f8f8"
    print_linux 1 "#ab4642"
    print_linux 2 "#a1b56c"
    print_linux 3 "#f7ca88"
    print_linux 4 "#7cafc2"
    print_linux 5 "#ba8baf"
    print_linux 6 "#86c1b9"
    print_linux 7 "#383838"
    print_linux 8 "#b8b8b8"
    print_linux 9 "#ab4642"
    print_linux 10 "#a1b56c"
    print_linux 11 "#f7ca88"
    print_linux 12 "#7cafc2"
    print_linux 13 "#ba8baf"
    print_linux 14 "#86c1b9"
    print_linux 15 "#181818"
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
