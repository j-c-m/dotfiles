#!/usr/bin/env bash

# Source:   base24
# Theme:    Catppuccin Mocha
# Author:   https://github.com/catppuccin/catppuccin
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
    print_osc4 0 "1e/1e/2e"
    print_osc4 1 "f3/8b/a8"
    print_osc4 2 "a6/e3/a1"
    print_osc4 3 "f9/e2/af"
    print_osc4 4 "89/b4/fa"
    print_osc4 5 "cb/a6/f7"
    print_osc4 6 "94/e2/d5"
    print_osc4 7 "cd/d6/f4"
    print_osc4 8 "45/47/5a"
    print_osc4 9 "eb/a0/ac"
    print_osc4 10 "a6/e3/a1"
    print_osc4 11 "f5/e0/dc"
    print_osc4 12 "74/c7/ec"
    print_osc4 13 "f5/c2/e7"
    print_osc4 14 "89/dc/eb"
    print_osc4 15 "b4/be/fe"

    print_osc_rgb 10 "cd/d6/f4"
    print_osc_rgb 11 "1e/1e/2e"
    print_osc_rgb 12 "cd/d6/f4"
    print_osc_rgb 17 "f5/e0/dc"
    print_osc_rgb 19 "18/18/25"
}

do_linux() {
    print_linux 0 "#1e1e2e"
    print_linux 1 "#f38ba8"
    print_linux 2 "#a6e3a1"
    print_linux 3 "#f9e2af"
    print_linux 4 "#89b4fa"
    print_linux 5 "#cba6f7"
    print_linux 6 "#94e2d5"
    print_linux 7 "#cdd6f4"
    print_linux 8 "#45475a"
    print_linux 9 "#eba0ac"
    print_linux 10 "#a6e3a1"
    print_linux 11 "#f5e0dc"
    print_linux 12 "#74c7ec"
    print_linux 13 "#f5c2e7"
    print_linux 14 "#89dceb"
    print_linux 15 "#b4befe"
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
