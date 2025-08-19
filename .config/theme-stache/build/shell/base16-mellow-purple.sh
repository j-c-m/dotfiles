#!/usr/bin/env bash

# Source:   base16
# Theme:    Mellow Purple
# Author:   gidsi
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
    print_osc4 0 "1e/05/28"
    print_osc4 1 "00/d9/e9"
    print_osc4 2 "05/cb/0d"
    print_osc4 3 "95/5a/e7"
    print_osc4 4 "55/00/68"
    print_osc4 5 "89/91/bb"
    print_osc4 6 "b9/00/b1"
    print_osc4 7 "ff/ee/ff"
    print_osc4 8 "32/0f/55"
    print_osc4 9 "00/d9/e9"
    print_osc4 10 "05/cb/0d"
    print_osc4 11 "95/5a/e7"
    print_osc4 12 "55/00/68"
    print_osc4 13 "89/91/bb"
    print_osc4 14 "b9/00/b1"
    print_osc4 15 "f8/c0/ff"

    print_osc_rgb 10 "ff/ee/ff"
    print_osc_rgb 11 "1e/05/28"
    print_osc_rgb 12 "ff/ee/ff"
    print_osc_rgb 17 "ff/ee/ff"
    print_osc_rgb 19 "1a/09/2d"
}

do_linux() {
    print_linux 0 "#1e0528"
    print_linux 1 "#00d9e9"
    print_linux 2 "#05cb0d"
    print_linux 3 "#955ae7"
    print_linux 4 "#550068"
    print_linux 5 "#8991bb"
    print_linux 6 "#b900b1"
    print_linux 7 "#ffeeff"
    print_linux 8 "#320f55"
    print_linux 9 "#00d9e9"
    print_linux 10 "#05cb0d"
    print_linux 11 "#955ae7"
    print_linux 12 "#550068"
    print_linux 13 "#8991bb"
    print_linux 14 "#b900b1"
    print_linux 15 "#f8c0ff"
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
