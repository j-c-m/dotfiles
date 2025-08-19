#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base4Tone Classic S
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1f/1d/20"
    print_osc4 1 "d6/4f/3d"
    print_osc4 2 "7e/70/e6"
    print_osc4 3 "ab/a1/f7"
    print_osc4 4 "c2/7e/ed"
    print_osc4 5 "e9/63/b8"
    print_osc4 6 "94/88/f2"
    print_osc4 7 "eb/e8/ed"
    print_osc4 8 "0b/07/0d"
    print_osc4 9 "eb/82/75"
    print_osc4 10 "b7/af/f8"
    print_osc4 11 "d1/cb/fb"
    print_osc4 12 "e6/c8/f9"
    print_osc4 13 "f1/7e/c7"
    print_osc4 14 "e0/ba/f7"
    print_osc4 15 "f8/f6/f9"

    print_osc_rgb 10 "9a/94/9e"
    print_osc_rgb 11 "1f/1d/20"
    print_osc_rgb 12 "76/74/81"
    print_osc_rgb 17 "9a/94/9e"
    print_osc_rgb 19 "1f/1d/20"
}

do_linux() {
    print_linux 0 "#1f1d20"
    print_linux 1 "#d64f3d"
    print_linux 2 "#7e70e6"
    print_linux 3 "#aba1f7"
    print_linux 4 "#c27eed"
    print_linux 5 "#e963b8"
    print_linux 6 "#9488f2"
    print_linux 7 "#9a949e"
    print_linux 8 "#0b070d"
    print_linux 9 "#eb8275"
    print_linux 10 "#b7aff8"
    print_linux 11 "#d1cbfb"
    print_linux 12 "#e6c8f9"
    print_linux 13 "#f17ec7"
    print_linux 14 "#e0baf7"
    print_linux 15 "#f8f6f9"
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
