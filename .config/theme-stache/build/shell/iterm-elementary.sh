#!/usr/bin/env bash

# Source:   iterm
# Theme:    Elementary
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
    print_osc4 0 "24/24/24"
    print_osc4 1 "d6/1b/15"
    print_osc4 2 "59/a4/13"
    print_osc4 3 "fd/b4/0b"
    print_osc4 4 "05/3a/8c"
    print_osc4 5 "e4/00/38"
    print_osc4 6 "25/94/e0"
    print_osc4 7 "ee/ee/ee"
    print_osc4 8 "4a/4a/4a"
    print_osc4 9 "fb/1b/18"
    print_osc4 10 "6a/c1/18"
    print_osc4 11 "fd/c7/0e"
    print_osc4 12 "08/55/fe"
    print_osc4 13 "fb/00/4f"
    print_osc4 14 "3e/a7/fc"
    print_osc4 15 "8c/00/eb"

    print_osc_rgb 10 "ee/ee/ee"
    print_osc_rgb 11 "18/18/18"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#242424"
    print_linux 1 "#d61b15"
    print_linux 2 "#59a413"
    print_linux 3 "#fdb40b"
    print_linux 4 "#053a8c"
    print_linux 5 "#e40038"
    print_linux 6 "#2594e0"
    print_linux 7 "#eeeeee"
    print_linux 8 "#4a4a4a"
    print_linux 9 "#fb1b18"
    print_linux 10 "#6ac118"
    print_linux 11 "#fdc70e"
    print_linux 12 "#0855fe"
    print_linux 13 "#fb004f"
    print_linux 14 "#3ea7fc"
    print_linux 15 "#8c00eb"
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
