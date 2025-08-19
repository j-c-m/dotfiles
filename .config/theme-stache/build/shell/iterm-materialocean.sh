#!/usr/bin/env bash

# Source:   iterm
# Theme:    MaterialOcean
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
    print_osc4 0 "54/6e/7a"
    print_osc4 1 "ff/53/70"
    print_osc4 2 "c3/e8/8d"
    print_osc4 3 "ff/cb/6b"
    print_osc4 4 "82/aa/ff"
    print_osc4 5 "c7/92/ea"
    print_osc4 6 "89/dd/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "54/6e/7a"
    print_osc4 9 "ff/53/70"
    print_osc4 10 "c3/e8/8d"
    print_osc4 11 "ff/cb/6b"
    print_osc4 12 "82/aa/ff"
    print_osc4 13 "c7/92/ea"
    print_osc4 14 "89/dd/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "8f/93/a2"
    print_osc_rgb 11 "0f/11/1a"
    print_osc_rgb 12 "ff/cc/00"
    print_osc_rgb 17 "1f/22/33"
    print_osc_rgb 19 "8f/93/a2"
}

do_linux() {
    print_linux 0 "#546e7a"
    print_linux 1 "#ff5370"
    print_linux 2 "#c3e88d"
    print_linux 3 "#ffcb6b"
    print_linux 4 "#82aaff"
    print_linux 5 "#c792ea"
    print_linux 6 "#89ddff"
    print_linux 7 "#8f93a2"
    print_linux 8 "#546e7a"
    print_linux 9 "#ff5370"
    print_linux 10 "#c3e88d"
    print_linux 11 "#ffcb6b"
    print_linux 12 "#82aaff"
    print_linux 13 "#c792ea"
    print_linux 14 "#89ddff"
    print_linux 15 "#ffffff"
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
