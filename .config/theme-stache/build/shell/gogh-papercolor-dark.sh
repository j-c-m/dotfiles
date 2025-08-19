#!/usr/bin/env bash

# Source:   gogh
# Theme:    Papercolor Dark
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
    print_osc4 0 "1c/1c/1c"
    print_osc4 1 "af/00/5f"
    print_osc4 2 "5f/af/00"
    print_osc4 3 "d7/af/5f"
    print_osc4 4 "5f/af/d7"
    print_osc4 5 "80/80/80"
    print_osc4 6 "d7/87/5f"
    print_osc4 7 "d0/d0/d0"
    print_osc4 8 "58/58/58"
    print_osc4 9 "5f/af/5f"
    print_osc4 10 "af/d7/00"
    print_osc4 11 "af/87/d7"
    print_osc4 12 "ff/af/00"
    print_osc4 13 "ff/5f/af"
    print_osc4 14 "00/af/af"
    print_osc4 15 "5f/87/87"

    print_osc_rgb 10 "d0/d0/d0"
    print_osc_rgb 11 "1c/1c/1c"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "d0/d0/d0"
    print_osc_rgb 19 "1c/1c/1c"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#af005f"
    print_linux 2 "#5faf00"
    print_linux 3 "#d7af5f"
    print_linux 4 "#5fafd7"
    print_linux 5 "#808080"
    print_linux 6 "#d7875f"
    print_linux 7 "#d0d0d0"
    print_linux 8 "#585858"
    print_linux 9 "#5faf5f"
    print_linux 10 "#afd700"
    print_linux 11 "#af87d7"
    print_linux 12 "#ffaf00"
    print_linux 13 "#ff5faf"
    print_linux 14 "#00afaf"
    print_linux 15 "#5f8787"
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
