#!/usr/bin/env bash

# Source:   base16
# Theme:    Bespin
# Author:   Jan T. Sott
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
    print_osc4 0 "28/21/1c"
    print_osc4 1 "cf/6a/4c"
    print_osc4 2 "54/be/0d"
    print_osc4 3 "f9/ee/98"
    print_osc4 4 "5e/a6/ea"
    print_osc4 5 "9b/85/9d"
    print_osc4 6 "af/c4/db"
    print_osc4 7 "8a/89/86"
    print_osc4 8 "66/66/66"
    print_osc4 9 "cf/6a/4c"
    print_osc4 10 "54/be/0d"
    print_osc4 11 "f9/ee/98"
    print_osc4 12 "5e/a6/ea"
    print_osc4 13 "9b/85/9d"
    print_osc4 14 "af/c4/db"
    print_osc4 15 "ba/ae/9e"

    print_osc_rgb 10 "8a/89/86"
    print_osc_rgb 11 "28/21/1c"
    print_osc_rgb 12 "8a/89/86"
    print_osc_rgb 17 "9d/9b/97"
    print_osc_rgb 19 "36/31/2e"
}

do_linux() {
    print_linux 0 "#28211c"
    print_linux 1 "#cf6a4c"
    print_linux 2 "#54be0d"
    print_linux 3 "#f9ee98"
    print_linux 4 "#5ea6ea"
    print_linux 5 "#9b859d"
    print_linux 6 "#afc4db"
    print_linux 7 "#8a8986"
    print_linux 8 "#666666"
    print_linux 9 "#cf6a4c"
    print_linux 10 "#54be0d"
    print_linux 11 "#f9ee98"
    print_linux 12 "#5ea6ea"
    print_linux 13 "#9b859d"
    print_linux 14 "#afc4db"
    print_linux 15 "#baae9e"
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
