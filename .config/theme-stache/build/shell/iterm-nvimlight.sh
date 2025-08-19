#!/usr/bin/env bash

# Source:   iterm
# Theme:    NvimLight
# Author:   unknown
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
    print_osc4 0 "07/08/0d"
    print_osc4 1 "59/00/08"
    print_osc4 2 "00/55/23"
    print_osc4 3 "6b/53/00"
    print_osc4 4 "00/4c/73"
    print_osc4 5 "47/00/45"
    print_osc4 6 "00/73/73"
    print_osc4 7 "ee/f1/f8"
    print_osc4 8 "4f/52/58"
    print_osc4 9 "59/00/08"
    print_osc4 10 "00/55/23"
    print_osc4 11 "6b/53/00"
    print_osc4 12 "00/4c/73"
    print_osc4 13 "47/00/45"
    print_osc4 14 "00/73/73"
    print_osc4 15 "ee/f1/f8"

    print_osc_rgb 10 "14/16/1b"
    print_osc_rgb 11 "e0/e2/ea"
    print_osc_rgb 12 "9b/9e/a4"
    print_osc_rgb 17 "9b/9e/a4"
    print_osc_rgb 19 "14/16/1b"
}

do_linux() {
    print_linux 0 "#07080d"
    print_linux 1 "#590008"
    print_linux 2 "#005523"
    print_linux 3 "#6b5300"
    print_linux 4 "#004c73"
    print_linux 5 "#470045"
    print_linux 6 "#007373"
    print_linux 7 "#14161b"
    print_linux 8 "#4f5258"
    print_linux 9 "#590008"
    print_linux 10 "#005523"
    print_linux 11 "#6b5300"
    print_linux 12 "#004c73"
    print_linux 13 "#470045"
    print_linux 14 "#007373"
    print_linux 15 "#eef1f8"
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
