#!/usr/bin/env bash

# Source:   gogh
# Theme:    Sat
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "dd/00/07"
    print_osc4 2 "07/dd/00"
    print_osc4 3 "dd/d6/00"
    print_osc4 4 "00/07/dd"
    print_osc4 5 "d6/00/dd"
    print_osc4 6 "00/dd/d6"
    print_osc4 7 "f2/f2/f2"
    print_osc4 8 "7d/7d/7d"
    print_osc4 9 "ff/74/78"
    print_osc4 10 "78/ff/74"
    print_osc4 11 "ff/fa/74"
    print_osc4 12 "74/78/ff"
    print_osc4 13 "fa/74/ff"
    print_osc4 14 "74/ff/fa"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "23/47/6a"
    print_osc_rgb 11 "75/84/80"
    print_osc_rgb 12 "23/47/6a"
    print_osc_rgb 17 "23/47/6a"
    print_osc_rgb 19 "75/84/80"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#dd0007"
    print_linux 2 "#07dd00"
    print_linux 3 "#ddd600"
    print_linux 4 "#0007dd"
    print_linux 5 "#d600dd"
    print_linux 6 "#00ddd6"
    print_linux 7 "#23476a"
    print_linux 8 "#7d7d7d"
    print_linux 9 "#ff7478"
    print_linux 10 "#78ff74"
    print_linux 11 "#fffa74"
    print_linux 12 "#7478ff"
    print_linux 13 "#fa74ff"
    print_linux 14 "#74fffa"
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
