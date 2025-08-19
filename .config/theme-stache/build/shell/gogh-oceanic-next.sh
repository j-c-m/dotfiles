#!/usr/bin/env bash

# Source:   gogh
# Theme:    Oceanic Next
# Author:   
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
    print_osc4 0 "12/1c/21"
    print_osc4 1 "e4/47/54"
    print_osc4 2 "89/bd/82"
    print_osc4 3 "f7/bd/51"
    print_osc4 4 "54/86/c0"
    print_osc4 5 "b7/7e/b8"
    print_osc4 6 "50/a5/a4"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "52/60/6b"
    print_osc4 9 "e4/47/54"
    print_osc4 10 "89/bd/82"
    print_osc4 11 "f7/bd/51"
    print_osc4 12 "54/86/c0"
    print_osc4 13 "b7/7e/b8"
    print_osc4 14 "50/a5/a4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b3/b8/c3"
    print_osc_rgb 11 "12/1b/21"
    print_osc_rgb 12 "b3/b8/c3"
    print_osc_rgb 17 "b3/b8/c3"
    print_osc_rgb 19 "12/1b/21"
}

do_linux() {
    print_linux 0 "#121c21"
    print_linux 1 "#e44754"
    print_linux 2 "#89bd82"
    print_linux 3 "#f7bd51"
    print_linux 4 "#5486c0"
    print_linux 5 "#b77eb8"
    print_linux 6 "#50a5a4"
    print_linux 7 "#b3b8c3"
    print_linux 8 "#52606b"
    print_linux 9 "#e44754"
    print_linux 10 "#89bd82"
    print_linux 11 "#f7bd51"
    print_linux 12 "#5486c0"
    print_linux 13 "#b77eb8"
    print_linux 14 "#50a5a4"
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
