#!/usr/bin/env bash

# Source:   gogh
# Theme:    Rippedcasts
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cd/af/95"
    print_osc4 2 "a8/ff/60"
    print_osc4 3 "bf/bb/1f"
    print_osc4 4 "75/a5/b0"
    print_osc4 5 "ff/73/fd"
    print_osc4 6 "5a/64/7e"
    print_osc4 7 "bf/bf/bf"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ee/cb/ad"
    print_osc4 10 "bc/ee/68"
    print_osc4 11 "e5/e5/00"
    print_osc4 12 "86/bd/c9"
    print_osc4 13 "e5/00/e5"
    print_osc4 14 "8c/9b/c4"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "2b/2b/2b"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "2b/2b/2b"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cdaf95"
    print_linux 2 "#a8ff60"
    print_linux 3 "#bfbb1f"
    print_linux 4 "#75a5b0"
    print_linux 5 "#ff73fd"
    print_linux 6 "#5a647e"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#eecbad"
    print_linux 10 "#bcee68"
    print_linux 11 "#e5e500"
    print_linux 12 "#86bdc9"
    print_linux 13 "#e500e5"
    print_linux 14 "#8c9bc4"
    print_linux 15 "#e5e5e5"
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
