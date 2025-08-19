#!/usr/bin/env bash

# Source:   iterm
# Theme:    DjangoRebornAgain
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
    print_osc4 1 "fd/62/09"
    print_osc4 2 "41/a8/3e"
    print_osc4 3 "ff/e8/62"
    print_osc4 4 "24/50/32"
    print_osc4 5 "f8/f8/f8"
    print_osc4 6 "9d/f3/9f"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "32/32/32"
    print_osc4 9 "ff/94/3b"
    print_osc4 10 "73/da/70"
    print_osc4 11 "ff/ff/94"
    print_osc4 12 "56/82/64"
    print_osc4 13 "ff/ff/ff"
    print_osc4 14 "cf/ff/d1"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "da/de/dc"
    print_osc_rgb 11 "05/1f/14"
    print_osc_rgb 12 "ff/cc/00"
    print_osc_rgb 17 "20/37/27"
    print_osc_rgb 19 "da/de/dc"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fd6209"
    print_linux 2 "#41a83e"
    print_linux 3 "#ffe862"
    print_linux 4 "#245032"
    print_linux 5 "#f8f8f8"
    print_linux 6 "#9df39f"
    print_linux 7 "#dadedc"
    print_linux 8 "#323232"
    print_linux 9 "#ff943b"
    print_linux 10 "#73da70"
    print_linux 11 "#ffff94"
    print_linux 12 "#568264"
    print_linux 13 "#ffffff"
    print_linux 14 "#cfffd1"
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
