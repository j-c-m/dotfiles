#!/usr/bin/env bash

# Source:   base16
# Theme:    Gruvbox Material Dark, Hard
# Author:   Mayush Kumar (https://github.com/MayushKumar), sainnhe (https://github.com/sainnhe/gruvbox-material-vscode)
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
    print_osc4 0 "20/20/20"
    print_osc4 1 "ea/69/62"
    print_osc4 2 "a9/b6/65"
    print_osc4 3 "d8/a6/57"
    print_osc4 4 "7d/ae/a3"
    print_osc4 5 "d3/86/9b"
    print_osc4 6 "89/b4/82"
    print_osc4 7 "dd/c7/a1"
    print_osc4 8 "5a/52/4c"
    print_osc4 9 "ea/69/62"
    print_osc4 10 "a9/b6/65"
    print_osc4 11 "d8/a6/57"
    print_osc4 12 "7d/ae/a3"
    print_osc4 13 "d3/86/9b"
    print_osc4 14 "89/b4/82"
    print_osc4 15 "fb/f1/c7"

    print_osc_rgb 10 "dd/c7/a1"
    print_osc_rgb 11 "20/20/20"
    print_osc_rgb 12 "dd/c7/a1"
    print_osc_rgb 17 "eb/db/b2"
    print_osc_rgb 19 "2a/28/27"
}

do_linux() {
    print_linux 0 "#202020"
    print_linux 1 "#ea6962"
    print_linux 2 "#a9b665"
    print_linux 3 "#d8a657"
    print_linux 4 "#7daea3"
    print_linux 5 "#d3869b"
    print_linux 6 "#89b482"
    print_linux 7 "#ddc7a1"
    print_linux 8 "#5a524c"
    print_linux 9 "#ea6962"
    print_linux 10 "#a9b665"
    print_linux 11 "#d8a657"
    print_linux 12 "#7daea3"
    print_linux 13 "#d3869b"
    print_linux 14 "#89b482"
    print_linux 15 "#fbf1c7"
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
