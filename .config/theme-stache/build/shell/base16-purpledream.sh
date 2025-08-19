#!/usr/bin/env bash

# Source:   base16
# Theme:    Purpledream
# Author:   malet
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
    print_osc4 0 "10/05/10"
    print_osc4 1 "ff/1d/0d"
    print_osc4 2 "14/cc/64"
    print_osc4 3 "f0/00/a0"
    print_osc4 4 "00/a0/f0"
    print_osc4 5 "b0/00/d0"
    print_osc4 6 "00/75/b0"
    print_osc4 7 "dd/d0/dd"
    print_osc4 8 "60/50/60"
    print_osc4 9 "ff/1d/0d"
    print_osc4 10 "14/cc/64"
    print_osc4 11 "f0/00/a0"
    print_osc4 12 "00/a0/f0"
    print_osc4 13 "b0/00/d0"
    print_osc4 14 "00/75/b0"
    print_osc4 15 "ff/f0/ff"

    print_osc_rgb 10 "dd/d0/dd"
    print_osc_rgb 11 "10/05/10"
    print_osc_rgb 12 "dd/d0/dd"
    print_osc_rgb 17 "ee/e0/ee"
    print_osc_rgb 19 "30/20/30"
}

do_linux() {
    print_linux 0 "#100510"
    print_linux 1 "#ff1d0d"
    print_linux 2 "#14cc64"
    print_linux 3 "#f000a0"
    print_linux 4 "#00a0f0"
    print_linux 5 "#b000d0"
    print_linux 6 "#0075b0"
    print_linux 7 "#ddd0dd"
    print_linux 8 "#605060"
    print_linux 9 "#ff1d0d"
    print_linux 10 "#14cc64"
    print_linux 11 "#f000a0"
    print_linux 12 "#00a0f0"
    print_linux 13 "#b000d0"
    print_linux 14 "#0075b0"
    print_linux 15 "#fff0ff"
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
