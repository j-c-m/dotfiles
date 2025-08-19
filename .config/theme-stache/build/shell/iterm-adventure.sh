#!/usr/bin/env bash

# Source:   iterm
# Theme:    Adventure
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
    print_osc4 0 "04/04/04"
    print_osc4 1 "d7/4a/33"
    print_osc4 2 "5d/a6/02"
    print_osc4 3 "ed/bb/6d"
    print_osc4 4 "41/7a/b3"
    print_osc4 5 "e5/c4/98"
    print_osc4 6 "bd/cf/e4"
    print_osc4 7 "db/de/d8"
    print_osc4 8 "68/56/55"
    print_osc4 9 "d7/6a/41"
    print_osc4 10 "98/b5/2c"
    print_osc4 11 "ff/b5/6f"
    print_osc4 12 "96/d7/ef"
    print_osc4 13 "aa/78/00"
    print_osc4 14 "bd/cf/e4"
    print_osc4 15 "e3/d5/c7"

    print_osc_rgb 10 "fe/ff/ff"
    print_osc_rgb 11 "04/04/04"
    print_osc_rgb 12 "fe/ff/ff"
    print_osc_rgb 17 "5f/5f/5f"
    print_osc_rgb 19 "fe/ff/ff"
}

do_linux() {
    print_linux 0 "#040404"
    print_linux 1 "#d74a33"
    print_linux 2 "#5da602"
    print_linux 3 "#edbb6d"
    print_linux 4 "#417ab3"
    print_linux 5 "#e5c498"
    print_linux 6 "#bdcfe4"
    print_linux 7 "#feffff"
    print_linux 8 "#685655"
    print_linux 9 "#d76a41"
    print_linux 10 "#98b52c"
    print_linux 11 "#ffb56f"
    print_linux 12 "#96d7ef"
    print_linux 13 "#aa7800"
    print_linux 14 "#bdcfe4"
    print_linux 15 "#e3d5c7"
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
