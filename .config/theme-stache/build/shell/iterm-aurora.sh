#!/usr/bin/env bash

# Source:   iterm
# Theme:    Aurora
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
    print_osc4 0 "23/26/2e"
    print_osc4 1 "f0/26/6f"
    print_osc4 2 "8f/d4/6d"
    print_osc4 3 "ff/e6/6d"
    print_osc4 4 "03/21/d7"
    print_osc4 5 "ee/5d/43"
    print_osc4 6 "03/d6/b8"
    print_osc4 7 "c7/4d/ed"
    print_osc4 8 "29/2e/38"
    print_osc4 9 "f9/26/72"
    print_osc4 10 "8f/d4/6d"
    print_osc4 11 "ff/e6/6d"
    print_osc4 12 "03/d6/b8"
    print_osc4 13 "ee/5d/43"
    print_osc4 14 "03/d6/b8"
    print_osc4 15 "c7/4d/ed"

    print_osc_rgb 10 "ff/ca/28"
    print_osc_rgb 11 "23/26/2e"
    print_osc_rgb 12 "ee/5d/43"
    print_osc_rgb 17 "29/2e/38"
    print_osc_rgb 19 "00/e8/c6"
}

do_linux() {
    print_linux 0 "#23262e"
    print_linux 1 "#f0266f"
    print_linux 2 "#8fd46d"
    print_linux 3 "#ffe66d"
    print_linux 4 "#0321d7"
    print_linux 5 "#ee5d43"
    print_linux 6 "#03d6b8"
    print_linux 7 "#ffca28"
    print_linux 8 "#292e38"
    print_linux 9 "#f92672"
    print_linux 10 "#8fd46d"
    print_linux 11 "#ffe66d"
    print_linux 12 "#03d6b8"
    print_linux 13 "#ee5d43"
    print_linux 14 "#03d6b8"
    print_linux 15 "#c74ded"
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
