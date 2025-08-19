#!/usr/bin/env bash

# Source:   base16
# Theme:    Marrakesh
# Author:   Alexandre Gavioli (http://github.com/Alexx2/)
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
    print_osc4 0 "20/16/02"
    print_osc4 1 "c3/53/59"
    print_osc4 2 "18/97/4e"
    print_osc4 3 "a8/83/39"
    print_osc4 4 "47/7c/a1"
    print_osc4 5 "88/68/b3"
    print_osc4 6 "75/a7/38"
    print_osc4 7 "94/8e/48"
    print_osc4 8 "6c/68/23"
    print_osc4 9 "c3/53/59"
    print_osc4 10 "18/97/4e"
    print_osc4 11 "a8/83/39"
    print_osc4 12 "47/7c/a1"
    print_osc4 13 "88/68/b3"
    print_osc4 14 "75/a7/38"
    print_osc4 15 "fa/f0/a5"

    print_osc_rgb 10 "94/8e/48"
    print_osc_rgb 11 "20/16/02"
    print_osc_rgb 12 "94/8e/48"
    print_osc_rgb 17 "cc/c3/7a"
    print_osc_rgb 19 "30/2e/00"
}

do_linux() {
    print_linux 0 "#201602"
    print_linux 1 "#c35359"
    print_linux 2 "#18974e"
    print_linux 3 "#a88339"
    print_linux 4 "#477ca1"
    print_linux 5 "#8868b3"
    print_linux 6 "#75a738"
    print_linux 7 "#948e48"
    print_linux 8 "#6c6823"
    print_linux 9 "#c35359"
    print_linux 10 "#18974e"
    print_linux 11 "#a88339"
    print_linux 12 "#477ca1"
    print_linux 13 "#8868b3"
    print_linux 14 "#75a738"
    print_linux 15 "#faf0a5"
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
