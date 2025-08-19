#!/usr/bin/env bash

# Source:   iterm
# Theme:    Monokai Pro Spectrum
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
    print_osc4 0 "21/21/21"
    print_osc4 1 "fb/61/8d"
    print_osc4 2 "7b/d7/8e"
    print_osc4 3 "fb/e5/66"
    print_osc4 4 "fc/92/53"
    print_osc4 5 "94/8a/e2"
    print_osc4 6 "5a/d3/e5"
    print_osc4 7 "f7/f0/ff"
    print_osc4 8 "69/66/6c"
    print_osc4 9 "fb/61/8d"
    print_osc4 10 "7b/d7/8e"
    print_osc4 11 "fb/e5/66"
    print_osc4 12 "fc/92/53"
    print_osc4 13 "94/8a/e2"
    print_osc4 14 "5a/d3/e5"
    print_osc4 15 "f7/f0/ff"

    print_osc_rgb 10 "f7/f0/ff"
    print_osc_rgb 11 "21/21/21"
    print_osc_rgb 12 "b9/b6/c0"
    print_osc_rgb 17 "52/50/53"
    print_osc_rgb 19 "f7/f0/ff"
}

do_linux() {
    print_linux 0 "#212121"
    print_linux 1 "#fb618d"
    print_linux 2 "#7bd78e"
    print_linux 3 "#fbe566"
    print_linux 4 "#fc9253"
    print_linux 5 "#948ae2"
    print_linux 6 "#5ad3e5"
    print_linux 7 "#f7f0ff"
    print_linux 8 "#69666c"
    print_linux 9 "#fb618d"
    print_linux 10 "#7bd78e"
    print_linux 11 "#fbe566"
    print_linux 12 "#fc9253"
    print_linux 13 "#948ae2"
    print_linux 14 "#5ad3e5"
    print_linux 15 "#f7f0ff"
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
