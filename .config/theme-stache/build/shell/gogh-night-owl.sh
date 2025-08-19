#!/usr/bin/env bash

# Source:   gogh
# Theme:    Night Owl
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
    print_osc4 0 "01/16/27"
    print_osc4 1 "ef/53/50"
    print_osc4 2 "22/da/6e"
    print_osc4 3 "ad/db/67"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "21/c7/a8"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "57/56/56"
    print_osc4 9 "ef/53/50"
    print_osc4 10 "22/da/6e"
    print_osc4 11 "ff/eb/95"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "c7/92/ea"
    print_osc4 14 "7f/db/ca"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "d6/de/eb"
    print_osc_rgb 11 "01/16/27"
    print_osc_rgb 12 "d6/de/eb"
    print_osc_rgb 17 "d6/de/eb"
    print_osc_rgb 19 "01/16/27"
}

do_linux() {
    print_linux 0 "#011627"
    print_linux 1 "#ef5350"
    print_linux 2 "#22da6e"
    print_linux 3 "#addb67"
    print_linux 4 "#82aaff"
    print_linux 5 "#c792ea"
    print_linux 6 "#21c7a8"
    print_linux 7 "#d6deeb"
    print_linux 8 "#575656"
    print_linux 9 "#ef5350"
    print_linux 10 "#22da6e"
    print_linux 11 "#ffeb95"
    print_linux 12 "#82aaff"
    print_linux 13 "#c792ea"
    print_linux 14 "#7fdbca"
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
