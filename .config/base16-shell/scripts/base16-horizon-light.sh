#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Horizon Light
# Scheme author: Michaël Ball (http://github.com/michael-ball/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-horizon-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="horizon-light"
fi

color00="fd/f0/ed" # Base 00 - Black
color01="f7/93/9b" # Base 08 - Red
color02="94/e1/b0" # Base 0B - Green
color03="fb/e0/d9" # Base 0A - Yellow
color04="da/10/3f" # Base 0D - Blue
color05="1d/89/91" # Base 0E - Magenta
color06="dc/33/18" # Base 0C - Cyan
color07="40/3c/3d" # Base 05 - White
color08="bd/b3/b1" # Base 03 - Bright Black
color09="$color01" # Base 12 - Bright Red
color10="$color02" # Base 14 - Bright Green
color11="$color03" # Base 13 - Bright Yellow
color12="$color04" # Base 16 - Bright Blue
color13="$color05" # Base 17 - Bright Magenta
color14="$color06" # Base 15 - Bright Cyan
color15="20/1c/1d" # Base 07 - Bright White
color16="f6/66/1e" # Base 09
color17="e5/8c/92" # Base 0F
color18="fa/da/d1" # Base 01
color19="f9/cb/be" # Base 02
color20="94/8c/8a" # Base 04
color21="30/2c/2d" # Base 06
color_foreground="40/3c/3d" # Base 05
color_background="fd/f0/ed" # Base 00


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
  put_template_custom Pg 403c3d # foreground
  put_template_custom Ph fdf0ed # background
  put_template_custom Pi 403c3d # bold color
  put_template_custom Pj f9cbbe # selection color
  put_template_custom Pk 403c3d # selected text color
  put_template_custom Pl 403c3d # cursor
  put_template_custom Pm fdf0ed # cursor text
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

export TINTED_COLOR_00_RGB="fdf0ed"
export TINTED_COLOR_01_RGB="fadad1"
export TINTED_COLOR_02_RGB="f9cbbe"
export TINTED_COLOR_03_RGB="bdb3b1"
export TINTED_COLOR_04_RGB="948c8a"
export TINTED_COLOR_05_RGB="403c3d"
export TINTED_COLOR_06_RGB="302c2d"
export TINTED_COLOR_07_RGB="201c1d"
export TINTED_COLOR_08_RGB="f7939b"
export TINTED_COLOR_09_RGB="f6661e"
export TINTED_COLOR_0A_RGB="fbe0d9"
export TINTED_COLOR_0B_RGB="94e1b0"
export TINTED_COLOR_0C_RGB="dc3318"
export TINTED_COLOR_0D_RGB="da103f"
export TINTED_COLOR_0E_RGB="1d8991"
export TINTED_COLOR_0F_RGB="e58c92"
export TINTED_COLOR_10_RGB="fdf0ed"
export TINTED_COLOR_11_RGB="fdf0ed"
export TINTED_COLOR_12_RGB="f7939b"
export TINTED_COLOR_13_RGB="fbe0d9"
export TINTED_COLOR_14_RGB="94e1b0"
export TINTED_COLOR_15_RGB="dc3318"
export TINTED_COLOR_16_RGB="da103f"
export TINTED_COLOR_17_RGB="1d8991"
