#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitLab-Dark-Grey
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f5/7f/6c"
    print_osc4 2 "52/b8/7a"
    print_osc4 3 "d9/95/30"
    print_osc4 4 "7f/b6/ed"
    print_osc4 5 "f8/8a/af"
    print_osc4 6 "32/c5/d2"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "66/66/66"
    print_osc4 9 "fc/b5/aa"
    print_osc4 10 "91/d4/a8"
    print_osc4 11 "e9/be/74"
    print_osc4 12 "49/8d/d1"
    print_osc4 13 "fc/ac/c5"
    print_osc4 14 "5e/de/e3"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ad/95/e9"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f57f6c"
    print_linux 2 "#52b87a"
    print_linux 3 "#d99530"
    print_linux 4 "#7fb6ed"
    print_linux 5 "#f88aaf"
    print_linux 6 "#32c5d2"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#fcb5aa"
    print_linux 10 "#91d4a8"
    print_linux 11 "#e9be74"
    print_linux 12 "#498dd1"
    print_linux 13 "#fcacc5"
    print_linux 14 "#5edee3"
    print_linux 15 "#ffffff"
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
