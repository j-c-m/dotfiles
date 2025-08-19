#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sweet Terminal
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
    print_osc4 0 "3f/3f/54"
    print_osc4 1 "f6/00/55"
    print_osc4 2 "06/c9/93"
    print_osc4 3 "97/00/be"
    print_osc4 4 "f6/91/54"
    print_osc4 5 "ec/89/cb"
    print_osc4 6 "60/ad/ec"
    print_osc4 7 "ab/b2/bf"
    print_osc4 8 "95/9d/cb"
    print_osc4 9 "f6/00/55"
    print_osc4 10 "06/c9/93"
    print_osc4 11 "97/00/be"
    print_osc4 12 "f6/91/54"
    print_osc4 13 "ec/89/cb"
    print_osc4 14 "00/dd/ed"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "22/22/35"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "22/22/35"
}

do_linux() {
    print_linux 0 "#3f3f54"
    print_linux 1 "#f60055"
    print_linux 2 "#06c993"
    print_linux 3 "#9700be"
    print_linux 4 "#f69154"
    print_linux 5 "#ec89cb"
    print_linux 6 "#60adec"
    print_linux 7 "#ffffff"
    print_linux 8 "#959dcb"
    print_linux 9 "#f60055"
    print_linux 10 "#06c993"
    print_linux 11 "#9700be"
    print_linux 12 "#f69154"
    print_linux 13 "#ec89cb"
    print_linux 14 "#00dded"
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
