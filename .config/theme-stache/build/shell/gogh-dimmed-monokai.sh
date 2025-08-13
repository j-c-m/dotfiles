#!/usr/bin/env bash

# Source:   gogh
# Theme:    Dimmed Monokai
# Author:   
# Variant:  

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

color00="#3A3D43"    # Black (Host)
color01="#BE3F48"    # Red (Syntax string)
color02="#879A3B"    # Green (Command)
color03="#C5A635"    # Yellow (Command second)
color04="#4F76A1"    # Blue (Path)
color05="#855C8D"    # Magenta (Syntax var)
color06="#578FA4"    # Cyan (Prompt)
color07="#B9BCBA"    # White
color08="#888987"    # Bright Black
color09="#FB001F"    # Bright Red (Command error)
color10="#0F722F"   # Bright Green (Exec)
color11="#C47033"   # Bright Yellow
color12="#186DE3"   # Bright Blue (Folder)
color13="#FB0067"   # Bright Magenta
color14="#2E706D"   # Bright Cyan
color15="#FDFFB9"   # Bright White

foreground="#B9BCBA"         # Foreground (Text)
background="#1F1F1F"         # Background
cursor="#B9BCBA"                 # Cursor
selection="#B9BCBA"           # Selection Background
selection_text="#464345" # Selection Text

function tolower()
{
    local input="$1"

    typeset -l lower
    lower="$input"
    echo "$lower"
}

# Function to convert hex color (#RRGGBB) to rr/gg/bb format
hex_to_hexs() {
    local hex_color="$1"

    # Validate input (must start with # and have 6 hex digits)
    if [[ ! $hex_color =~ ^#[0-9a-fA-F]{6}$ ]]; then
        echo "Error: Invalid hex color format. Use #RRGGBB (e.g., #c0c0c0)." >&2
        exit 1
    fi

    # Remove the leading '#' and convert to lowercase
    local hex_clean=${hex_color#\#}
    hex_clean=$(tolower "$hex_clean")

    # Extract red, green, and blue components
    local red=${hex_clean:0:2}
    local green=${hex_clean:2:2}
    local blue=${hex_clean:4:2}

    # Format as rr/gg/bb and output
    echo "$red/$green/$blue"
}

print_osc4() {
    local color="$1"
    local hex="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" $(hex_to_hexs "$hex")
}

print_osc_rgb() {
    local osc="$1"
    local hex="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" $(hex_to_hexs "$hex")
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" ${hex_color#\#}
}

do_osc() {
    print_osc4 0 "$color00"
    print_osc4 1 "$color01"
    print_osc4 2 "$color02"
    print_osc4 3 "$color03"
    print_osc4 4 "$color04"
    print_osc4 5 "$color05"
    print_osc4 6 "$color06"
    print_osc4 7 "$color07"
    print_osc4 8 "$color08"
    print_osc4 9 "$color09"
    print_osc4 10 "$color10"
    print_osc4 11 "$color11"
    print_osc4 12 "$color12"
    print_osc4 13 "$color13"
    print_osc4 14 "$color14"
    print_osc4 15 "$color15"

    print_osc_rgb 10 "$foreground"
    print_osc_rgb 11 "$background"
    print_osc_rgb 12 "$cursor"
    print_osc_rgb 17 "$selection"
    print_osc_rgb 19 "$selection_text"
}

do_linux() {
    print_linux 0 "$color00"
    print_linux 1 "$color01"
    print_linux 2 "$color02"
    print_linux 3 "$color03"
    print_linux 4 "$color04"
    print_linux 5 "$color05"
    print_linux 6 "$color06"
    print_linux 7 "$color07"
    print_linux 8 "$color08"
    print_linux 9 "$color09"
    print_linux 10 "$color10"
    print_linux 11 "$color11"
    print_linux 12 "$color12"
    print_linux 13 "$color13"
    print_linux 14 "$color14"
    print_linux 15 "$color15"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f tolower
unset -f hex_to_hexs
unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux

unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset foreground
unset background
unset cursor
unset selection
unset selection_text
