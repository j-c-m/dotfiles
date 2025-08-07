#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Icy Dark
# Scheme author: icyphox (https://icyphox.ga)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-icy"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="icy"
fi

color00="02/10/12" # Base 00 - Black
color01="16/c1/d9" # Base 08 - Red
color02="4d/d0/e1" # Base 0B - Green
color03="80/de/ea" # Base 0A - Yellow
color04="00/bc/d4" # Base 0D - Blue
color05="00/ac/c1" # Base 0E - Magenta
color06="26/c6/da" # Base 0C - Cyan
color07="09/5b/67" # Base 05 - White
color08="05/2e/34" # Base 03 - Bright Black
color09="46/d8/ec" # Base 12 - Bright Red
color10="7a/dc/e9" # Base 14 - Bright Green
color11="a0/e6/ef" # Base 13 - Bright Yellow
color12="20/e6/ff" # Base 16 - Bright Blue
color13="11/e5/ff" # Base 17 - Bright Magenta
color14="5c/d4/e3" # Base 15 - Bright Cyan
color15="10/9c/b0" # Base 07 - Bright White
color16="b3/eb/f2" # Base 09
color17="00/97/a7" # Base 0F
color18="03/16/19" # Base 01
color19="04/1f/23" # Base 02
color20="06/40/48" # Base 04
color21="0c/7c/8c" # Base 06
color_foreground="09/5b/67" # Base 05
color_background="02/10/12" # Base 00


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
  put_template_custom Pg 095b67 # foreground
  put_template_custom Ph 021012 # background
  put_template_custom Pi 095b67 # bold color
  put_template_custom Pj 041f23 # selection color
  put_template_custom Pk 095b67 # selected text color
  put_template_custom Pl 095b67 # cursor
  put_template_custom Pm 021012 # cursor text
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

export TINTED_COLOR_00_RGB="021012"
export TINTED_COLOR_01_RGB="031619"
export TINTED_COLOR_02_RGB="041f23"
export TINTED_COLOR_03_RGB="052e34"
export TINTED_COLOR_04_RGB="064048"
export TINTED_COLOR_05_RGB="095b67"
export TINTED_COLOR_06_RGB="0c7c8c"
export TINTED_COLOR_07_RGB="109cb0"
export TINTED_COLOR_08_RGB="16c1d9"
export TINTED_COLOR_09_RGB="b3ebf2"
export TINTED_COLOR_0A_RGB="80deea"
export TINTED_COLOR_0B_RGB="4dd0e1"
export TINTED_COLOR_0C_RGB="26c6da"
export TINTED_COLOR_0D_RGB="00bcd4"
export TINTED_COLOR_0E_RGB="00acc1"
export TINTED_COLOR_0F_RGB="0097a7"
export TINTED_COLOR_10_RGB="021012"
export TINTED_COLOR_11_RGB="021012"
export TINTED_COLOR_12_RGB="46d8ec"
export TINTED_COLOR_13_RGB="a0e6ef"
export TINTED_COLOR_14_RGB="7adce9"
export TINTED_COLOR_15_RGB="5cd4e3"
export TINTED_COLOR_16_RGB="20e6ff"
export TINTED_COLOR_17_RGB="11e5ff"

export TINTED_COLOR_BRIGHT08_RGB="46d8ec"
export TINTED_COLOR_BRIGHT09_RGB="c6f0f5"
export TINTED_COLOR_BRIGHT0A_RGB="a0e6ef"
export TINTED_COLOR_BRIGHT0B_RGB="7adce9"
export TINTED_COLOR_BRIGHT0C_RGB="5cd4e3"
export TINTED_COLOR_BRIGHT0D_RGB="20e6ff"
export TINTED_COLOR_BRIGHT0E_RGB="11e5ff"
export TINTED_COLOR_BRIGHT0F_RGB="00e5fd"
