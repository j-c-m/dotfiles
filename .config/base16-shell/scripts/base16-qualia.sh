#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Qualia
# Scheme author: isaacwhanson
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-qualia"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="qualia"
fi

color00="10/10/10" # Base 00 - Black
color01="ef/a6/a2" # Base 08 - Red
color02="80/c9/90" # Base 0B - Green
color03="e6/a3/dc" # Base 0A - Yellow
color04="50/ca/cd" # Base 0D - Blue
color05="e0/af/85" # Base 0E - Magenta
color06="c8/c8/74" # Base 0C - Cyan
color07="c0/c0/c0" # Base 05 - White
color08="45/45/45" # Base 03 - Bright Black
color09="f3/bc/b9" # Base 12 - Bright Red
color10="a0/d7/ac" # Base 14 - Bright Green
color11="ec/ba/e5" # Base 13 - Bright Yellow
color12="7c/d7/da" # Base 16 - Bright Blue
color13="e8/c3/a4" # Base 17 - Bright Magenta
color14="d6/d6/97" # Base 15 - Bright Cyan
color15="45/45/45" # Base 07 - Bright White
color16="a3/b8/ef" # Base 09
color17="80/80/80" # Base 0F
color18="45/45/45" # Base 01
color19="45/45/45" # Base 02
color20="80/80/80" # Base 04
color21="c0/c0/c0" # Base 06
color_foreground="c0/c0/c0" # Base 05
color_background="10/10/10" # Base 00


if [ -z "$TTY" ] && ! TTY=$(tty); then
  put_template() { true; }
  put_template_var() { true; }
  put_template_custom() { true; }
elif [ -n "$TMUX" ] || [ "${TERM%%[-.]*}" = "tmux" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')" > "$TTY"; }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033]%s%s\033\\' "$@" > "$TTY"; }
fi

# 16 color space
put_template 0  "$color00"
put_template 1  "$color01"
put_template 2  "$color02"
put_template 3  "$color03"
put_template 4  "$color04"
put_template 5  "$color05"
put_template 6  "$color06"
put_template 7  "$color07"
put_template 8  "$color08"
put_template 9  "$color09"
put_template 10 "$color10"
put_template 11 "$color11"
put_template 12 "$color12"
put_template 13 "$color13"
put_template 14 "$color14"
put_template 15 "$color15"

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg c0c0c0 # foreground
  put_template_custom Ph 101010 # background
  put_template_custom Pi c0c0c0 # bold color
  put_template_custom Pj 454545 # selection color
  put_template_custom Pk c0c0c0 # selected text color
  put_template_custom Pl c0c0c0 # cursor
  put_template_custom Pm 101010 # cursor text
else
  put_template_var 10 "$color_foreground"
  if [ "$TINTED_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 "$color_background"
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 "$color_background" # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset put_template
unset put_template_var
unset put_template_custom
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
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

export TINTED_COLOR_00_RGB="101010"
export TINTED_COLOR_01_RGB="454545"
export TINTED_COLOR_02_RGB="454545"
export TINTED_COLOR_03_RGB="454545"
export TINTED_COLOR_04_RGB="808080"
export TINTED_COLOR_05_RGB="c0c0c0"
export TINTED_COLOR_06_RGB="c0c0c0"
export TINTED_COLOR_07_RGB="454545"
export TINTED_COLOR_08_RGB="efa6a2"
export TINTED_COLOR_09_RGB="a3b8ef"
export TINTED_COLOR_0A_RGB="e6a3dc"
export TINTED_COLOR_0B_RGB="80c990"
export TINTED_COLOR_0C_RGB="c8c874"
export TINTED_COLOR_0D_RGB="50cacd"
export TINTED_COLOR_0E_RGB="e0af85"
export TINTED_COLOR_0F_RGB="808080"
export TINTED_COLOR_10_RGB="101010"
export TINTED_COLOR_11_RGB="101010"
export TINTED_COLOR_12_RGB="f3bcb9"
export TINTED_COLOR_13_RGB="ecbae5"
export TINTED_COLOR_14_RGB="a0d7ac"
export TINTED_COLOR_15_RGB="d6d697"
export TINTED_COLOR_16_RGB="7cd7da"
export TINTED_COLOR_17_RGB="e8c3a4"

export TINTED_COLOR_BRIGHT08_RGB="f3bcb9"
export TINTED_COLOR_BRIGHT09_RGB="bacaf3"
export TINTED_COLOR_BRIGHT0A_RGB="ecbae5"
export TINTED_COLOR_BRIGHT0B_RGB="a0d7ac"
export TINTED_COLOR_BRIGHT0C_RGB="d6d697"
export TINTED_COLOR_BRIGHT0D_RGB="7cd7da"
export TINTED_COLOR_BRIGHT0E_RGB="e8c3a4"
export TINTED_COLOR_BRIGHT0F_RGB="a0a0a0"
