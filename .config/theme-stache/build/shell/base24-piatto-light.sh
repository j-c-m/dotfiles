#!/usr/bin/env bash

# Source:   base24
# Theme:    Piatto Light
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 1 "b2/37/71"
    print_osc4 2 "66/78/1e"
    print_osc4 3 "3c/5e/a8"
    print_osc4 4 "3c/5e/a8"
    print_osc4 5 "a4/54/b2"
    print_osc4 6 "66/78/1e"
    print_osc4 7 "cf/cf/cf"
    print_osc4 8 "6f/6f/6f"
    print_osc4 9 "db/33/65"
    print_osc4 10 "82/94/29"
    print_osc4 11 "cd/6f/34"
    print_osc4 12 "3c/5e/a8"
    print_osc4 13 "a4/54/b2"
    print_osc4 14 "82/94/29"
    print_osc4 15 "f2/f2/f2"

    print_osc_rgb 10 "cf/cf/cf"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "cf/cf/cf"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "41/41/41"
}

do_linux() {
    print_linux 0 "#ffffff"
    print_linux 1 "#b23771"
    print_linux 2 "#66781e"
    print_linux 3 "#3c5ea8"
    print_linux 4 "#3c5ea8"
    print_linux 5 "#a454b2"
    print_linux 6 "#66781e"
    print_linux 7 "#cfcfcf"
    print_linux 8 "#6f6f6f"
    print_linux 9 "#db3365"
    print_linux 10 "#829429"
    print_linux 11 "#cd6f34"
    print_linux 12 "#3c5ea8"
    print_linux 13 "#a454b2"
    print_linux 14 "#829429"
    print_linux 15 "#f2f2f2"
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
