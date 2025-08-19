#!/usr/bin/env bash

# Source:   gogh
# Theme:    Doom One
# Author:   Henrik Lissner
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
    print_osc4 0 "1b/22/29"
    print_osc4 1 "ff/6c/6b"
    print_osc4 2 "98/be/65"
    print_osc4 3 "ec/be/7b"
    print_osc4 4 "22/57/a0"
    print_osc4 5 "a9/a1/e1"
    print_osc4 6 "56/99/af"
    print_osc4 7 "5b/62/68"
    print_osc4 8 "3f/44/4a"
    print_osc4 9 "da/85/48"
    print_osc4 10 "4d/b5/bd"
    print_osc4 11 "ec/be/7b"
    print_osc4 12 "51/af/ef"
    print_osc4 13 "c6/78/dd"
    print_osc4 14 "46/d9/ff"
    print_osc4 15 "bb/c2/cf"

    print_osc_rgb 10 "5b/62/68"
    print_osc_rgb 11 "21/24/2b"
    print_osc_rgb 12 "5b/62/68"
    print_osc_rgb 17 "5b/62/68"
    print_osc_rgb 19 "21/24/2b"
}

do_linux() {
    print_linux 0 "#1b2229"
    print_linux 1 "#ff6c6b"
    print_linux 2 "#98be65"
    print_linux 3 "#ecbe7b"
    print_linux 4 "#2257a0"
    print_linux 5 "#a9a1e1"
    print_linux 6 "#5699af"
    print_linux 7 "#5b6268"
    print_linux 8 "#3f444a"
    print_linux 9 "#da8548"
    print_linux 10 "#4db5bd"
    print_linux 11 "#ecbe7b"
    print_linux 12 "#51afef"
    print_linux 13 "#c678dd"
    print_linux 14 "#46d9ff"
    print_linux 15 "#bbc2cf"
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
