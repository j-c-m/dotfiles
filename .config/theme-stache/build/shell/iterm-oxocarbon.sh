#!/usr/bin/env bash

# Source:   iterm
# Theme:    Oxocarbon
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
    print_osc4 0 "16/15/15"
    print_osc4 1 "00/de/da"
    print_osc4 2 "00/b4/fe"
    print_osc4 3 "fe/41/97"
    print_osc4 4 "00/c1/59"
    print_osc4 5 "c5/92/fe"
    print_osc4 6 "fe/74/b7"
    print_osc4 7 "f1/f4/f8"
    print_osc4 8 "58/57/57"
    print_osc4 9 "00/de/da"
    print_osc4 10 "00/b4/fe"
    print_osc4 11 "fe/41/97"
    print_osc4 12 "00/c1/59"
    print_osc4 13 "c5/92/fe"
    print_osc4 14 "fe/74/b7"
    print_osc4 15 "f1/f4/f8"

    print_osc_rgb 10 "f1/f4/f8"
    print_osc_rgb 11 "16/15/15"
    print_osc_rgb 12 "fe/fe/fe"
    print_osc_rgb 17 "39/38/38"
    print_osc_rgb 19 "16/15/15"
}

do_linux() {
    print_linux 0 "#161515"
    print_linux 1 "#00deda"
    print_linux 2 "#00b4fe"
    print_linux 3 "#fe4197"
    print_linux 4 "#00c159"
    print_linux 5 "#c592fe"
    print_linux 6 "#fe74b7"
    print_linux 7 "#f1f4f8"
    print_linux 8 "#585757"
    print_linux 9 "#00deda"
    print_linux 10 "#00b4fe"
    print_linux 11 "#fe4197"
    print_linux 12 "#00c159"
    print_linux 13 "#c592fe"
    print_linux 14 "#fe74b7"
    print_linux 15 "#f1f4f8"
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
