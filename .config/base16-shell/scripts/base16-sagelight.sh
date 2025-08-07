#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Sagelight
# Scheme author: Carter Veldhuizen
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-sagelight"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="sagelight"
fi

color00="f8/f8/f8" # Base 00 - Black
color01="fa/84/80" # Base 08 - Red
color02="a0/d2/c8" # Base 0B - Green
color03="ff/dc/61" # Base 0A - Yellow
color04="a0/a7/d2" # Base 0D - Blue
color05="c8/a0/d2" # Base 0E - Magenta
color06="a2/d6/f5" # Base 0C - Cyan
color07="38/38/38" # Base 05 - White
color08="b8/b8/b8" # Base 03 - Bright Black
color09="f9/2a/23" # Base 12 - Bright Red
color10="4f/c7/af" # Base 14 - Bright Green
color11="ff/c9/09" # Base 13 - Bright Yellow
color12="4f/5f/c7" # Base 16 - Bright Blue
color13="af/4f/c7" # Base 17 - Bright Magenta
color14="41/af/f0" # Base 15 - Bright Cyan
color15="18/18/18" # Base 07 - Bright White
color16="ff/aa/61" # Base 09
color17="d2/b2/a0" # Base 0F
color18="e8/e8/e8" # Base 01
color19="d8/d8/d8" # Base 02
color20="58/58/58" # Base 04
color21="28/28/28" # Base 06
color_foreground="38/38/38" # Base 05
color_background="f8/f8/f8" # Base 00


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
  put_template_custom Pg 383838 # foreground
  put_template_custom Ph f8f8f8 # background
  put_template_custom Pi 383838 # bold color
  put_template_custom Pj d8d8d8 # selection color
  put_template_custom Pk 383838 # selected text color
  put_template_custom Pl 383838 # cursor
  put_template_custom Pm f8f8f8 # cursor text
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

export TINTED_COLOR_00_RGB="f8f8f8"
export TINTED_COLOR_01_RGB="e8e8e8"
export TINTED_COLOR_02_RGB="d8d8d8"
export TINTED_COLOR_03_RGB="b8b8b8"
export TINTED_COLOR_04_RGB="585858"
export TINTED_COLOR_05_RGB="383838"
export TINTED_COLOR_06_RGB="282828"
export TINTED_COLOR_07_RGB="181818"
export TINTED_COLOR_08_RGB="fa8480"
export TINTED_COLOR_09_RGB="ffaa61"
export TINTED_COLOR_0A_RGB="ffdc61"
export TINTED_COLOR_0B_RGB="a0d2c8"
export TINTED_COLOR_0C_RGB="a2d6f5"
export TINTED_COLOR_0D_RGB="a0a7d2"
export TINTED_COLOR_0E_RGB="c8a0d2"
export TINTED_COLOR_0F_RGB="d2b2a0"
export TINTED_COLOR_10_RGB="f8f8f8"
export TINTED_COLOR_11_RGB="f8f8f8"
export TINTED_COLOR_12_RGB="f92a23"
export TINTED_COLOR_13_RGB="ffc909"
export TINTED_COLOR_14_RGB="4fc7af"
export TINTED_COLOR_15_RGB="41aff0"
export TINTED_COLOR_16_RGB="4f5fc7"
export TINTED_COLOR_17_RGB="af4fc7"

export TINTED_COLOR_BRIGHT08_RGB="f92a23"
export TINTED_COLOR_BRIGHT09_RGB="ff7b09"
export TINTED_COLOR_BRIGHT0A_RGB="ffc909"
export TINTED_COLOR_BRIGHT0B_RGB="4fc7af"
export TINTED_COLOR_BRIGHT0C_RGB="41aff0"
export TINTED_COLOR_BRIGHT0D_RGB="4f5fc7"
export TINTED_COLOR_BRIGHT0E_RGB="af4fc7"
export TINTED_COLOR_BRIGHT0F_RGB="c77a4f"
