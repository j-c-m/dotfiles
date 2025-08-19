#!/usr/bin/env bash

# Source:   iterm
# Theme:    Espresso Libre
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "00/00/00"
    print_osc4 1 "cc/00/00"
    print_osc4 2 "1a/92/1c"
    print_osc4 3 "ef/e4/3a"
    print_osc4 4 "00/66/ff"
    print_osc4 5 "c5/65/6b"
    print_osc4 6 "05/98/9a"
    print_osc4 7 "d3/d7/cf"
    print_osc4 8 "54/57/53"
    print_osc4 9 "ef/28/28"
    print_osc4 10 "9a/ff/87"
    print_osc4 11 "ff/fa/5c"
    print_osc4 12 "43/a8/ed"
    print_osc4 13 "ff/80/89"
    print_osc4 14 "34/e2/e2"
    print_osc4 15 "ed/ed/ec"

    print_osc_rgb 10 "b8/a8/98"
    print_osc_rgb 11 "2a/21/1c"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "c3/dc/ff"
    print_osc_rgb 19 "b8/a8/98"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cc0000"
    print_linux 2 "#1a921c"
    print_linux 3 "#efe43a"
    print_linux 4 "#0066ff"
    print_linux 5 "#c5656b"
    print_linux 6 "#05989a"
    print_linux 7 "#b8a898"
    print_linux 8 "#545753"
    print_linux 9 "#ef2828"
    print_linux 10 "#9aff87"
    print_linux 11 "#fffa5c"
    print_linux 12 "#43a8ed"
    print_linux 13 "#ff8089"
    print_linux 14 "#34e2e2"
    print_linux 15 "#ededec"
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
