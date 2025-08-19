#!/usr/bin/env bash

# Source:   iterm
# Theme:    Galizur
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
    print_osc4 0 "22/33/44"
    print_osc4 1 "aa/11/22"
    print_osc4 2 "33/aa/11"
    print_osc4 3 "cc/aa/22"
    print_osc4 4 "22/55/cc"
    print_osc4 5 "77/55/aa"
    print_osc4 6 "22/bb/dd"
    print_osc4 7 "88/99/aa"
    print_osc4 8 "55/66/77"
    print_osc4 9 "ff/11/33"
    print_osc4 10 "33/ff/11"
    print_osc4 11 "ff/dd/33"
    print_osc4 12 "33/77/ff"
    print_osc4 13 "aa/77/ff"
    print_osc4 14 "33/dd/ff"
    print_osc4 15 "bb/cc/dd"

    print_osc_rgb 10 "dd/ee/ff"
    print_osc_rgb 11 "07/13/17"
    print_osc_rgb 12 "dd/ee/ff"
    print_osc_rgb 17 "07/13/17"
    print_osc_rgb 19 "dd/ee/ff"
}

do_linux() {
    print_linux 0 "#223344"
    print_linux 1 "#aa1122"
    print_linux 2 "#33aa11"
    print_linux 3 "#ccaa22"
    print_linux 4 "#2255cc"
    print_linux 5 "#7755aa"
    print_linux 6 "#22bbdd"
    print_linux 7 "#ddeeff"
    print_linux 8 "#556677"
    print_linux 9 "#ff1133"
    print_linux 10 "#33ff11"
    print_linux 11 "#ffdd33"
    print_linux 12 "#3377ff"
    print_linux 13 "#aa77ff"
    print_linux 14 "#33ddff"
    print_linux 15 "#bbccdd"
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
