#!/usr/bin/env bash

# Source:   iterm
# Theme:    Adwaita Dark
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
    print_osc4 0 "24/1f/31"
    print_osc4 1 "bf/1b/28"
    print_osc4 2 "2e/c2/7d"
    print_osc4 3 "f5/c2/11"
    print_osc4 4 "1d/78/e3"
    print_osc4 5 "98/40/ba"
    print_osc4 6 "09/b9/db"
    print_osc4 7 "bf/be/bc"
    print_osc4 8 "5d/5c/64"
    print_osc4 9 "ec/33/3b"
    print_osc4 10 "57/e3/89"
    print_osc4 11 "f7/e3/5c"
    print_osc4 12 "50/a1/ff"
    print_osc4 13 "bf/61/cb"
    print_osc4 14 "4e/d1/fd"
    print_osc4 15 "f5/f5/f4"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "1c/1c/20"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "5d/5c/64"
}

do_linux() {
    print_linux 0 "#241f31"
    print_linux 1 "#bf1b28"
    print_linux 2 "#2ec27d"
    print_linux 3 "#f5c211"
    print_linux 4 "#1d78e3"
    print_linux 5 "#9840ba"
    print_linux 6 "#09b9db"
    print_linux 7 "#ffffff"
    print_linux 8 "#5d5c64"
    print_linux 9 "#ec333b"
    print_linux 10 "#57e389"
    print_linux 11 "#f7e35c"
    print_linux 12 "#50a1ff"
    print_linux 13 "#bf61cb"
    print_linux 14 "#4ed1fd"
    print_linux 15 "#f5f5f4"
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
