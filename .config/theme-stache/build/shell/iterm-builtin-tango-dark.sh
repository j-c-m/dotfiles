#!/usr/bin/env bash

# Source:   iterm
# Theme:    Builtin Tango Dark
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/00/00"
    print_osc4 2 "4e/9a/05"
    print_osc4 3 "c4/a0/00"
    print_osc4 4 "34/64/a4"
    print_osc4 5 "74/50/7a"
    print_osc4 6 "05/98/9a"
    print_osc4 7 "d3/d7/cf"
    print_osc4 8 "54/57/53"
    print_osc4 9 "ef/28/28"
    print_osc4 10 "8a/e2/34"
    print_osc4 11 "fc/e9/4e"
    print_osc4 12 "71/9e/cf"
    print_osc4 13 "ad/7e/a7"
    print_osc4 14 "34/e2/e2"
    print_osc4 15 "ed/ed/ec"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "b4/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc0000"
    print_linux 2 "#4e9a05"
    print_linux 3 "#c4a000"
    print_linux 4 "#3464a4"
    print_linux 5 "#74507a"
    print_linux 6 "#05989a"
    print_linux 7 "#ffffff"
    print_linux 8 "#545753"
    print_linux 9 "#ef2828"
    print_linux 10 "#8ae234"
    print_linux 11 "#fce94e"
    print_linux 12 "#719ecf"
    print_linux 13 "#ad7ea7"
    print_linux 14 "#34e2e2"
    print_linux 15 "#ededec"
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
