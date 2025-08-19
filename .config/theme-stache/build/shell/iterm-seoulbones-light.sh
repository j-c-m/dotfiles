#!/usr/bin/env bash

# Source:   iterm
# Theme:    seoulbones_light
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

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "e2/e2/e2"
    print_osc4 1 "dc/52/84"
    print_osc4 2 "62/85/62"
    print_osc4 3 "c4/85/62"
    print_osc4 4 "00/84/a3"
    print_osc4 5 "89/67/88"
    print_osc4 6 "00/85/86"
    print_osc4 7 "55/55/55"
    print_osc4 8 "bf/ba/bb"
    print_osc4 9 "be/3b/6c"
    print_osc4 10 "48/72/49"
    print_osc4 11 "a7/6b/48"
    print_osc4 12 "00/6e/89"
    print_osc4 13 "7f/4c/7e"
    print_osc4 14 "00/6e/70"
    print_osc4 15 "77/77/77"

    print_osc_rgb 10 "55/55/55"
    print_osc_rgb 11 "e2/e2/e2"
    print_osc_rgb 12 "55/55/55"
    print_osc_rgb 17 "cc/cc/cc"
    print_osc_rgb 19 "55/55/55"
}

do_linux() {
    print_linux 0 "#e2e2e2"
    print_linux 1 "#dc5284"
    print_linux 2 "#628562"
    print_linux 3 "#c48562"
    print_linux 4 "#0084a3"
    print_linux 5 "#896788"
    print_linux 6 "#008586"
    print_linux 7 "#555555"
    print_linux 8 "#bfbabb"
    print_linux 9 "#be3b6c"
    print_linux 10 "#487249"
    print_linux 11 "#a76b48"
    print_linux 12 "#006e89"
    print_linux 13 "#7f4c7e"
    print_linux 14 "#006e70"
    print_linux 15 "#777777"
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
