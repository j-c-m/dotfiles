#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tomorrow Night Eighties
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "f2/77/79"
    print_osc4 2 "99/cc/99"
    print_osc4 3 "ff/cc/66"
    print_osc4 4 "66/99/cc"
    print_osc4 5 "cc/99/cc"
    print_osc4 6 "66/cc/cc"
    print_osc4 7 "ff/fe/fe"
    print_osc4 8 "00/00/00"
    print_osc4 9 "f1/77/79"
    print_osc4 10 "99/cc/99"
    print_osc4 11 "ff/cc/66"
    print_osc4 12 "66/99/cc"
    print_osc4 13 "cc/99/cc"
    print_osc4 14 "66/cc/cc"
    print_osc4 15 "ff/fe/fe"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "2c/2c/2c"
    print_osc_rgb 12 "cc/cc/cc"
    print_osc_rgb 17 "51/51/51"
    print_osc_rgb 19 "cc/cc/cc"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#f27779"
    print_linux 2 "#99cc99"
    print_linux 3 "#ffcc66"
    print_linux 4 "#6699cc"
    print_linux 5 "#cc99cc"
    print_linux 6 "#66cccc"
    print_linux 7 "#cccccc"
    print_linux 8 "#000000"
    print_linux 9 "#f17779"
    print_linux 10 "#99cc99"
    print_linux 11 "#ffcc66"
    print_linux 12 "#6699cc"
    print_linux 13 "#cc99cc"
    print_linux 14 "#66cccc"
    print_linux 15 "#fffefe"
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
