#!/usr/bin/env bash

# Source:   base24
# Theme:    Square
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "1a/1a/1a"
    print_osc4 1 "e9/89/7c"
    print_osc4 2 "b6/37/7d"
    print_osc4 3 "b6/de/fb"
    print_osc4 4 "a9/cd/eb"
    print_osc4 5 "75/50/7b"
    print_osc4 6 "c9/ca/ec"
    print_osc4 7 "ba/ba/ba"
    print_osc4 8 "4b/4b/4b"
    print_osc4 9 "f9/92/86"
    print_osc4 10 "c3/f7/86"
    print_osc4 11 "fc/fb/cc"
    print_osc4 12 "b6/de/fb"
    print_osc4 13 "ad/7f/a8"
    print_osc4 14 "d7/d9/fc"
    print_osc4 15 "e2/e2/e2"

    print_osc_rgb 10 "ba/ba/ba"
    print_osc_rgb 11 "1a/1a/1a"
    print_osc_rgb 12 "ba/ba/ba"
    print_osc_rgb 17 "f2/f2/f2"
    print_osc_rgb 19 "05/05/05"
}

do_linux() {
    print_linux 0 "#1a1a1a"
    print_linux 1 "#e9897c"
    print_linux 2 "#b6377d"
    print_linux 3 "#b6defb"
    print_linux 4 "#a9cdeb"
    print_linux 5 "#75507b"
    print_linux 6 "#c9caec"
    print_linux 7 "#bababa"
    print_linux 8 "#4b4b4b"
    print_linux 9 "#f99286"
    print_linux 10 "#c3f786"
    print_linux 11 "#fcfbcc"
    print_linux 12 "#b6defb"
    print_linux 13 "#ad7fa8"
    print_linux 14 "#d7d9fc"
    print_linux 15 "#e2e2e2"
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
