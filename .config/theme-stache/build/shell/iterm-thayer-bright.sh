#!/usr/bin/env bash

# Source:   iterm
# Theme:    Thayer Bright
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "f9/26/72"
    print_osc4 2 "4d/f7/40"
    print_osc4 3 "f3/fd/21"
    print_osc4 4 "26/56/d6"
    print_osc4 5 "8c/54/fe"
    print_osc4 6 "37/c8/b4"
    print_osc4 7 "cc/cc/c6"
    print_osc4 8 "50/53/54"
    print_osc4 9 "ff/59/95"
    print_osc4 10 "b6/e3/54"
    print_osc4 11 "fe/ed/6c"
    print_osc4 12 "3f/78/ff"
    print_osc4 13 "9e/6f/fe"
    print_osc4 14 "23/ce/d4"
    print_osc4 15 "f8/f8/f2"

    print_osc_rgb 10 "f8/f8/f8"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "fc/97/1e"
    print_osc_rgb 17 "4d/4d/4d"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#f92672"
    print_linux 2 "#4df740"
    print_linux 3 "#f3fd21"
    print_linux 4 "#2656d6"
    print_linux 5 "#8c54fe"
    print_linux 6 "#37c8b4"
    print_linux 7 "#f8f8f8"
    print_linux 8 "#505354"
    print_linux 9 "#ff5995"
    print_linux 10 "#b6e354"
    print_linux 11 "#feed6c"
    print_linux 12 "#3f78ff"
    print_linux 13 "#9e6ffe"
    print_linux 14 "#23ced4"
    print_linux 15 "#f8f8f2"
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
