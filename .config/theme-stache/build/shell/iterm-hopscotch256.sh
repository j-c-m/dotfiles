#!/usr/bin/env bash

# Source:   iterm
# Theme:    Hopscotch.256
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
    print_osc4 0 "32/29/31"
    print_osc4 1 "dd/46/4c"
    print_osc4 2 "8f/c1/3e"
    print_osc4 3 "fd/cc/59"
    print_osc4 4 "12/90/bf"
    print_osc4 5 "c8/5e/7c"
    print_osc4 6 "14/9b/93"
    print_osc4 7 "b9/b5/b8"
    print_osc4 8 "79/73/79"
    print_osc4 9 "dd/46/4c"
    print_osc4 10 "8f/c1/3e"
    print_osc4 11 "fd/cc/59"
    print_osc4 12 "12/90/bf"
    print_osc4 13 "c8/5e/7c"
    print_osc4 14 "14/9b/93"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b9/b5/b8"
    print_osc_rgb 11 "32/29/31"
    print_osc_rgb 12 "b9/b5/b8"
    print_osc_rgb 17 "5c/54/5b"
    print_osc_rgb 19 "b9/b5/b8"
}

do_linux() {
    print_linux 0 "#322931"
    print_linux 1 "#dd464c"
    print_linux 2 "#8fc13e"
    print_linux 3 "#fdcc59"
    print_linux 4 "#1290bf"
    print_linux 5 "#c85e7c"
    print_linux 6 "#149b93"
    print_linux 7 "#b9b5b8"
    print_linux 8 "#797379"
    print_linux 9 "#dd464c"
    print_linux 10 "#8fc13e"
    print_linux 11 "#fdcc59"
    print_linux 12 "#1290bf"
    print_linux 13 "#c85e7c"
    print_linux 14 "#149b93"
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
