#!/usr/bin/env bash

# Source:   gogh
# Theme:    Selenized White
# Author:   
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
    print_osc4 0 "eb/eb/eb"
    print_osc4 1 "d6/00/0c"
    print_osc4 2 "1d/97/00"
    print_osc4 3 "c4/97/00"
    print_osc4 4 "00/64/e4"
    print_osc4 5 "dd/0f/9d"
    print_osc4 6 "00/ad/9c"
    print_osc4 7 "87/87/87"
    print_osc4 8 "cd/cd/cd"
    print_osc4 9 "bf/00/00"
    print_osc4 10 "00/84/00"
    print_osc4 11 "af/85/00"
    print_osc4 12 "00/54/cf"
    print_osc4 13 "c7/00/8b"
    print_osc4 14 "00/9a/8a"
    print_osc4 15 "28/28/28"

    print_osc_rgb 10 "47/47/47"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "28/28/28"
    print_osc_rgb 17 "47/47/47"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#ebebeb"
    print_linux 1 "#d6000c"
    print_linux 2 "#1d9700"
    print_linux 3 "#c49700"
    print_linux 4 "#0064e4"
    print_linux 5 "#dd0f9d"
    print_linux 6 "#00ad9c"
    print_linux 7 "#474747"
    print_linux 8 "#cdcdcd"
    print_linux 9 "#bf0000"
    print_linux 10 "#008400"
    print_linux 11 "#af8500"
    print_linux 12 "#0054cf"
    print_linux 13 "#c7008b"
    print_linux 14 "#009a8a"
    print_linux 15 "#282828"
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
