#!/usr/bin/env bash

# Source:   gogh
# Theme:    Later This Evening
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "2b/2b/2b"
    print_osc4 1 "d4/5a/60"
    print_osc4 2 "af/ba/67"
    print_osc4 3 "e5/d2/89"
    print_osc4 4 "a0/ba/d6"
    print_osc4 5 "c0/92/d6"
    print_osc4 6 "91/bf/b7"
    print_osc4 7 "3c/3d/3d"
    print_osc4 8 "45/47/47"
    print_osc4 9 "d3/23/2f"
    print_osc4 10 "aa/bb/39"
    print_osc4 11 "e5/be/39"
    print_osc4 12 "66/99/d6"
    print_osc4 13 "ab/53/d6"
    print_osc4 14 "5f/c0/ae"
    print_osc4 15 "c1/c2/c2"

    print_osc_rgb 10 "95/95/95"
    print_osc_rgb 11 "22/22/22"
    print_osc_rgb 12 "95/95/95"
    print_osc_rgb 17 "95/95/95"
    print_osc_rgb 19 "22/22/22"
}

do_linux() {
    print_linux 0 "#2b2b2b"
    print_linux 1 "#d45a60"
    print_linux 2 "#afba67"
    print_linux 3 "#e5d289"
    print_linux 4 "#a0bad6"
    print_linux 5 "#c092d6"
    print_linux 6 "#91bfb7"
    print_linux 7 "#959595"
    print_linux 8 "#454747"
    print_linux 9 "#d3232f"
    print_linux 10 "#aabb39"
    print_linux 11 "#e5be39"
    print_linux 12 "#6699d6"
    print_linux 13 "#ab53d6"
    print_linux 14 "#5fc0ae"
    print_linux 15 "#c1c2c2"
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
