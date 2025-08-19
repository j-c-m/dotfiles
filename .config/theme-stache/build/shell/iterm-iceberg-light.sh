#!/usr/bin/env bash

# Source:   iterm
# Theme:    iceberg-light
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
    print_osc4 0 "dc/df/e7"
    print_osc4 1 "cc/51/7a"
    print_osc4 2 "66/8e/3d"
    print_osc4 3 "c5/73/39"
    print_osc4 4 "2d/53/9e"
    print_osc4 5 "77/59/b4"
    print_osc4 6 "3f/83/a6"
    print_osc4 7 "33/37/4c"
    print_osc4 8 "83/89/a3"
    print_osc4 9 "cc/37/68"
    print_osc4 10 "59/80/30"
    print_osc4 11 "b6/66/2d"
    print_osc4 12 "22/47/8e"
    print_osc4 13 "68/45/ad"
    print_osc4 14 "32/76/98"
    print_osc4 15 "26/2a/3f"

    print_osc_rgb 10 "33/37/4c"
    print_osc_rgb 11 "e8/e9/ec"
    print_osc_rgb 12 "33/37/4c"
    print_osc_rgb 17 "33/37/4c"
    print_osc_rgb 19 "e8/e9/ec"
}

do_linux() {
    print_linux 0 "#dcdfe7"
    print_linux 1 "#cc517a"
    print_linux 2 "#668e3d"
    print_linux 3 "#c57339"
    print_linux 4 "#2d539e"
    print_linux 5 "#7759b4"
    print_linux 6 "#3f83a6"
    print_linux 7 "#33374c"
    print_linux 8 "#8389a3"
    print_linux 9 "#cc3768"
    print_linux 10 "#598030"
    print_linux 11 "#b6662d"
    print_linux 12 "#22478e"
    print_linux 13 "#6845ad"
    print_linux 14 "#327698"
    print_linux 15 "#262a3f"
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
