#!/usr/bin/env bash

# Source:   base16
# Theme:    Digital Rain
# Author:   Nathan Byrd (https://github.com/cognitivegears)
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "c8/5a/46"
    print_osc4 2 "64/c8/3c"
    print_osc4 3 "a6/7a/50"
    print_osc4 4 "54/82/af"
    print_osc4 5 "94/72/b4"
    print_osc4 6 "46/8c/78"
    print_osc4 7 "00/ff/00"
    print_osc4 8 "7c/8d/7c"
    print_osc4 9 "c8/5a/46"
    print_osc4 10 "64/c8/3c"
    print_osc4 11 "a6/7a/50"
    print_osc4 12 "54/82/af"
    print_osc4 13 "94/72/b4"
    print_osc4 14 "46/8c/78"
    print_osc4 15 "d8/e2/dc"

    print_osc_rgb 10 "00/ff/00"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "00/ff/00"
    print_osc_rgb 17 "c4/ce/c4"
    print_osc_rgb 19 "4a/80/6c"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#c85a46"
    print_linux 2 "#64c83c"
    print_linux 3 "#a67a50"
    print_linux 4 "#5482af"
    print_linux 5 "#9472b4"
    print_linux 6 "#468c78"
    print_linux 7 "#00ff00"
    print_linux 8 "#7c8d7c"
    print_linux 9 "#c85a46"
    print_linux 10 "#64c83c"
    print_linux 11 "#a67a50"
    print_linux 12 "#5482af"
    print_linux 13 "#9472b4"
    print_linux 14 "#468c78"
    print_linux 15 "#d8e2dc"
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
