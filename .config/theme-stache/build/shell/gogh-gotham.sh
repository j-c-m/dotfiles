#!/usr/bin/env bash

# Source:   gogh
# Theme:    Gotham
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "0a/0f/14"
    print_osc4 1 "c3/30/27"
    print_osc4 2 "26/a9/8b"
    print_osc4 3 "ed/b5/4b"
    print_osc4 4 "19/54/65"
    print_osc4 5 "4e/51/65"
    print_osc4 6 "33/85/9d"
    print_osc4 7 "98/d1/ce"
    print_osc4 8 "10/15/1b"
    print_osc4 9 "d2/69/39"
    print_osc4 10 "08/1f/2d"
    print_osc4 11 "24/53/61"
    print_osc4 12 "09/37/48"
    print_osc4 13 "88/8b/a5"
    print_osc4 14 "59/9c/aa"
    print_osc4 15 "d3/eb/e9"

    print_osc_rgb 10 "98/d1/ce"
    print_osc_rgb 11 "0a/0f/14"
    print_osc_rgb 12 "98/d1/ce"
    print_osc_rgb 17 "98/d1/ce"
    print_osc_rgb 19 "0a/0f/14"
}

do_linux() {
    print_linux 0 "#0a0f14"
    print_linux 1 "#c33027"
    print_linux 2 "#26a98b"
    print_linux 3 "#edb54b"
    print_linux 4 "#195465"
    print_linux 5 "#4e5165"
    print_linux 6 "#33859d"
    print_linux 7 "#98d1ce"
    print_linux 8 "#10151b"
    print_linux 9 "#d26939"
    print_linux 10 "#081f2d"
    print_linux 11 "#245361"
    print_linux 12 "#093748"
    print_linux 13 "#888ba5"
    print_linux 14 "#599caa"
    print_linux 15 "#d3ebe9"
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
