#!/usr/bin/env bash

# Source:   base24
# Theme:    Slate
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
    print_osc4 0 "21/21/21"
    print_osc4 1 "e1/a7/bf"
    print_osc4 2 "80/d7/78"
    print_osc4 3 "79/af/d2"
    print_osc4 4 "25/4a/49"
    print_osc4 5 "a3/80/d3"
    print_osc4 6 "14/ab/9c"
    print_osc4 7 "42/d3/e8"
    print_osc4 8 "c0/f1/f8"
    print_osc4 9 "ff/cc/d8"
    print_osc4 10 "bd/ff/a8"
    print_osc4 11 "d0/cb/c9"
    print_osc4 12 "79/af/d2"
    print_osc4 13 "c4/a7/d8"
    print_osc4 14 "8b/de/e0"
    print_osc4 15 "e0/e0/e0"

    print_osc_rgb 10 "42/d3/e8"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "42/d3/e8"
    print_osc_rgb 17 "02/c4/e0"
    print_osc_rgb 19 "21/21/21"
}

do_linux() {
    print_linux 0 "#212121"
    print_linux 1 "#e1a7bf"
    print_linux 2 "#80d778"
    print_linux 3 "#79afd2"
    print_linux 4 "#254a49"
    print_linux 5 "#a380d3"
    print_linux 6 "#14ab9c"
    print_linux 7 "#42d3e8"
    print_linux 8 "#c0f1f8"
    print_linux 9 "#ffccd8"
    print_linux 10 "#bdffa8"
    print_linux 11 "#d0cbc9"
    print_linux 12 "#79afd2"
    print_linux 13 "#c4a7d8"
    print_linux 14 "#8bdee0"
    print_linux 15 "#e0e0e0"
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
