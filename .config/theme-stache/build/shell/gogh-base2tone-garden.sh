#!/usr/bin/env bash

# Source:   gogh
# Theme:    Base2Tone Garden
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
    print_osc4 0 "1e/1f/1e"
    print_osc4 1 "3f/ac/39"
    print_osc4 2 "db/92/57"
    print_osc4 3 "e0/ca/b8"
    print_osc4 4 "4c/b9/46"
    print_osc4 5 "db/92/57"
    print_osc4 6 "6b/cc/66"
    print_osc4 7 "96/9c/96"
    print_osc4 8 "5d/60/5c"
    print_osc4 9 "db/a0/70"
    print_osc4 10 "2b/2c/2a"
    print_osc4 11 "50/53/50"
    print_osc4 12 "69/6d/69"
    print_osc4 13 "b7/e3/b5"
    print_osc4 14 "dd/84/3c"
    print_osc4 15 "dc/f0/db"

    print_osc_rgb 10 "96/9c/96"
    print_osc_rgb 11 "1e/1f/1e"
    print_osc_rgb 12 "bd/5d/0f"
    print_osc_rgb 17 "96/9c/96"
    print_osc_rgb 19 "1e/1f/1e"
}

do_linux() {
    print_linux 0 "#1e1f1e"
    print_linux 1 "#3fac39"
    print_linux 2 "#db9257"
    print_linux 3 "#e0cab8"
    print_linux 4 "#4cb946"
    print_linux 5 "#db9257"
    print_linux 6 "#6bcc66"
    print_linux 7 "#969c96"
    print_linux 8 "#5d605c"
    print_linux 9 "#dba070"
    print_linux 10 "#2b2c2a"
    print_linux 11 "#505350"
    print_linux 12 "#696d69"
    print_linux 13 "#b7e3b5"
    print_linux 14 "#dd843c"
    print_linux 15 "#dcf0db"
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
