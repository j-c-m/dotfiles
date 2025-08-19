#!/usr/bin/env bash

# Source:   gogh
# Theme:    Morada
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
    print_osc4 0 "04/04/04"
    print_osc4 1 "0f/49/c4"
    print_osc4 2 "48/b1/17"
    print_osc4 3 "e8/73/24"
    print_osc4 4 "bc/01/16"
    print_osc4 5 "66/5b/93"
    print_osc4 6 "70/a6/99"
    print_osc4 7 "f5/dc/be"
    print_osc4 8 "4f/7c/bf"
    print_osc4 9 "1c/96/c7"
    print_osc4 10 "3b/ff/6f"
    print_osc4 11 "ef/c3/1c"
    print_osc4 12 "fb/60/5b"
    print_osc4 13 "97/5b/5a"
    print_osc4 14 "1e/ff/8e"
    print_osc4 15 "f6/f5/fb"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "21/1f/46"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "21/1f/46"
}

do_linux() {
    print_linux 0 "#040404"
    print_linux 1 "#0f49c4"
    print_linux 2 "#48b117"
    print_linux 3 "#e87324"
    print_linux 4 "#bc0116"
    print_linux 5 "#665b93"
    print_linux 6 "#70a699"
    print_linux 7 "#ffffff"
    print_linux 8 "#4f7cbf"
    print_linux 9 "#1c96c7"
    print_linux 10 "#3bff6f"
    print_linux 11 "#efc31c"
    print_linux 12 "#fb605b"
    print_linux 13 "#975b5a"
    print_linux 14 "#1eff8e"
    print_linux 15 "#f6f5fb"
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
