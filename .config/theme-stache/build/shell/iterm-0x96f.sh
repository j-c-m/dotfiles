#!/usr/bin/env bash

# Source:   iterm
# Theme:    0x96f
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
    print_osc4 0 "26/23/27"
    print_osc4 1 "fe/66/6c"
    print_osc4 2 "b2/e0/39"
    print_osc4 3 "fe/c7/39"
    print_osc4 4 "00/cd/e7"
    print_osc4 5 "a2/92/e7"
    print_osc4 6 "9c/ea/f6"
    print_osc4 7 "fc/fb/f9"
    print_osc4 8 "54/53/51"
    print_osc4 9 "fe/7e/83"
    print_osc4 10 "be/e5/5e"
    print_osc4 11 "fe/cf/5d"
    print_osc4 12 "1b/d5/eb"
    print_osc4 13 "b0/a2/eb"
    print_osc4 14 "ac/ec/f7"
    print_osc4 15 "fc/fb/f9"

    print_osc_rgb 10 "fc/fb/f9"
    print_osc_rgb 11 "26/23/27"
    print_osc_rgb 12 "fc/fb/f9"
    print_osc_rgb 17 "fc/fb/f9"
    print_osc_rgb 19 "26/23/27"
}

do_linux() {
    print_linux 0 "#262327"
    print_linux 1 "#fe666c"
    print_linux 2 "#b2e039"
    print_linux 3 "#fec739"
    print_linux 4 "#00cde7"
    print_linux 5 "#a292e7"
    print_linux 6 "#9ceaf6"
    print_linux 7 "#fcfbf9"
    print_linux 8 "#545351"
    print_linux 9 "#fe7e83"
    print_linux 10 "#bee55e"
    print_linux 11 "#fecf5d"
    print_linux 12 "#1bd5eb"
    print_linux 13 "#b0a2eb"
    print_linux 14 "#acecf7"
    print_linux 15 "#fcfbf9"
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
