#!/usr/bin/env bash

# Source:   iterm
# Theme:    Rouge 2
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
    print_osc4 0 "5d/5d/6b"
    print_osc4 1 "c6/79/7e"
    print_osc4 2 "96/9e/92"
    print_osc4 3 "db/cd/ab"
    print_osc4 4 "6e/94/b9"
    print_osc4 5 "4c/4e/78"
    print_osc4 6 "8a/b6/c1"
    print_osc4 7 "e8/e8/ea"
    print_osc4 8 "61/62/74"
    print_osc4 9 "c6/79/7e"
    print_osc4 10 "e6/dc/c4"
    print_osc4 11 "e6/dc/c4"
    print_osc4 12 "98/b3/cd"
    print_osc4 13 "82/83/a1"
    print_osc4 14 "ab/cb/d3"
    print_osc4 15 "e8/e8/ea"

    print_osc_rgb 10 "a2/a3/aa"
    print_osc_rgb 11 "17/18/2b"
    print_osc_rgb 12 "96/9e/92"
    print_osc_rgb 17 "5d/5d/6b"
    print_osc_rgb 19 "de/e4/ee"
}

do_linux() {
    print_linux 0 "#5d5d6b"
    print_linux 1 "#c6797e"
    print_linux 2 "#969e92"
    print_linux 3 "#dbcdab"
    print_linux 4 "#6e94b9"
    print_linux 5 "#4c4e78"
    print_linux 6 "#8ab6c1"
    print_linux 7 "#a2a3aa"
    print_linux 8 "#616274"
    print_linux 9 "#c6797e"
    print_linux 10 "#e6dcc4"
    print_linux 11 "#e6dcc4"
    print_linux 12 "#98b3cd"
    print_linux 13 "#8283a1"
    print_linux 14 "#abcbd3"
    print_linux 15 "#e8e8ea"
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
