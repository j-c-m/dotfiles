#!/usr/bin/env bash

# Source:   iterm
# Theme:    xcodedark
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

    printf "\033]P%x%s" "$color" ${hex:#\#}
}

do_osc() {
    print_osc4 0 "41/44/53"
    print_osc4 1 "ff/81/70"
    print_osc4 2 "78/c2/b3"
    print_osc4 3 "d9/c9/7c"
    print_osc4 4 "4e/b0/cc"
    print_osc4 5 "ff/7a/b2"
    print_osc4 6 "b2/81/eb"
    print_osc4 7 "df/df/e0"
    print_osc4 8 "7f/8c/98"
    print_osc4 9 "ff/81/70"
    print_osc4 10 "ac/f2/e4"
    print_osc4 11 "ff/a1/4f"
    print_osc4 12 "6b/df/ff"
    print_osc4 13 "ff/7a/b2"
    print_osc4 14 "da/ba/ff"
    print_osc4 15 "df/df/e0"

    print_osc_rgb 10 "df/df/e0"
    print_osc_rgb 11 "29/2a/30"
    print_osc_rgb 12 "df/df/e0"
    print_osc_rgb 17 "41/44/53"
    print_osc_rgb 19 "df/df/e0"
}

do_linux() {
    print_linux 0 "#414453"
    print_linux 1 "#ff8170"
    print_linux 2 "#78c2b3"
    print_linux 3 "#d9c97c"
    print_linux 4 "#4eb0cc"
    print_linux 5 "#ff7ab2"
    print_linux 6 "#b281eb"
    print_linux 7 "#dfdfe0"
    print_linux 8 "#7f8c98"
    print_linux 9 "#ff8170"
    print_linux 10 "#acf2e4"
    print_linux 11 "#ffa14f"
    print_linux 12 "#6bdfff"
    print_linux 13 "#ff7ab2"
    print_linux 14 "#dabaff"
    print_linux 15 "#dfdfe0"
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
