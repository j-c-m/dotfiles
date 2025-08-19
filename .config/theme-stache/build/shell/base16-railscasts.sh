#!/usr/bin/env bash

# Source:   base16
# Theme:    Railscasts
# Author:   Ryan Bates (http://railscasts.com)
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
    print_osc4 0 "2b/2b/2b"
    print_osc4 1 "da/49/39"
    print_osc4 2 "a5/c2/61"
    print_osc4 3 "ff/c6/6d"
    print_osc4 4 "6d/9c/be"
    print_osc4 5 "b6/b3/eb"
    print_osc4 6 "51/9f/50"
    print_osc4 7 "e6/e1/dc"
    print_osc4 8 "5a/64/7e"
    print_osc4 9 "da/49/39"
    print_osc4 10 "a5/c2/61"
    print_osc4 11 "ff/c6/6d"
    print_osc4 12 "6d/9c/be"
    print_osc4 13 "b6/b3/eb"
    print_osc4 14 "51/9f/50"
    print_osc4 15 "f9/f7/f3"

    print_osc_rgb 10 "e6/e1/dc"
    print_osc_rgb 11 "2b/2b/2b"
    print_osc_rgb 12 "e6/e1/dc"
    print_osc_rgb 17 "f4/f1/ed"
    print_osc_rgb 19 "27/29/35"
}

do_linux() {
    print_linux 0 "#2b2b2b"
    print_linux 1 "#da4939"
    print_linux 2 "#a5c261"
    print_linux 3 "#ffc66d"
    print_linux 4 "#6d9cbe"
    print_linux 5 "#b6b3eb"
    print_linux 6 "#519f50"
    print_linux 7 "#e6e1dc"
    print_linux 8 "#5a647e"
    print_linux 9 "#da4939"
    print_linux 10 "#a5c261"
    print_linux 11 "#ffc66d"
    print_linux 12 "#6d9cbe"
    print_linux 13 "#b6b3eb"
    print_linux 14 "#519f50"
    print_linux 15 "#f9f7f3"
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
