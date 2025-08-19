#!/usr/bin/env bash

# Source:   base16
# Theme:    pinky
# Author:   Benjamin (https://github.com/b3nj5m1n)
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
    print_osc4 0 "17/15/17"
    print_osc4 1 "ff/a6/00"
    print_osc4 2 "ff/00/66"
    print_osc4 3 "20/df/6c"
    print_osc4 4 "00/ff/ff"
    print_osc4 5 "00/7f/ff"
    print_osc4 6 "66/00/ff"
    print_osc4 7 "f5/f5/f5"
    print_osc4 8 "38/33/38"
    print_osc4 9 "ff/a6/00"
    print_osc4 10 "ff/00/66"
    print_osc4 11 "20/df/6c"
    print_osc4 12 "00/ff/ff"
    print_osc4 13 "00/7f/ff"
    print_osc4 14 "66/00/ff"
    print_osc4 15 "f7/f3/f7"

    print_osc_rgb 10 "f5/f5/f5"
    print_osc_rgb 11 "17/15/17"
    print_osc_rgb 12 "f5/f5/f5"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "1b/18/1b"
}

do_linux() {
    print_linux 0 "#171517"
    print_linux 1 "#ffa600"
    print_linux 2 "#ff0066"
    print_linux 3 "#20df6c"
    print_linux 4 "#00ffff"
    print_linux 5 "#007fff"
    print_linux 6 "#6600ff"
    print_linux 7 "#f5f5f5"
    print_linux 8 "#383338"
    print_linux 9 "#ffa600"
    print_linux 10 "#ff0066"
    print_linux 11 "#20df6c"
    print_linux 12 "#00ffff"
    print_linux 13 "#007fff"
    print_linux 14 "#6600ff"
    print_linux 15 "#f7f3f7"
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
