#!/usr/bin/env bash

# Source:   iterm
# Theme:    Havn Daggry
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "1f/28/41"
    print_osc4 1 "98/52/47"
    print_osc4 2 "56/70/59"
    print_osc4 3 "be/6a/00"
    print_osc4 4 "39/56/7d"
    print_osc4 5 "7b/5b/96"
    print_osc4 6 "92/57/80"
    print_osc4 7 "d6/db/eb"
    print_osc4 8 "1f/28/41"
    print_osc4 9 "cc/4a/35"
    print_osc4 10 "71/96/78"
    print_osc4 11 "fe/b1/33"
    print_osc4 12 "60/89/c0"
    print_osc4 13 "7c/72/95"
    print_osc4 14 "a9/85/9d"
    print_osc4 15 "d6/db/eb"

    print_osc_rgb 10 "3a/4a/7a"
    print_osc_rgb 11 "f7/f9/fb"
    print_osc_rgb 12 "22/6b/4f"
    print_osc_rgb 17 "cf/e8/dd"
    print_osc_rgb 19 "30/3c/63"
}

do_linux() {
    print_linux 0 "#1f2841"
    print_linux 1 "#985247"
    print_linux 2 "#567059"
    print_linux 3 "#be6a00"
    print_linux 4 "#39567d"
    print_linux 5 "#7b5b96"
    print_linux 6 "#925780"
    print_linux 7 "#3a4a7a"
    print_linux 8 "#1f2841"
    print_linux 9 "#cc4a35"
    print_linux 10 "#719678"
    print_linux 11 "#feb133"
    print_linux 12 "#6089c0"
    print_linux 13 "#7c7295"
    print_linux 14 "#a9859d"
    print_linux 15 "#d6dbeb"
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
