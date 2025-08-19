#!/usr/bin/env bash

# Source:   iterm
# Theme:    Konsolas
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
    print_osc4 1 "aa/17/17"
    print_osc4 2 "18/b2/18"
    print_osc4 3 "eb/ae/1f"
    print_osc4 4 "23/23/a5"
    print_osc4 5 "ad/1e/dc"
    print_osc4 6 "42/b0/c8"
    print_osc4 7 "c8/c1/c1"
    print_osc4 8 "7b/71/6e"
    print_osc4 9 "ff/41/41"
    print_osc4 10 "5f/ff/5f"
    print_osc4 11 "ff/ff/55"
    print_osc4 12 "4b/4b/ff"
    print_osc4 13 "ff/54/ff"
    print_osc4 14 "69/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c8/c1/c1"
    print_osc_rgb 11 "06/06/06"
    print_osc_rgb 12 "c8/c1/c1"
    print_osc_rgb 17 "06/06/06"
    print_osc_rgb 19 "c8/c1/c1"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#aa1717"
    print_linux 2 "#18b218"
    print_linux 3 "#ebae1f"
    print_linux 4 "#2323a5"
    print_linux 5 "#ad1edc"
    print_linux 6 "#42b0c8"
    print_linux 7 "#c8c1c1"
    print_linux 8 "#7b716e"
    print_linux 9 "#ff4141"
    print_linux 10 "#5fff5f"
    print_linux 11 "#ffff55"
    print_linux 12 "#4b4bff"
    print_linux 13 "#ff54ff"
    print_linux 14 "#69ffff"
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
