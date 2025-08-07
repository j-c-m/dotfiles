#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Mocha
# Scheme author: Chris Kempson (http://chriskempson.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-mocha"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="mocha"
fi

color00="3b/32/28" # Base 00 - Black
color01="cb/60/77" # Base 08 - Red
color02="be/b5/5b" # Base 0B - Green
color03="f4/bc/87" # Base 0A - Yellow
color04="8a/b3/b5" # Base 0D - Blue
color05="a8/9b/b9" # Base 0E - Magenta
color06="7b/bd/a4" # Base 0C - Cyan
color07="d0/c8/c6" # Base 05 - White
color08="7e/70/5a" # Base 03 - Bright Black
color09="d8/88/99" # Base 12 - Bright Red
color10="ce/c8/84" # Base 14 - Bright Green
color11="f7/cd/a5" # Base 13 - Bright Yellow
color12="a7/c6/c8" # Base 16 - Bright Blue
color13="be/b4/cb" # Base 17 - Bright Magenta
color14="9c/ce/bb" # Base 15 - Bright Cyan
color15="f5/ee/eb" # Base 07 - Bright White
color16="d2/8b/71" # Base 09
color17="bb/95/84" # Base 0F
color18="53/46/36" # Base 01
color19="64/52/40" # Base 02
color20="b8/af/ad" # Base 04
color21="e9/e1/dd" # Base 06
color_foreground="d0/c8/c6" # Base 05
color_background="3b/32/28" # Base 00


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
  put_template_custom Pg d0c8c6 # foreground
  put_template_custom Ph 3b3228 # background
  put_template_custom Pi d0c8c6 # bold color
  put_template_custom Pj 645240 # selection color
  put_template_custom Pk d0c8c6 # selected text color
  put_template_custom Pl d0c8c6 # cursor
  put_template_custom Pm 3b3228 # cursor text
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

export TINTED_COLOR_00_RGB="3b3228"
export TINTED_COLOR_01_RGB="534636"
export TINTED_COLOR_02_RGB="645240"
export TINTED_COLOR_03_RGB="7e705a"
export TINTED_COLOR_04_RGB="b8afad"
export TINTED_COLOR_05_RGB="d0c8c6"
export TINTED_COLOR_06_RGB="e9e1dd"
export TINTED_COLOR_07_RGB="f5eeeb"
export TINTED_COLOR_08_RGB="cb6077"
export TINTED_COLOR_09_RGB="d28b71"
export TINTED_COLOR_0A_RGB="f4bc87"
export TINTED_COLOR_0B_RGB="beb55b"
export TINTED_COLOR_0C_RGB="7bbda4"
export TINTED_COLOR_0D_RGB="8ab3b5"
export TINTED_COLOR_0E_RGB="a89bb9"
export TINTED_COLOR_0F_RGB="bb9584"
export TINTED_COLOR_10_RGB="3b3228"
export TINTED_COLOR_11_RGB="3b3228"
export TINTED_COLOR_12_RGB="d88899"
export TINTED_COLOR_13_RGB="f7cda5"
export TINTED_COLOR_14_RGB="cec884"
export TINTED_COLOR_15_RGB="9ccebb"
export TINTED_COLOR_16_RGB="a7c6c8"
export TINTED_COLOR_17_RGB="beb4cb"

export TINTED_COLOR_BRIGHT08_RGB="d88899"
export TINTED_COLOR_BRIGHT09_RGB="dda894"
export TINTED_COLOR_BRIGHT0A_RGB="f7cda5"
export TINTED_COLOR_BRIGHT0B_RGB="cec884"
export TINTED_COLOR_BRIGHT0C_RGB="9ccebb"
export TINTED_COLOR_BRIGHT0D_RGB="a7c6c8"
export TINTED_COLOR_BRIGHT0E_RGB="beb4cb"
export TINTED_COLOR_BRIGHT0F_RGB="ccb0a3"
