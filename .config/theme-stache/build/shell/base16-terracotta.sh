#!/usr/bin/env bash

# Source:   base16
# Theme:    Terracotta
# Author:   Alexander Rossell Hayes (https://github.com/rossellhayes)
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
    print_osc4 0 "ef/ea/e8"
    print_osc4 1 "a7/50/45"
    print_osc4 2 "7a/89/4a"
    print_osc4 3 "ce/94/3e"
    print_osc4 4 "62/55/74"
    print_osc4 5 "8d/59/68"
    print_osc4 6 "84/7f/9e"
    print_osc4 7 "47/37/31"
    print_osc4 8 "c0/ac/a4"
    print_osc4 9 "a7/50/45"
    print_osc4 10 "7a/89/4a"
    print_osc4 11 "ce/94/3e"
    print_osc4 12 "62/55/74"
    print_osc4 13 "8d/59/68"
    print_osc4 14 "84/7f/9e"
    print_osc4 15 "24/1c/19"

    print_osc_rgb 10 "47/37/31"
    print_osc_rgb 11 "ef/ea/e8"
    print_osc_rgb 12 "47/37/31"
    print_osc_rgb 17 "35/2a/25"
    print_osc_rgb 19 "df/d6/d1"
}

do_linux() {
    print_linux 0 "#efeae8"
    print_linux 1 "#a75045"
    print_linux 2 "#7a894a"
    print_linux 3 "#ce943e"
    print_linux 4 "#625574"
    print_linux 5 "#8d5968"
    print_linux 6 "#847f9e"
    print_linux 7 "#473731"
    print_linux 8 "#c0aca4"
    print_linux 9 "#a75045"
    print_linux 10 "#7a894a"
    print_linux 11 "#ce943e"
    print_linux 12 "#625574"
    print_linux 13 "#8d5968"
    print_linux 14 "#847f9e"
    print_linux 15 "#241c19"
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
