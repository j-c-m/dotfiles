#!/usr/bin/env bash

# Source:   gogh
# Theme:    Monokai Pro Ocatagon
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "3a/3d/4b"
    print_osc4 1 "ff/65/7a"
    print_osc4 2 "ba/d7/61"
    print_osc4 3 "ff/d7/6d"
    print_osc4 4 "ff/9b/5e"
    print_osc4 5 "c3/9a/c9"
    print_osc4 6 "9c/d1/bb"
    print_osc4 7 "ea/f2/f1"
    print_osc4 8 "ad/ae/b4"
    print_osc4 9 "ff/65/7a"
    print_osc4 10 "ba/d7/61"
    print_osc4 11 "ff/d7/6d"
    print_osc4 12 "ff/9b/5e"
    print_osc4 13 "c3/9a/c9"
    print_osc4 14 "9c/d1/bb"
    print_osc4 15 "ea/f2/f1"

    print_osc_rgb 10 "ea/f2/f1"
    print_osc_rgb 11 "3a/3d/4b"
    print_osc_rgb 12 "ea/f2/f1"
    print_osc_rgb 17 "ea/f2/f1"
    print_osc_rgb 19 "3a/3d/4b"
}

do_linux() {
    print_linux 0 "#3a3d4b"
    print_linux 1 "#ff657a"
    print_linux 2 "#bad761"
    print_linux 3 "#ffd76d"
    print_linux 4 "#ff9b5e"
    print_linux 5 "#c39ac9"
    print_linux 6 "#9cd1bb"
    print_linux 7 "#eaf2f1"
    print_linux 8 "#adaeb4"
    print_linux 9 "#ff657a"
    print_linux 10 "#bad761"
    print_linux 11 "#ffd76d"
    print_linux 12 "#ff9b5e"
    print_linux 13 "#c39ac9"
    print_linux 14 "#9cd1bb"
    print_linux 15 "#eaf2f1"
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
