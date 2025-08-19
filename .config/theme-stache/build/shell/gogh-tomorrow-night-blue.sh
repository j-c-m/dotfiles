#!/usr/bin/env bash

# Source:   gogh
# Theme:    Tomorrow Night Blue
# Author:   Chris Kempson (http://chriskempson.com)
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
    print_osc4 0 "00/34/6e"
    print_osc4 1 "ff/9d/a4"
    print_osc4 2 "d1/f1/a9"
    print_osc4 3 "ff/ee/ad"
    print_osc4 4 "bb/da/ff"
    print_osc4 5 "eb/bb/ff"
    print_osc4 6 "99/ff/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "72/85/b7"
    print_osc4 9 "ff/9d/a4"
    print_osc4 10 "d1/f1/a9"
    print_osc4 11 "ff/ee/ad"
    print_osc4 12 "bb/da/ff"
    print_osc4 13 "eb/bb/ff"
    print_osc4 14 "99/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/24/51"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "00/24/51"
}

do_linux() {
    print_linux 0 "#00346e"
    print_linux 1 "#ff9da4"
    print_linux 2 "#d1f1a9"
    print_linux 3 "#ffeead"
    print_linux 4 "#bbdaff"
    print_linux 5 "#ebbbff"
    print_linux 6 "#99ffff"
    print_linux 7 "#ffffff"
    print_linux 8 "#7285b7"
    print_linux 9 "#ff9da4"
    print_linux 10 "#d1f1a9"
    print_linux 11 "#ffeead"
    print_linux 12 "#bbdaff"
    print_linux 13 "#ebbbff"
    print_linux 14 "#99ffff"
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
