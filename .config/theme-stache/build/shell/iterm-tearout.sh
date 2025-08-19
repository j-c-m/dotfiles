#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tearout
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
    print_osc4 0 "67/57/41"
    print_osc4 1 "cc/95/7b"
    print_osc4 2 "97/97/6d"
    print_osc4 3 "6b/98/61"
    print_osc4 4 "b4/94/5d"
    print_osc4 5 "c8/a5/53"
    print_osc4 6 "d6/c3/82"
    print_osc4 7 "b4/94/5d"
    print_osc4 8 "67/57/41"
    print_osc4 9 "cc/95/7b"
    print_osc4 10 "97/97/6d"
    print_osc4 11 "6b/98/61"
    print_osc4 12 "b4/94/5d"
    print_osc4 13 "c8/a5/53"
    print_osc4 14 "d6/c3/82"
    print_osc4 15 "b4/94/5d"

    print_osc_rgb 10 "f4/d1/ae"
    print_osc_rgb 11 "33/38/2d"
    print_osc_rgb 12 "d6/c3/82"
    print_osc_rgb 17 "e3/c3/79"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#675741"
    print_linux 1 "#cc957b"
    print_linux 2 "#97976d"
    print_linux 3 "#6b9861"
    print_linux 4 "#b4945d"
    print_linux 5 "#c8a553"
    print_linux 6 "#d6c382"
    print_linux 7 "#f4d1ae"
    print_linux 8 "#675741"
    print_linux 9 "#cc957b"
    print_linux 10 "#97976d"
    print_linux 11 "#6b9861"
    print_linux 12 "#b4945d"
    print_linux 13 "#c8a553"
    print_linux 14 "#d6c382"
    print_linux 15 "#b4945d"
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
