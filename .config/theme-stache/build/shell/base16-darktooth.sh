#!/usr/bin/env bash

# Source:   base16
# Theme:    Darktooth
# Author:   Jason Milkins (https://github.com/jasonm23)
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
    print_osc4 0 "1d/20/21"
    print_osc4 1 "fb/54/3f"
    print_osc4 2 "95/c0/85"
    print_osc4 3 "fa/c0/3b"
    print_osc4 4 "0d/66/78"
    print_osc4 5 "8f/46/73"
    print_osc4 6 "8b/a5/9b"
    print_osc4 7 "a8/99/84"
    print_osc4 8 "66/5c/54"
    print_osc4 9 "fb/54/3f"
    print_osc4 10 "95/c0/85"
    print_osc4 11 "fa/c0/3b"
    print_osc4 12 "0d/66/78"
    print_osc4 13 "8f/46/73"
    print_osc4 14 "8b/a5/9b"
    print_osc4 15 "fd/f4/c1"

    print_osc_rgb 10 "a8/99/84"
    print_osc_rgb 11 "1d/20/21"
    print_osc_rgb 12 "a8/99/84"
    print_osc_rgb 17 "d5/c4/a1"
    print_osc_rgb 19 "32/30/2f"
}

do_linux() {
    print_linux 0 "#1d2021"
    print_linux 1 "#fb543f"
    print_linux 2 "#95c085"
    print_linux 3 "#fac03b"
    print_linux 4 "#0d6678"
    print_linux 5 "#8f4673"
    print_linux 6 "#8ba59b"
    print_linux 7 "#a89984"
    print_linux 8 "#665c54"
    print_linux 9 "#fb543f"
    print_linux 10 "#95c085"
    print_linux 11 "#fac03b"
    print_linux 12 "#0d6678"
    print_linux 13 "#8f4673"
    print_linux 14 "#8ba59b"
    print_linux 15 "#fdf4c1"
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
