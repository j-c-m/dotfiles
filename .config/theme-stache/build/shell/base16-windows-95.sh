#!/usr/bin/env bash

# Source:   base16
# Theme:    Windows 95
# Author:   Fergus Collins (https://github.com/ferguscollins)
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "fc/54/54"
    print_osc4 2 "54/fc/54"
    print_osc4 3 "fc/fc/54"
    print_osc4 4 "54/54/fc"
    print_osc4 5 "fc/54/fc"
    print_osc4 6 "54/fc/fc"
    print_osc4 7 "a8/a8/a8"
    print_osc4 8 "54/54/54"
    print_osc4 9 "fc/54/54"
    print_osc4 10 "54/fc/54"
    print_osc4 11 "fc/fc/54"
    print_osc4 12 "54/54/fc"
    print_osc4 13 "fc/54/fc"
    print_osc4 14 "54/fc/fc"
    print_osc4 15 "fc/fc/fc"

    print_osc_rgb 10 "a8/a8/a8"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "a8/a8/a8"
    print_osc_rgb 17 "d2/d2/d2"
    print_osc_rgb 19 "1c/1c/1c"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fc5454"
    print_linux 2 "#54fc54"
    print_linux 3 "#fcfc54"
    print_linux 4 "#5454fc"
    print_linux 5 "#fc54fc"
    print_linux 6 "#54fcfc"
    print_linux 7 "#a8a8a8"
    print_linux 8 "#545454"
    print_linux 9 "#fc5454"
    print_linux 10 "#54fc54"
    print_linux 11 "#fcfc54"
    print_linux 12 "#5454fc"
    print_linux 13 "#fc54fc"
    print_linux 14 "#54fcfc"
    print_linux 15 "#fcfcfc"
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
