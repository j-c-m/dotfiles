#!/usr/bin/env bash

# Source:   base16
# Theme:    Penumbra Light Contrast Plus Plus
# Author:   Zachary Weiss (https://github.com/zacharyweiss)
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
    print_osc4 0 "ff/fd/fb"
    print_osc4 1 "f5/8c/81"
    print_osc4 2 "54/c7/94"
    print_osc4 3 "a9/b8/52"
    print_osc4 4 "6e/b2/fd"
    print_osc4 5 "b6/9c/f6"
    print_osc4 6 "00/c4/d7"
    print_osc4 7 "63/63/63"
    print_osc4 8 "de/de/de"
    print_osc4 9 "f5/8c/81"
    print_osc4 10 "54/c7/94"
    print_osc4 11 "a9/b8/52"
    print_osc4 12 "6e/b2/fd"
    print_osc4 13 "b6/9c/f6"
    print_osc4 14 "00/c4/d7"
    print_osc4 15 "0d/0f/13"

    print_osc_rgb 10 "63/63/63"
    print_osc_rgb 11 "ff/fd/fb"
    print_osc_rgb 12 "63/63/63"
    print_osc_rgb 17 "18/1b/1f"
    print_osc_rgb 19 "ff/f7/ed"
}

do_linux() {
    print_linux 0 "#fffdfb"
    print_linux 1 "#f58c81"
    print_linux 2 "#54c794"
    print_linux 3 "#a9b852"
    print_linux 4 "#6eb2fd"
    print_linux 5 "#b69cf6"
    print_linux 6 "#00c4d7"
    print_linux 7 "#636363"
    print_linux 8 "#dedede"
    print_linux 9 "#f58c81"
    print_linux 10 "#54c794"
    print_linux 11 "#a9b852"
    print_linux 12 "#6eb2fd"
    print_linux 13 "#b69cf6"
    print_linux 14 "#00c4d7"
    print_linux 15 "#0d0f13"
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
