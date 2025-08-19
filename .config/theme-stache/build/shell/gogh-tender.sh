#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tender
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "1d/1d/1d"
    print_osc4 1 "c5/15/2f"
    print_osc4 2 "c9/d0/5c"
    print_osc4 3 "ff/c2/4b"
    print_osc4 4 "b3/de/ef"
    print_osc4 5 "d3/b9/87"
    print_osc4 6 "73/ce/f4"
    print_osc4 7 "ee/ee/ee"
    print_osc4 8 "32/32/32"
    print_osc4 9 "f4/37/53"
    print_osc4 10 "d9/e0/66"
    print_osc4 11 "fa/cc/72"
    print_osc4 12 "c0/ea/fb"
    print_osc4 13 "ef/d0/93"
    print_osc4 14 "a1/d6/ec"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ee/ee/ee"
    print_osc_rgb 11 "28/28/28"
    print_osc_rgb 12 "ee/ee/ee"
    print_osc_rgb 17 "ee/ee/ee"
    print_osc_rgb 19 "28/28/28"
}

do_linux() {
    print_linux 0 "#1d1d1d"
    print_linux 1 "#c5152f"
    print_linux 2 "#c9d05c"
    print_linux 3 "#ffc24b"
    print_linux 4 "#b3deef"
    print_linux 5 "#d3b987"
    print_linux 6 "#73cef4"
    print_linux 7 "#eeeeee"
    print_linux 8 "#323232"
    print_linux 9 "#f43753"
    print_linux 10 "#d9e066"
    print_linux 11 "#facc72"
    print_linux 12 "#c0eafb"
    print_linux 13 "#efd093"
    print_linux 14 "#a1d6ec"
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
