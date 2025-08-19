#!/usr/bin/env bash

# Source:   iterm
# Theme:    Floraverse
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
    print_osc4 0 "08/00/2e"
    print_osc4 1 "64/00/2c"
    print_osc4 2 "5d/73/1a"
    print_osc4 3 "cd/75/1c"
    print_osc4 4 "1d/6d/a1"
    print_osc4 5 "b7/07/7e"
    print_osc4 6 "42/a3/8c"
    print_osc4 7 "f3/e0/b8"
    print_osc4 8 "33/1e/4d"
    print_osc4 9 "d0/20/63"
    print_osc4 10 "b4/ce/59"
    print_osc4 11 "fa/c3/57"
    print_osc4 12 "40/a4/cf"
    print_osc4 13 "f1/2a/ae"
    print_osc4 14 "62/ca/a8"
    print_osc4 15 "ff/f5/db"

    print_osc_rgb 10 "db/d0/b9"
    print_osc_rgb 11 "0e/0c/15"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "f3/e0/b8"
    print_osc_rgb 19 "08/00/2e"
}

do_linux() {
    print_linux 0 "#08002e"
    print_linux 1 "#64002c"
    print_linux 2 "#5d731a"
    print_linux 3 "#cd751c"
    print_linux 4 "#1d6da1"
    print_linux 5 "#b7077e"
    print_linux 6 "#42a38c"
    print_linux 7 "#dbd0b9"
    print_linux 8 "#331e4d"
    print_linux 9 "#d02063"
    print_linux 10 "#b4ce59"
    print_linux 11 "#fac357"
    print_linux 12 "#40a4cf"
    print_linux 13 "#f12aae"
    print_linux 14 "#62caa8"
    print_linux 15 "#fff5db"
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
