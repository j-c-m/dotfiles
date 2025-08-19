#!/usr/bin/env bash

# Source:   iterm
# Theme:    Abernathy
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "cd/00/00"
    print_osc4 2 "00/cd/00"
    print_osc4 3 "cd/cd/00"
    print_osc4 4 "10/93/f5"
    print_osc4 5 "cd/00/cd"
    print_osc4 6 "00/cd/cd"
    print_osc4 7 "fa/eb/d7"
    print_osc4 8 "40/40/40"
    print_osc4 9 "ff/00/00"
    print_osc4 10 "00/ff/00"
    print_osc4 11 "ff/ff/00"
    print_osc4 12 "10/b4/f5"
    print_osc4 13 "ff/00/ff"
    print_osc4 14 "00/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ee/ee/ec"
    print_osc_rgb 11 "11/14/16"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "ee/ee/ec"
    print_osc_rgb 19 "33/33/33"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#cd0000"
    print_linux 2 "#00cd00"
    print_linux 3 "#cdcd00"
    print_linux 4 "#1093f5"
    print_linux 5 "#cd00cd"
    print_linux 6 "#00cdcd"
    print_linux 7 "#eeeeec"
    print_linux 8 "#404040"
    print_linux 9 "#ff0000"
    print_linux 10 "#00ff00"
    print_linux 11 "#ffff00"
    print_linux 12 "#10b4f5"
    print_linux 13 "#ff00ff"
    print_linux 14 "#00ffff"
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
