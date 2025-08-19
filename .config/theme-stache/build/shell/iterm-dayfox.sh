#!/usr/bin/env bash

# Source:   iterm
# Theme:    dayfox
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "34/2b/24"
    print_osc4 1 "a4/21/2f"
    print_osc4 2 "39/67/47"
    print_osc4 3 "ac/53/02"
    print_osc4 4 "28/47/a9"
    print_osc4 5 "6e/33/cd"
    print_osc4 6 "28/79/80"
    print_osc4 7 "f2/e9/e0"
    print_osc4 8 "52/4b/45"
    print_osc4 9 "b3/43/4e"
    print_osc4 10 "57/7e/63"
    print_osc4 11 "b7/6e/28"
    print_osc4 12 "47/63/b6"
    print_osc4 13 "84/51/d5"
    print_osc4 14 "47/8d/92"
    print_osc4 15 "f4/eb/e6"

    print_osc_rgb 10 "3d/2a/5a"
    print_osc_rgb 11 "f5/f2/ed"
    print_osc_rgb 12 "3d/2a/5a"
    print_osc_rgb 17 "e7/d2/be"
    print_osc_rgb 19 "3d/2a/5a"
}

do_linux() {
    print_linux 0 "#342b24"
    print_linux 1 "#a4212f"
    print_linux 2 "#396747"
    print_linux 3 "#ac5302"
    print_linux 4 "#2847a9"
    print_linux 5 "#6e33cd"
    print_linux 6 "#287980"
    print_linux 7 "#3d2a5a"
    print_linux 8 "#524b45"
    print_linux 9 "#b3434e"
    print_linux 10 "#577e63"
    print_linux 11 "#b76e28"
    print_linux 12 "#4763b6"
    print_linux 13 "#8451d5"
    print_linux 14 "#478d92"
    print_linux 15 "#f4ebe6"
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
