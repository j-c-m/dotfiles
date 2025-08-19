#!/usr/bin/env bash

# Source:   base16
# Theme:    vulcan
# Author:   Andrey Varfolomeev
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
    print_osc4 0 "04/15/23"
    print_osc4 1 "81/85/91"
    print_osc4 2 "97/7d/7c"
    print_osc4 3 "ad/b4/b9"
    print_osc4 4 "97/7d/7c"
    print_osc4 5 "91/98/a3"
    print_osc4 6 "97/7d/7c"
    print_osc4 7 "5b/77/8c"
    print_osc4 8 "7a/57/59"
    print_osc4 9 "81/85/91"
    print_osc4 10 "97/7d/7c"
    print_osc4 11 "ad/b4/b9"
    print_osc4 12 "97/7d/7c"
    print_osc4 13 "91/98/a3"
    print_osc4 14 "97/7d/7c"
    print_osc4 15 "21/4d/68"

    print_osc_rgb 10 "5b/77/8c"
    print_osc_rgb 11 "04/15/23"
    print_osc_rgb 12 "5b/77/8c"
    print_osc_rgb 17 "33/32/38"
    print_osc_rgb 19 "12/23/39"
}

do_linux() {
    print_linux 0 "#041523"
    print_linux 1 "#818591"
    print_linux 2 "#977d7c"
    print_linux 3 "#adb4b9"
    print_linux 4 "#977d7c"
    print_linux 5 "#9198a3"
    print_linux 6 "#977d7c"
    print_linux 7 "#5b778c"
    print_linux 8 "#7a5759"
    print_linux 9 "#818591"
    print_linux 10 "#977d7c"
    print_linux 11 "#adb4b9"
    print_linux 12 "#977d7c"
    print_linux 13 "#9198a3"
    print_linux 14 "#977d7c"
    print_linux 15 "#214d68"
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
