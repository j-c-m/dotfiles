#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Space
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
    print_osc4 0 "24/24/2e"
    print_osc4 1 "76/76/f4"
    print_osc4 2 "ec/73/36"
    print_osc4 3 "fe/8c/52"
    print_osc4 4 "76/76/93"
    print_osc4 5 "ec/73/36"
    print_osc4 6 "8a/8a/ad"
    print_osc4 7 "a1/a1/b5"
    print_osc4 8 "5b/5b/76"
    print_osc4 9 "f3/7b/3f"
    print_osc4 10 "33/33/42"
    print_osc4 11 "51/51/67"
    print_osc4 12 "73/73/91"
    print_osc4 13 "ce/ce/e3"
    print_osc4 14 "e6/6e/33"
    print_osc4 15 "eb/eb/ff"

    print_osc_rgb 10 "a1/a1/b5"
    print_osc_rgb 11 "24/24/2e"
    print_osc_rgb 12 "b2/54/24"
    print_osc_rgb 17 "a1/a1/b5"
    print_osc_rgb 19 "24/24/2e"
}

do_linux() {
    print_linux 0 "#24242e"
    print_linux 1 "#7676f4"
    print_linux 2 "#ec7336"
    print_linux 3 "#fe8c52"
    print_linux 4 "#767693"
    print_linux 5 "#ec7336"
    print_linux 6 "#8a8aad"
    print_linux 7 "#a1a1b5"
    print_linux 8 "#5b5b76"
    print_linux 9 "#f37b3f"
    print_linux 10 "#333342"
    print_linux 11 "#515167"
    print_linux 12 "#737391"
    print_linux 13 "#cecee3"
    print_linux 14 "#e66e33"
    print_linux 15 "#ebebff"
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
