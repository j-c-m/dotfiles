#!/usr/bin/env bash

# Source:   gogh
# Theme:    Nanosecond
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/00/00"
    print_osc4 2 "00/aa/00"
    print_osc4 3 "ff/aa/00"
    print_osc4 4 "00/aa/ff"
    print_osc4 5 "ff/00/ff"
    print_osc4 6 "00/aa/aa"
    print_osc4 7 "aa/aa/aa"
    print_osc4 8 "55/55/55"
    print_osc4 9 "ff/55/55"
    print_osc4 10 "80/ff/80"
    print_osc4 11 "ff/ff/80"
    print_osc4 12 "aa/cc/ff"
    print_osc4 13 "ff/aa/ff"
    print_osc4 14 "80/ff/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fa/fa/fa"
    print_osc_rgb 11 "11/22/33"
    print_osc_rgb 12 "fa/fa/fa"
    print_osc_rgb 17 "fa/fa/fa"
    print_osc_rgb 19 "11/22/33"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#00aa00"
    print_linux 3 "#ffaa00"
    print_linux 4 "#00aaff"
    print_linux 5 "#ff00ff"
    print_linux 6 "#00aaaa"
    print_linux 7 "#fafafa"
    print_linux 8 "#555555"
    print_linux 9 "#ff5555"
    print_linux 10 "#80ff80"
    print_linux 11 "#ffff80"
    print_linux 12 "#aaccff"
    print_linux 13 "#ffaaff"
    print_linux 14 "#80ffff"
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
