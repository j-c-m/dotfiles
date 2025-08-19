#!/usr/bin/env bash

# Source:   base24
# Theme:    Elemental
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
    print_osc4 0 "21/21/1c"
    print_osc4 1 "97/28/0f"
    print_osc4 2 "47/99/42"
    print_osc4 3 "78/d8/d8"
    print_osc4 4 "49/7f/7d"
    print_osc4 5 "7e/4e/2e"
    print_osc4 6 "38/7f/58"
    print_osc4 7 "75/6f/68"
    print_osc4 8 "5f/5d/50"
    print_osc4 9 "df/50/2a"
    print_osc4 10 "60/e0/6f"
    print_osc4 11 "d6/98/27"
    print_osc4 12 "78/d8/d8"
    print_osc4 13 "cd/7c/53"
    print_osc4 14 "58/d5/98"
    print_osc4 15 "ff/f1/e8"

    print_osc_rgb 10 "75/6f/68"
    print_osc_rgb 11 "21/21/1c"
    print_osc_rgb 12 "75/6f/68"
    print_osc_rgb 17 "80/79/74"
    print_osc_rgb 19 "3c/3b/30"
}

do_linux() {
    print_linux 0 "#21211c"
    print_linux 1 "#97280f"
    print_linux 2 "#479942"
    print_linux 3 "#78d8d8"
    print_linux 4 "#497f7d"
    print_linux 5 "#7e4e2e"
    print_linux 6 "#387f58"
    print_linux 7 "#756f68"
    print_linux 8 "#5f5d50"
    print_linux 9 "#df502a"
    print_linux 10 "#60e06f"
    print_linux 11 "#d69827"
    print_linux 12 "#78d8d8"
    print_linux 13 "#cd7c53"
    print_linux 14 "#58d598"
    print_linux 15 "#fff1e8"
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
