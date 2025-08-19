#!/usr/bin/env bash

# Source:   base24
# Theme:    Idea
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "20/20/20"
    print_osc4 1 "fb/52/55"
    print_osc4 2 "98/b6/1b"
    print_osc4 3 "6c/9b/ed"
    print_osc4 4 "43/7e/e6"
    print_osc4 5 "9d/73/b0"
    print_osc4 6 "24/88/86"
    print_osc4 7 "51/51/51"
    print_osc4 8 "c5/c5/c5"
    print_osc4 9 "fc/6f/72"
    print_osc4 10 "98/b6/1b"
    print_osc4 11 "ff/ff/0a"
    print_osc4 12 "6c/9b/ed"
    print_osc4 13 "fc/7e/fe"
    print_osc4 14 "24/88/86"
    print_osc4 15 "17/17/17"

    print_osc_rgb 10 "51/51/51"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "51/51/51"
    print_osc_rgb 17 "17/17/17"
    print_osc_rgb 19 "ac/ac/ac"
}

do_linux() {
    print_linux 0 "#202020"
    print_linux 1 "#fb5255"
    print_linux 2 "#98b61b"
    print_linux 3 "#6c9bed"
    print_linux 4 "#437ee6"
    print_linux 5 "#9d73b0"
    print_linux 6 "#248886"
    print_linux 7 "#515151"
    print_linux 8 "#c5c5c5"
    print_linux 9 "#fc6f72"
    print_linux 10 "#98b61b"
    print_linux 11 "#ffff0a"
    print_linux 12 "#6c9bed"
    print_linux 13 "#fc7efe"
    print_linux 14 "#248886"
    print_linux 15 "#171717"
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
