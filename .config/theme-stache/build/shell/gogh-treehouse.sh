#!/usr/bin/env bash

# Source:   gogh
# Theme:    Treehouse
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
    print_osc4 0 "32/13/00"
    print_osc4 1 "b2/27/0e"
    print_osc4 2 "44/a9/00"
    print_osc4 3 "aa/82/0c"
    print_osc4 4 "58/85/9a"
    print_osc4 5 "97/36/3d"
    print_osc4 6 "b2/5a/1e"
    print_osc4 7 "78/6b/53"
    print_osc4 8 "43/36/26"
    print_osc4 9 "ed/5d/20"
    print_osc4 10 "55/f2/38"
    print_osc4 11 "f2/b7/32"
    print_osc4 12 "85/cf/ed"
    print_osc4 13 "e1/4c/5a"
    print_osc4 14 "f0/7d/14"
    print_osc4 15 "ff/c8/00"

    print_osc_rgb 10 "78/6b/53"
    print_osc_rgb 11 "19/19/19"
    print_osc_rgb 12 "78/6b/53"
    print_osc_rgb 17 "78/6b/53"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#321300"
    print_linux 1 "#b2270e"
    print_linux 2 "#44a900"
    print_linux 3 "#aa820c"
    print_linux 4 "#58859a"
    print_linux 5 "#97363d"
    print_linux 6 "#b25a1e"
    print_linux 7 "#786b53"
    print_linux 8 "#433626"
    print_linux 9 "#ed5d20"
    print_linux 10 "#55f238"
    print_linux 11 "#f2b732"
    print_linux 12 "#85cfed"
    print_linux 13 "#e14c5a"
    print_linux 14 "#f07d14"
    print_linux 15 "#ffc800"
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
