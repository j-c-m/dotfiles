#!/usr/bin/env bash

# Source:   base16
# Theme:    Black Metal (Khold)
# Author:   metalelf0 (https://github.com/metalelf0)
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
    print_osc4 1 "5f/87/87"
    print_osc4 2 "ec/ee/e3"
    print_osc4 3 "97/4b/46"
    print_osc4 4 "88/88/88"
    print_osc4 5 "99/99/99"
    print_osc4 6 "aa/aa/aa"
    print_osc4 7 "c1/c1/c1"
    print_osc4 8 "33/33/33"
    print_osc4 9 "5f/87/87"
    print_osc4 10 "ec/ee/e3"
    print_osc4 11 "97/4b/46"
    print_osc4 12 "88/88/88"
    print_osc4 13 "99/99/99"
    print_osc4 14 "aa/aa/aa"
    print_osc4 15 "c1/c1/c1"

    print_osc_rgb 10 "c1/c1/c1"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c1/c1/c1"
    print_osc_rgb 17 "99/99/99"
    print_osc_rgb 19 "12/12/12"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#5f8787"
    print_linux 2 "#eceee3"
    print_linux 3 "#974b46"
    print_linux 4 "#888888"
    print_linux 5 "#999999"
    print_linux 6 "#aaaaaa"
    print_linux 7 "#c1c1c1"
    print_linux 8 "#333333"
    print_linux 9 "#5f8787"
    print_linux 10 "#eceee3"
    print_linux 11 "#974b46"
    print_linux 12 "#888888"
    print_linux 13 "#999999"
    print_linux 14 "#aaaaaa"
    print_linux 15 "#c1c1c1"
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
