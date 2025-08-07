#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Brush Trees Dark
# Scheme author: Abraham White &lt;abelincoln.white@gmail.com&gt;
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-brushtrees-dark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="brushtrees-dark"
fi

color00="48/58/67" # Base 00 - Black
color01="b3/86/86" # Base 08 - Red
color02="87/b3/86" # Base 0B - Green
color03="aa/b3/86" # Base 0A - Yellow
color04="86/8c/b3" # Base 0D - Blue
color05="b3/86/b2" # Base 0E - Magenta
color06="86/b3/b3" # Base 0C - Cyan
color07="b0/c5/c8" # Base 05 - White
color08="82/99/a1" # Base 03 - Bright Black
color09="c6/a4/a4" # Base 12 - Bright Red
color10="a5/c6/a4" # Base 14 - Bright Green
color11="bf/c6/a4" # Base 13 - Bright Yellow
color12="a4/a9/c6" # Base 16 - Bright Blue
color13="c6/a4/c5" # Base 17 - Bright Magenta
color14="a4/c6/c6" # Base 15 - Bright Cyan
color15="e3/ef/ef" # Base 07 - Bright White
color16="d8/bb/a2" # Base 09
color17="b3/9f/9f" # Base 0F
color18="5a/6d/7a" # Base 01
color19="6d/82/8e" # Base 02
color20="98/af/b5" # Base 04
color21="c9/db/dc" # Base 06
color_foreground="b0/c5/c8" # Base 05
color_background="48/58/67" # Base 00


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
  put_template_custom Pg b0c5c8 # foreground
  put_template_custom Ph 485867 # background
  put_template_custom Pi b0c5c8 # bold color
  put_template_custom Pj 6d828e # selection color
  put_template_custom Pk b0c5c8 # selected text color
  put_template_custom Pl b0c5c8 # cursor
  put_template_custom Pm 485867 # cursor text
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

export TINTED_COLOR_00_RGB="485867"
export TINTED_COLOR_01_RGB="5a6d7a"
export TINTED_COLOR_02_RGB="6d828e"
export TINTED_COLOR_03_RGB="8299a1"
export TINTED_COLOR_04_RGB="98afb5"
export TINTED_COLOR_05_RGB="b0c5c8"
export TINTED_COLOR_06_RGB="c9dbdc"
export TINTED_COLOR_07_RGB="e3efef"
export TINTED_COLOR_08_RGB="b38686"
export TINTED_COLOR_09_RGB="d8bba2"
export TINTED_COLOR_0A_RGB="aab386"
export TINTED_COLOR_0B_RGB="87b386"
export TINTED_COLOR_0C_RGB="86b3b3"
export TINTED_COLOR_0D_RGB="868cb3"
export TINTED_COLOR_0E_RGB="b386b2"
export TINTED_COLOR_0F_RGB="b39f9f"
export TINTED_COLOR_10_RGB="485867"
export TINTED_COLOR_11_RGB="485867"
export TINTED_COLOR_12_RGB="c6a4a4"
export TINTED_COLOR_13_RGB="bfc6a4"
export TINTED_COLOR_14_RGB="a5c6a4"
export TINTED_COLOR_15_RGB="a4c6c6"
export TINTED_COLOR_16_RGB="a4a9c6"
export TINTED_COLOR_17_RGB="c6a4c5"

export TINTED_COLOR_BRIGHT08_RGB="c6a4a4"
export TINTED_COLOR_BRIGHT09_RGB="e2ccb9"
export TINTED_COLOR_BRIGHT0A_RGB="bfc6a4"
export TINTED_COLOR_BRIGHT0B_RGB="a5c6a4"
export TINTED_COLOR_BRIGHT0C_RGB="a4c6c6"
export TINTED_COLOR_BRIGHT0D_RGB="a4a9c6"
export TINTED_COLOR_BRIGHT0E_RGB="c6a4c5"
export TINTED_COLOR_BRIGHT0F_RGB="c6b7b7"
