#!/usr/bin/env bash

# Source:   base24
# Theme:    Chalkboard
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "29/26/2f"
    print_osc4 1 "c3/73/72"
    print_osc4 2 "72/c3/73"
    print_osc4 3 "aa/aa/db"
    print_osc4 4 "73/72/c3"
    print_osc4 5 "c3/72/c2"
    print_osc4 6 "72/c2/c3"
    print_osc4 7 "af/af/af"
    print_osc4 8 "5b/5b/5b"
    print_osc4 9 "db/aa/aa"
    print_osc4 10 "aa/db/aa"
    print_osc4 11 "da/db/aa"
    print_osc4 12 "aa/aa/db"
    print_osc4 13 "db/aa/da"
    print_osc4 14 "aa/da/db"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "af/af/af"
    print_osc_rgb 11 "29/26/2f"
    print_osc_rgb 12 "af/af/af"
    print_osc_rgb 17 "d9/d9/d9"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#29262f"
    print_linux 1 "#c37372"
    print_linux 2 "#72c373"
    print_linux 3 "#aaaadb"
    print_linux 4 "#7372c3"
    print_linux 5 "#c372c2"
    print_linux 6 "#72c2c3"
    print_linux 7 "#afafaf"
    print_linux 8 "#5b5b5b"
    print_linux 9 "#dbaaaa"
    print_linux 10 "#aadbaa"
    print_linux 11 "#dadbaa"
    print_linux 12 "#aaaadb"
    print_linux 13 "#dbaada"
    print_linux 14 "#aadadb"
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
