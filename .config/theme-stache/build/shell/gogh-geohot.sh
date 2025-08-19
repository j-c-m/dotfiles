#!/usr/bin/env bash

# Source:   gogh
# Theme:    Geohot
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
    print_osc4 0 "f9/f5/f5"
    print_osc4 1 "cc/00/00"
    print_osc4 2 "1f/1e/1f"
    print_osc4 3 "ad/a1/10"
    print_osc4 4 "ff/00/4e"
    print_osc4 5 "75/50/7b"
    print_osc4 6 "06/91/9a"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "55/57/53"
    print_osc4 9 "ef/29/29"
    print_osc4 10 "ff/00/00"
    print_osc4 11 "ad/a1/10"
    print_osc4 12 "5f/4a/a6"
    print_osc4 13 "b7/44/38"
    print_osc4 14 "40/8f/0c"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1f/1e/1f"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "1f/1e/1f"
}

do_linux() {
    print_linux 0 "#f9f5f5"
    print_linux 1 "#cc0000"
    print_linux 2 "#1f1e1f"
    print_linux 3 "#ada110"
    print_linux 4 "#ff004e"
    print_linux 5 "#75507b"
    print_linux 6 "#06919a"
    print_linux 7 "#ffffff"
    print_linux 8 "#555753"
    print_linux 9 "#ef2929"
    print_linux 10 "#ff0000"
    print_linux 11 "#ada110"
    print_linux 12 "#5f4aa6"
    print_linux 13 "#b74438"
    print_linux 14 "#408f0c"
    print_linux 15 "#ffffff"
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
