#!/usr/bin/env bash

# Source:   base24
# Theme:    Royal
# Author:   FredHappyface (https://github.com/fredHappyface)
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
    print_osc4 0 "10/08/14"
    print_osc4 1 "90/27/4b"
    print_osc4 2 "23/80/1c"
    print_osc4 3 "8f/b9/f9"
    print_osc4 4 "64/80/af"
    print_osc4 5 "66/4d/96"
    print_osc4 6 "8a/aa/bd"
    print_osc4 7 "49/42/5a"
    print_osc4 8 "39/34/46"
    print_osc4 9 "d4/34/6c"
    print_osc4 10 "2c/d8/45"
    print_osc4 11 "fd/e8/3a"
    print_osc4 12 "8f/b9/f9"
    print_osc4 13 "a4/79/e2"
    print_osc4 14 "ab/d3/eb"
    print_osc4 15 "9d/8b/bd"

    print_osc_rgb 10 "49/42/5a"
    print_osc_rgb 11 "10/08/14"
    print_osc_rgb 12 "49/42/5a"
    print_osc_rgb 17 "51/49/65"
    print_osc_rgb 19 "24/1f/2a"
}

do_linux() {
    print_linux 0 "#100814"
    print_linux 1 "#90274b"
    print_linux 2 "#23801c"
    print_linux 3 "#8fb9f9"
    print_linux 4 "#6480af"
    print_linux 5 "#664d96"
    print_linux 6 "#8aaabd"
    print_linux 7 "#49425a"
    print_linux 8 "#393446"
    print_linux 9 "#d4346c"
    print_linux 10 "#2cd845"
    print_linux 11 "#fde83a"
    print_linux 12 "#8fb9f9"
    print_linux 13 "#a479e2"
    print_linux 14 "#abd3eb"
    print_linux 15 "#9d8bbd"
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
