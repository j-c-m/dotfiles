#!/usr/bin/env bash

# Source:   iterm
# Theme:    HaX0R_BLUE
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
    print_osc4 0 "01/09/21"
    print_osc4 1 "10/b6/ff"
    print_osc4 2 "10/b6/ff"
    print_osc4 3 "10/b6/ff"
    print_osc4 4 "10/b6/ff"
    print_osc4 5 "10/b6/ff"
    print_osc4 6 "10/b6/ff"
    print_osc4 7 "fa/fa/fa"
    print_osc4 8 "08/01/17"
    print_osc4 9 "00/b3/f7"
    print_osc4 10 "00/b3/f7"
    print_osc4 11 "00/b3/f7"
    print_osc4 12 "00/b3/f7"
    print_osc4 13 "00/b3/f7"
    print_osc4 14 "00/b3/f7"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "10/b6/ff"
    print_osc_rgb 11 "01/04/15"
    print_osc_rgb 12 "10/b6/ff"
    print_osc_rgb 17 "c1/e3/ff"
    print_osc_rgb 19 "f5/f5/f5"
}

do_linux() {
    print_linux 0 "#010921"
    print_linux 1 "#10b6ff"
    print_linux 2 "#10b6ff"
    print_linux 3 "#10b6ff"
    print_linux 4 "#10b6ff"
    print_linux 5 "#10b6ff"
    print_linux 6 "#10b6ff"
    print_linux 7 "#10b6ff"
    print_linux 8 "#080117"
    print_linux 9 "#00b3f7"
    print_linux 10 "#00b3f7"
    print_linux 11 "#00b3f7"
    print_linux 12 "#00b3f7"
    print_linux 13 "#00b3f7"
    print_linux 14 "#00b3f7"
    print_linux 15 "#fefefe"
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
