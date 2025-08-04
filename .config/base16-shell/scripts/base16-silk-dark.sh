#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Silk Dark
# Scheme author: Gabriel Fontes (https://github.com/Misterio77)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-silk-dark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="silk-dark"
fi

color00="0e/3c/46" # Base 00 - Black
color01="fb/69/53" # Base 08 - Red
color02="73/d8/ad" # Base 0B - Green
color03="fc/e3/80" # Base 0A - Yellow
color04="46/bd/dd" # Base 0D - Blue
color05="75/6b/8a" # Base 0E - Magenta
color06="3f/b2/b9" # Base 0C - Cyan
color07="c7/db/dd" # Base 05 - White
color08="58/70/73" # Base 03 - Bright Black
color09="$color01" # Base 12 - Bright Red
color10="$color02" # Base 14 - Bright Green
color11="$color03" # Base 13 - Bright Yellow
color12="$color04" # Base 16 - Bright Blue
color13="$color05" # Base 17 - Bright Magenta
color14="$color06" # Base 15 - Bright Cyan
color15="d2/fa/ff" # Base 07 - Bright White
color16="fc/ab/74" # Base 09
color17="9b/64/7b" # Base 0F
color18="1d/49/4e" # Base 01
color19="2a/50/54" # Base 02
color20="9d/c8/cd" # Base 04
color21="cb/f2/f7" # Base 06
color_foreground="c7/db/dd" # Base 05
color_background="0e/3c/46" # Base 00


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
  put_template_custom Pg c7dbdd # foreground
  put_template_custom Ph 0e3c46 # background
  put_template_custom Pi c7dbdd # bold color
  put_template_custom Pj 2a5054 # selection color
  put_template_custom Pk c7dbdd # selected text color
  put_template_custom Pl c7dbdd # cursor
  put_template_custom Pm 0e3c46 # cursor text
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

export TINTED_COLOR_00_RGB="0e3c46"
export TINTED_COLOR_01_RGB="1d494e"
export TINTED_COLOR_02_RGB="2a5054"
export TINTED_COLOR_03_RGB="587073"
export TINTED_COLOR_04_RGB="9dc8cd"
export TINTED_COLOR_05_RGB="c7dbdd"
export TINTED_COLOR_06_RGB="cbf2f7"
export TINTED_COLOR_07_RGB="d2faff"
export TINTED_COLOR_08_RGB="fb6953"
export TINTED_COLOR_09_RGB="fcab74"
export TINTED_COLOR_0A_RGB="fce380"
export TINTED_COLOR_0B_RGB="73d8ad"
export TINTED_COLOR_0C_RGB="3fb2b9"
export TINTED_COLOR_0D_RGB="46bddd"
export TINTED_COLOR_0E_RGB="756b8a"
export TINTED_COLOR_0F_RGB="9b647b"
export TINTED_COLOR_10_RGB="0e3c46"
export TINTED_COLOR_11_RGB="0e3c46"
export TINTED_COLOR_12_RGB="fb6953"
export TINTED_COLOR_13_RGB="fce380"
export TINTED_COLOR_14_RGB="73d8ad"
export TINTED_COLOR_15_RGB="3fb2b9"
export TINTED_COLOR_16_RGB="46bddd"
export TINTED_COLOR_17_RGB="756b8a"
