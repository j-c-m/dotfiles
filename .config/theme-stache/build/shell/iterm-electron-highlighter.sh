#!/usr/bin/env bash

# Source:   iterm
# Theme:    electron-highlighter
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
    print_osc4 0 "14/16/1e"
    print_osc4 1 "fe/6b/8c"
    print_osc4 2 "00/fe/c3"
    print_osc4 3 "fe/d7/a8"
    print_osc4 4 "76/ab/fe"
    print_osc4 5 "da/a3/f4"
    print_osc4 6 "00/fd/fe"
    print_osc4 7 "77/8e/ae"
    print_osc4 8 "49/66/88"
    print_osc4 9 "fe/6b/8c"
    print_osc4 10 "00/fe/c3"
    print_osc4 11 "fe/d7/a8"
    print_osc4 12 "76/ab/fe"
    print_osc4 13 "da/a3/f4"
    print_osc4 14 "00/fd/fe"
    print_osc4 15 "c2/ce/e1"

    print_osc_rgb 10 "a4/b5/d3"
    print_osc_rgb 11 "23/28/3c"
    print_osc_rgb 12 "a4/b5/d3"
    print_osc_rgb 17 "24/34/59"
    print_osc_rgb 19 "a4/b5/d3"
}

do_linux() {
    print_linux 0 "#14161e"
    print_linux 1 "#fe6b8c"
    print_linux 2 "#00fec3"
    print_linux 3 "#fed7a8"
    print_linux 4 "#76abfe"
    print_linux 5 "#daa3f4"
    print_linux 6 "#00fdfe"
    print_linux 7 "#a4b5d3"
    print_linux 8 "#496688"
    print_linux 9 "#fe6b8c"
    print_linux 10 "#00fec3"
    print_linux 11 "#fed7a8"
    print_linux 12 "#76abfe"
    print_linux 13 "#daa3f4"
    print_linux 14 "#00fdfe"
    print_linux 15 "#c2cee1"
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
