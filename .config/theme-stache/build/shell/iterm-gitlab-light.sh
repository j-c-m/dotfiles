#!/usr/bin/env bash

# Source:   iterm
# Theme:    GitLab-Light
# Author:   unknown
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
    print_osc4 0 "30/30/30"
    print_osc4 1 "a3/17/00"
    print_osc4 2 "0a/7f/3d"
    print_osc4 3 "af/55/1d"
    print_osc4 4 "00/6c/d8"
    print_osc4 5 "58/3c/ac"
    print_osc4 6 "00/79/8a"
    print_osc4 7 "30/30/30"
    print_osc4 8 "30/30/30"
    print_osc4 9 "a3/17/00"
    print_osc4 10 "0a/7f/3d"
    print_osc4 11 "af/55/1d"
    print_osc4 12 "00/6c/d8"
    print_osc4 13 "58/3c/ac"
    print_osc4 14 "00/79/8a"
    print_osc4 15 "30/30/30"

    print_osc_rgb 10 "30/30/30"
    print_osc_rgb 11 "fa/fa/ff"
    print_osc_rgb 12 "30/30/30"
    print_osc_rgb 17 "ad/95/e9"
    print_osc_rgb 19 "fa/fa/ff"
}

do_linux() {
    print_linux 0 "#303030"
    print_linux 1 "#a31700"
    print_linux 2 "#0a7f3d"
    print_linux 3 "#af551d"
    print_linux 4 "#006cd8"
    print_linux 5 "#583cac"
    print_linux 6 "#00798a"
    print_linux 7 "#303030"
    print_linux 8 "#303030"
    print_linux 9 "#a31700"
    print_linux 10 "#0a7f3d"
    print_linux 11 "#af551d"
    print_linux 12 "#006cd8"
    print_linux 13 "#583cac"
    print_linux 14 "#00798a"
    print_linux 15 "#303030"
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
