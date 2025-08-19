#!/usr/bin/env bash

# Source:   base16
# Theme:    PaperColor Dark
# Author:   Jon Leopard (http://github.com/jonleopard), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
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
    print_osc4 1 "58/58/58"
    print_osc4 2 "af/87/d7"
    print_osc4 3 "af/d7/00"
    print_osc4 4 "ff/5f/af"
    print_osc4 5 "00/af/af"
    print_osc4 6 "ff/af/00"
    print_osc4 7 "80/80/80"
    print_osc4 8 "d7/af/5f"
    print_osc4 9 "58/58/58"
    print_osc4 10 "af/87/d7"
    print_osc4 11 "af/d7/00"
    print_osc4 12 "ff/5f/af"
    print_osc4 13 "00/af/af"
    print_osc4 14 "ff/af/00"
    print_osc4 15 "d0/d0/d0"

    print_osc_rgb 10 "80/80/80"
    print_osc_rgb 11 "1c/1c/1c"
    print_osc_rgb 12 "80/80/80"
    print_osc_rgb 17 "d7/87/5f"
    print_osc_rgb 19 "af/00/5f"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#585858"
    print_linux 2 "#af87d7"
    print_linux 3 "#afd700"
    print_linux 4 "#ff5faf"
    print_linux 5 "#00afaf"
    print_linux 6 "#ffaf00"
    print_linux 7 "#808080"
    print_linux 8 "#d7af5f"
    print_linux 9 "#585858"
    print_linux 10 "#af87d7"
    print_linux 11 "#afd700"
    print_linux 12 "#ff5faf"
    print_linux 13 "#00afaf"
    print_linux 14 "#ffaf00"
    print_linux 15 "#d0d0d0"
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
