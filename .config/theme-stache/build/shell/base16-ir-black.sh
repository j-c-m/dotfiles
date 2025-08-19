#!/usr/bin/env bash

# Source:   base16
# Theme:    IR Black
# Author:   Timothée Poisot (http://timotheepoisot.fr)
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
    print_osc4 1 "ff/6c/60"
    print_osc4 2 "a8/ff/60"
    print_osc4 3 "ff/ff/b6"
    print_osc4 4 "96/cb/fe"
    print_osc4 5 "ff/73/fd"
    print_osc4 6 "c6/c5/fe"
    print_osc4 7 "b5/b3/aa"
    print_osc4 8 "6c/6c/66"
    print_osc4 9 "ff/6c/60"
    print_osc4 10 "a8/ff/60"
    print_osc4 11 "ff/ff/b6"
    print_osc4 12 "96/cb/fe"
    print_osc4 13 "ff/73/fd"
    print_osc4 14 "c6/c5/fe"
    print_osc4 15 "fd/fb/ee"

    print_osc_rgb 10 "b5/b3/aa"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "b5/b3/aa"
    print_osc_rgb 17 "d9/d7/cc"
    print_osc_rgb 19 "24/24/22"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff6c60"
    print_linux 2 "#a8ff60"
    print_linux 3 "#ffffb6"
    print_linux 4 "#96cbfe"
    print_linux 5 "#ff73fd"
    print_linux 6 "#c6c5fe"
    print_linux 7 "#b5b3aa"
    print_linux 8 "#6c6c66"
    print_linux 9 "#ff6c60"
    print_linux 10 "#a8ff60"
    print_linux 11 "#ffffb6"
    print_linux 12 "#96cbfe"
    print_linux 13 "#ff73fd"
    print_linux 14 "#c6c5fe"
    print_linux 15 "#fdfbee"
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
