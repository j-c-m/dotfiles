#!/usr/bin/env bash

# Source:   base16
# Theme:    Summerfruit Light
# Author:   Christopher Corley (http://christop.club/)
# Variant:  light

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
    print_osc4 0 "ff/ff/ff"
    print_osc4 1 "ff/00/86"
    print_osc4 2 "00/c9/18"
    print_osc4 3 "ab/a8/00"
    print_osc4 4 "37/77/e6"
    print_osc4 5 "ad/00/a1"
    print_osc4 6 "1f/aa/aa"
    print_osc4 7 "10/10/10"
    print_osc4 8 "b0/b0/b0"
    print_osc4 9 "ff/00/86"
    print_osc4 10 "00/c9/18"
    print_osc4 11 "ab/a8/00"
    print_osc4 12 "37/77/e6"
    print_osc4 13 "ad/00/a1"
    print_osc4 14 "1f/aa/aa"
    print_osc4 15 "20/20/20"

    print_osc_rgb 10 "10/10/10"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "10/10/10"
    print_osc_rgb 17 "15/15/15"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#ff0086"
    print_linux 2 "#00c918"
    print_linux 3 "#aba800"
    print_linux 4 "#3777e6"
    print_linux 5 "#ad00a1"
    print_linux 6 "#1faaaa"
    print_linux 7 "#101010"
    print_linux 8 "#b0b0b0"
    print_linux 9 "#ff0086"
    print_linux 10 "#00c918"
    print_linux 11 "#aba800"
    print_linux 12 "#3777e6"
    print_linux 13 "#ad00a1"
    print_linux 14 "#1faaaa"
    print_linux 15 "#202020"
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
