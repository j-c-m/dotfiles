#!/usr/bin/env bash

# Source:   base24
# Theme:    Hacktober
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
    print_osc4 0 "14/14/14"
    print_osc4 1 "b3/45/38"
    print_osc4 2 "58/77/44"
    print_osc4 3 "53/89/c5"
    print_osc4 4 "20/6e/c5"
    print_osc4 5 "86/46/51"
    print_osc4 6 "ac/91/66"
    print_osc4 7 "bf/bd/b7"
    print_osc4 8 "5d/5b/59"
    print_osc4 9 "b3/33/23"
    print_osc4 10 "42/82/4a"
    print_osc4 11 "c7/5a/22"
    print_osc4 12 "53/89/c5"
    print_osc4 13 "e7/95/a5"
    print_osc4 14 "eb/c5/87"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bf/bd/b7"
    print_osc_rgb 11 "14/14/14"
    print_osc_rgb 12 "bf/bd/b7"
    print_osc_rgb 17 "f1/ee/e7"
    print_osc_rgb 19 "19/19/18"
}

do_linux() {
    print_linux 0 "#141414"
    print_linux 1 "#b34538"
    print_linux 2 "#587744"
    print_linux 3 "#5389c5"
    print_linux 4 "#206ec5"
    print_linux 5 "#864651"
    print_linux 6 "#ac9166"
    print_linux 7 "#bfbdb7"
    print_linux 8 "#5d5b59"
    print_linux 9 "#b33323"
    print_linux 10 "#42824a"
    print_linux 11 "#c75a22"
    print_linux 12 "#5389c5"
    print_linux 13 "#e795a5"
    print_linux 14 "#ebc587"
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
