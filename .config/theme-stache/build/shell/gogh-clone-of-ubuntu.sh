#!/usr/bin/env bash

# Source:   gogh
# Theme:    Clone Of Ubuntu
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
    print_osc4 0 "2e/34/36"
    print_osc4 1 "cc/00/00"
    print_osc4 2 "4e/9a/06"
    print_osc4 3 "c4/a0/00"
    print_osc4 4 "34/65/a4"
    print_osc4 5 "75/50/7b"
    print_osc4 6 "06/98/9a"
    print_osc4 7 "d3/d7/cf"
    print_osc4 8 "55/57/53"
    print_osc4 9 "ef/29/29"
    print_osc4 10 "8a/e2/34"
    print_osc4 11 "fc/e9/4f"
    print_osc4 12 "72/9f/cf"
    print_osc4 13 "ad/7f/a8"
    print_osc4 14 "34/e2/e2"
    print_osc4 15 "ee/ee/ec"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "30/0a/24"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "30/0a/24"
}

do_linux() {
    print_linux 0 "#2e3436"
    print_linux 1 "#cc0000"
    print_linux 2 "#4e9a06"
    print_linux 3 "#c4a000"
    print_linux 4 "#3465a4"
    print_linux 5 "#75507b"
    print_linux 6 "#06989a"
    print_linux 7 "#ffffff"
    print_linux 8 "#555753"
    print_linux 9 "#ef2929"
    print_linux 10 "#8ae234"
    print_linux 11 "#fce94f"
    print_linux 12 "#729fcf"
    print_linux 13 "#ad7fa8"
    print_linux 14 "#34e2e2"
    print_linux 15 "#eeeeec"
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
