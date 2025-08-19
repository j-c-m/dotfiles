#!/usr/bin/env bash

# Source:   iterm
# Theme:    tokyonight_night
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
    print_osc4 0 "15/16/1d"
    print_osc4 1 "f7/76/8e"
    print_osc4 2 "9e/ce/69"
    print_osc4 3 "e0/af/68"
    print_osc4 4 "79/a2/f7"
    print_osc4 5 "bb/9a/f7"
    print_osc4 6 "7c/cf/ff"
    print_osc4 7 "a9/b1/d6"
    print_osc4 8 "41/48/68"
    print_osc4 9 "f7/76/8e"
    print_osc4 10 "9e/ce/69"
    print_osc4 11 "e0/af/68"
    print_osc4 12 "79/a2/f7"
    print_osc4 13 "bb/9a/f7"
    print_osc4 14 "7c/cf/ff"
    print_osc4 15 "c0/ca/f5"

    print_osc_rgb 10 "c0/ca/f5"
    print_osc_rgb 11 "1a/1b/26"
    print_osc_rgb 12 "c0/ca/f5"
    print_osc_rgb 17 "28/34/57"
    print_osc_rgb 19 "c0/ca/f5"
}

do_linux() {
    print_linux 0 "#15161d"
    print_linux 1 "#f7768e"
    print_linux 2 "#9ece69"
    print_linux 3 "#e0af68"
    print_linux 4 "#79a2f7"
    print_linux 5 "#bb9af7"
    print_linux 6 "#7ccfff"
    print_linux 7 "#c0caf5"
    print_linux 8 "#414868"
    print_linux 9 "#f7768e"
    print_linux 10 "#9ece69"
    print_linux 11 "#e0af68"
    print_linux 12 "#79a2f7"
    print_linux 13 "#bb9af7"
    print_linux 14 "#7ccfff"
    print_linux 15 "#c0caf5"
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
