#!/usr/bin/env bash

# Source:   base16
# Theme:    Material Lighter
# Author:   Nate Peterson
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
    print_osc4 0 "fa/fa/fa"
    print_osc4 1 "ff/53/70"
    print_osc4 2 "91/b8/59"
    print_osc4 3 "ff/b6/2c"
    print_osc4 4 "61/82/b8"
    print_osc4 5 "7c/4d/ff"
    print_osc4 6 "39/ad/b5"
    print_osc4 7 "80/cb/c4"
    print_osc4 8 "cc/d7/da"
    print_osc4 9 "ff/53/70"
    print_osc4 10 "91/b8/59"
    print_osc4 11 "ff/b6/2c"
    print_osc4 12 "61/82/b8"
    print_osc4 13 "7c/4d/ff"
    print_osc4 14 "39/ad/b5"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "80/cb/c4"
    print_osc_rgb 11 "fa/fa/fa"
    print_osc_rgb 12 "80/cb/c4"
    print_osc_rgb 17 "80/cb/c4"
    print_osc_rgb 19 "e7/ea/ec"
}

do_linux() {
    print_linux 0 "#fafafa"
    print_linux 1 "#ff5370"
    print_linux 2 "#91b859"
    print_linux 3 "#ffb62c"
    print_linux 4 "#6182b8"
    print_linux 5 "#7c4dff"
    print_linux 6 "#39adb5"
    print_linux 7 "#80cbc4"
    print_linux 8 "#ccd7da"
    print_linux 9 "#ff5370"
    print_linux 10 "#91b859"
    print_linux 11 "#ffb62c"
    print_linux 12 "#6182b8"
    print_linux 13 "#7c4dff"
    print_linux 14 "#39adb5"
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
