#!/usr/bin/env bash

# Source:   iterm
# Theme:    Bright Lights
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "ff/35/5b"
    print_osc4 2 "b7/e8/76"
    print_osc4 3 "ff/c2/51"
    print_osc4 4 "76/d4/ff"
    print_osc4 5 "ba/76/e7"
    print_osc4 6 "6c/bf/b5"
    print_osc4 7 "c2/c8/d7"
    print_osc4 8 "19/19/19"
    print_osc4 9 "ff/35/5b"
    print_osc4 10 "b7/e8/76"
    print_osc4 11 "ff/c2/51"
    print_osc4 12 "76/d5/ff"
    print_osc4 13 "ba/76/e7"
    print_osc4 14 "6c/bf/b5"
    print_osc4 15 "c2/c8/d7"

    print_osc_rgb 10 "b3/c9/d7"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "f3/4a/00"
    print_osc_rgb 17 "b3/c9/d7"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#ff355b"
    print_linux 2 "#b7e876"
    print_linux 3 "#ffc251"
    print_linux 4 "#76d4ff"
    print_linux 5 "#ba76e7"
    print_linux 6 "#6cbfb5"
    print_linux 7 "#b3c9d7"
    print_linux 8 "#191919"
    print_linux 9 "#ff355b"
    print_linux 10 "#b7e876"
    print_linux 11 "#ffc251"
    print_linux 12 "#76d5ff"
    print_linux 13 "#ba76e7"
    print_linux 14 "#6cbfb5"
    print_linux 15 "#c2c8d7"
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
