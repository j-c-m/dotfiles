#!/usr/bin/env bash

# Source:   iterm
# Theme:    FishTank
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
    print_osc4 0 "03/06/3c"
    print_osc4 1 "c6/00/49"
    print_osc4 2 "ab/f1/57"
    print_osc4 3 "fd/cd/5e"
    print_osc4 4 "52/5f/b8"
    print_osc4 5 "97/6f/81"
    print_osc4 6 "96/86/62"
    print_osc4 7 "ec/ef/fc"
    print_osc4 8 "6c/5a/30"
    print_osc4 9 "d9/4a/8a"
    print_osc4 10 "da/ff/a8"
    print_osc4 11 "fe/e6/a8"
    print_osc4 12 "b1/bd/f9"
    print_osc4 13 "fd/a4/cc"
    print_osc4 14 "a4/bc/86"
    print_osc4 15 "f6/ff/ec"

    print_osc_rgb 10 "ec/ef/fd"
    print_osc_rgb 11 "22/24/36"
    print_osc_rgb 12 "fd/cd/5e"
    print_osc_rgb 17 "fc/f6/e8"
    print_osc_rgb 19 "22/24/36"
}

do_linux() {
    print_linux 0 "#03063c"
    print_linux 1 "#c60049"
    print_linux 2 "#abf157"
    print_linux 3 "#fdcd5e"
    print_linux 4 "#525fb8"
    print_linux 5 "#976f81"
    print_linux 6 "#968662"
    print_linux 7 "#eceffd"
    print_linux 8 "#6c5a30"
    print_linux 9 "#d94a8a"
    print_linux 10 "#daffa8"
    print_linux 11 "#fee6a8"
    print_linux 12 "#b1bdf9"
    print_linux 13 "#fda4cc"
    print_linux 14 "#a4bc86"
    print_linux 15 "#f6ffec"
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
