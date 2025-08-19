#!/usr/bin/env bash

# Source:   iterm
# Theme:    Banana Blueberry
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "16/14/1e"
    print_osc4 1 "ff/6a/7e"
    print_osc4 2 "00/bc/9b"
    print_osc4 3 "e5/c6/2f"
    print_osc4 4 "22/e8/df"
    print_osc4 5 "dc/39/69"
    print_osc4 6 "55/b6/c1"
    print_osc4 7 "f1/f1/f1"
    print_osc4 8 "48/51/61"
    print_osc4 9 "fd/9e/a1"
    print_osc4 10 "97/c3/78"
    print_osc4 11 "f9/e4/6a"
    print_osc4 12 "91/ff/f3"
    print_osc4 13 "da/70/d5"
    print_osc4 14 "bc/f2/fe"
    print_osc4 15 "fe/ff/ff"

    print_osc_rgb 10 "cb/cc/cb"
    print_osc_rgb 11 "19/13/22"
    print_osc_rgb 12 "df/7d/13"
    print_osc_rgb 17 "22/05/24"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#16141e"
    print_linux 1 "#ff6a7e"
    print_linux 2 "#00bc9b"
    print_linux 3 "#e5c62f"
    print_linux 4 "#22e8df"
    print_linux 5 "#dc3969"
    print_linux 6 "#55b6c1"
    print_linux 7 "#cbcccb"
    print_linux 8 "#485161"
    print_linux 9 "#fd9ea1"
    print_linux 10 "#97c378"
    print_linux 11 "#f9e46a"
    print_linux 12 "#91fff3"
    print_linux 13 "#da70d5"
    print_linux 14 "#bcf2fe"
    print_linux 15 "#feffff"
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
