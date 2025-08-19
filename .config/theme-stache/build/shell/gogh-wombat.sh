#!/usr/bin/env bash

# Source:   gogh
# Theme:    Wombat
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/61/5a"
    print_osc4 2 "b1/e9/69"
    print_osc4 3 "eb/d9/9c"
    print_osc4 4 "5d/a9/f6"
    print_osc4 5 "e8/6a/ff"
    print_osc4 6 "82/ff/f7"
    print_osc4 7 "de/da/cf"
    print_osc4 8 "31/31/31"
    print_osc4 9 "f5/8c/80"
    print_osc4 10 "dd/f8/8f"
    print_osc4 11 "ee/e5/b2"
    print_osc4 12 "a5/c7/ff"
    print_osc4 13 "dd/aa/ff"
    print_osc4 14 "b7/ff/f9"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "de/da/cf"
    print_osc_rgb 11 "17/17/17"
    print_osc_rgb 12 "de/da/cf"
    print_osc_rgb 17 "de/da/cf"
    print_osc_rgb 19 "17/17/17"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff615a"
    print_linux 2 "#b1e969"
    print_linux 3 "#ebd99c"
    print_linux 4 "#5da9f6"
    print_linux 5 "#e86aff"
    print_linux 6 "#82fff7"
    print_linux 7 "#dedacf"
    print_linux 8 "#313131"
    print_linux 9 "#f58c80"
    print_linux 10 "#ddf88f"
    print_linux 11 "#eee5b2"
    print_linux 12 "#a5c7ff"
    print_linux 13 "#ddaaff"
    print_linux 14 "#b7fff9"
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
