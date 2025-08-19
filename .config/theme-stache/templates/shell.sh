#!/usr/bin/env bash

# Source:   {{theme-source}}
# Theme:    {{theme-name}}
# Author:   {{theme-author}}
# Variant:  {{theme-variant}}

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
    print_osc4 0 "{{ansi-0.hexterm}}"
    print_osc4 1 "{{ansi-1.hexterm}}"
    print_osc4 2 "{{ansi-2.hexterm}}"
    print_osc4 3 "{{ansi-3.hexterm}}"
    print_osc4 4 "{{ansi-4.hexterm}}"
    print_osc4 5 "{{ansi-5.hexterm}}"
    print_osc4 6 "{{ansi-6.hexterm}}"
    print_osc4 7 "{{ansi-7.hexterm}}"
    print_osc4 8 "{{ansi-8.hexterm}}"
    print_osc4 9 "{{ansi-9.hexterm}}"
    print_osc4 10 "{{ansi-10.hexterm}}"
    print_osc4 11 "{{ansi-11.hexterm}}"
    print_osc4 12 "{{ansi-12.hexterm}}"
    print_osc4 13 "{{ansi-13.hexterm}}"
    print_osc4 14 "{{ansi-14.hexterm}}"
    print_osc4 15 "{{ansi-15.hexterm}}"

    print_osc_rgb 10 "{{foreground.hexterm}}"
    print_osc_rgb 11 "{{background.hexterm}}"
    print_osc_rgb 12 "{{cursor.hexterm}}"
    print_osc_rgb 17 "{{selection.hexterm}}"
    print_osc_rgb 19 "{{selection-text.hexterm}}"
}

do_linux() {
    print_linux 0 "{{ansi-0.hex}}"
    print_linux 1 "{{ansi-1.hex}}"
    print_linux 2 "{{ansi-2.hex}}"
    print_linux 3 "{{ansi-3.hex}}"
    print_linux 4 "{{ansi-4.hex}}"
    print_linux 5 "{{ansi-5.hex}}"
    print_linux 6 "{{ansi-6.hex}}"
    print_linux 7 "{{foreground.hex}}"
    print_linux 8 "{{ansi-8.hex}}"
    print_linux 9 "{{ansi-9.hex}}"
    print_linux 10 "{{ansi-10.hex}}"
    print_linux 11 "{{ansi-11.hex}}"
    print_linux 12 "{{ansi-12.hex}}"
    print_linux 13 "{{ansi-13.hex}}"
    print_linux 14 "{{ansi-14.hex}}"
    print_linux 15 "{{ansi-15.hex}}"
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
