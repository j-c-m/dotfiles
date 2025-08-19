#!/usr/bin/env bash

# Source:   iterm
# Theme:    Fahrenheit
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
    print_osc4 0 "1c/1c/1c"
    print_osc4 1 "cc/9f/74"
    print_osc4 2 "9e/74/4c"
    print_osc4 3 "fd/cf/74"
    print_osc4 4 "72/00/01"
    print_osc4 5 "73/4b/4c"
    print_osc4 6 "97/97/97"
    print_osc4 7 "ff/ff/cd"
    print_osc4 8 "00/00/00"
    print_osc4 9 "fd/ce/9f"
    print_osc4 10 "cb/72/4c"
    print_osc4 11 "fd/9f/4d"
    print_osc4 12 "cb/49/05"
    print_osc4 13 "4d/72/9f"
    print_osc4 14 "fe/cf/4d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/cd"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "4d/72/9f"
    print_osc_rgb 19 "ff/ff/cd"
}

do_linux() {
    print_linux 0 "#1c1c1c"
    print_linux 1 "#cc9f74"
    print_linux 2 "#9e744c"
    print_linux 3 "#fdcf74"
    print_linux 4 "#720001"
    print_linux 5 "#734b4c"
    print_linux 6 "#979797"
    print_linux 7 "#ffffcd"
    print_linux 8 "#000000"
    print_linux 9 "#fdce9f"
    print_linux 10 "#cb724c"
    print_linux 11 "#fd9f4d"
    print_linux 12 "#cb4905"
    print_linux 13 "#4d729f"
    print_linux 14 "#fecf4d"
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
