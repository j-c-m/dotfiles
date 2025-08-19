#!/usr/bin/env bash

# Source:   base16
# Theme:    Nova
# Author:   George Essig (https://github.com/gessig), Trevor D. Miller (https://trevordmiller.com)
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
    print_osc4 0 "3c/4c/55"
    print_osc4 1 "83/af/e5"
    print_osc4 2 "7f/c1/ca"
    print_osc4 3 "a8/ce/93"
    print_osc4 4 "83/af/e5"
    print_osc4 5 "9a/93/e1"
    print_osc4 6 "f2/c3/8f"
    print_osc4 7 "c5/d4/dd"
    print_osc4 8 "89/9b/a6"
    print_osc4 9 "83/af/e5"
    print_osc4 10 "7f/c1/ca"
    print_osc4 11 "a8/ce/93"
    print_osc4 12 "83/af/e5"
    print_osc4 13 "9a/93/e1"
    print_osc4 14 "f2/c3/8f"
    print_osc4 15 "55/68/73"

    print_osc_rgb 10 "c5/d4/dd"
    print_osc_rgb 11 "3c/4c/55"
    print_osc_rgb 12 "c5/d4/dd"
    print_osc_rgb 17 "89/9b/a6"
    print_osc_rgb 19 "55/68/73"
}

do_linux() {
    print_linux 0 "#3c4c55"
    print_linux 1 "#83afe5"
    print_linux 2 "#7fc1ca"
    print_linux 3 "#a8ce93"
    print_linux 4 "#83afe5"
    print_linux 5 "#9a93e1"
    print_linux 6 "#f2c38f"
    print_linux 7 "#c5d4dd"
    print_linux 8 "#899ba6"
    print_linux 9 "#83afe5"
    print_linux 10 "#7fc1ca"
    print_linux 11 "#a8ce93"
    print_linux 12 "#83afe5"
    print_linux 13 "#9a93e1"
    print_linux 14 "#f2c38f"
    print_linux 15 "#556873"
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
