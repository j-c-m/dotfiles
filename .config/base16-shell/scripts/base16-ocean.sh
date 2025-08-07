#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Ocean
# Scheme author: Chris Kempson (http://chriskempson.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-ocean"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="ocean"
fi

color00="2b/30/3b" # Base 00 - Black
color01="bf/61/6a" # Base 08 - Red
color02="a3/be/8c" # Base 0B - Green
color03="eb/cb/8b" # Base 0A - Yellow
color04="8f/a1/b3" # Base 0D - Blue
color05="b4/8e/ad" # Base 0E - Magenta
color06="96/b5/b4" # Base 0C - Cyan
color07="c0/c5/ce" # Base 05 - White
color08="65/73/7e" # Base 03 - Bright Black
color09="cf/89/8f" # Base 12 - Bright Red
color10="ba/ce/a9" # Base 14 - Bright Green
color11="f0/d8/a8" # Base 13 - Bright Yellow
color12="ab/b9/c6" # Base 16 - Bright Blue
color13="c7/aa/c2" # Base 17 - Bright Magenta
color14="b0/c8/c7" # Base 15 - Bright Cyan
color15="ef/f1/f5" # Base 07 - Bright White
color16="d0/87/70" # Base 09
color17="ab/79/67" # Base 0F
color18="34/3d/46" # Base 01
color19="4f/5b/66" # Base 02
color20="a7/ad/ba" # Base 04
color21="df/e1/e8" # Base 06
color_foreground="c0/c5/ce" # Base 05
color_background="2b/30/3b" # Base 00


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
  put_template_custom Pg c0c5ce # foreground
  put_template_custom Ph 2b303b # background
  put_template_custom Pi c0c5ce # bold color
  put_template_custom Pj 4f5b66 # selection color
  put_template_custom Pk c0c5ce # selected text color
  put_template_custom Pl c0c5ce # cursor
  put_template_custom Pm 2b303b # cursor text
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

export TINTED_COLOR_00_RGB="2b303b"
export TINTED_COLOR_01_RGB="343d46"
export TINTED_COLOR_02_RGB="4f5b66"
export TINTED_COLOR_03_RGB="65737e"
export TINTED_COLOR_04_RGB="a7adba"
export TINTED_COLOR_05_RGB="c0c5ce"
export TINTED_COLOR_06_RGB="dfe1e8"
export TINTED_COLOR_07_RGB="eff1f5"
export TINTED_COLOR_08_RGB="bf616a"
export TINTED_COLOR_09_RGB="d08770"
export TINTED_COLOR_0A_RGB="ebcb8b"
export TINTED_COLOR_0B_RGB="a3be8c"
export TINTED_COLOR_0C_RGB="96b5b4"
export TINTED_COLOR_0D_RGB="8fa1b3"
export TINTED_COLOR_0E_RGB="b48ead"
export TINTED_COLOR_0F_RGB="ab7967"
export TINTED_COLOR_10_RGB="2b303b"
export TINTED_COLOR_11_RGB="2b303b"
export TINTED_COLOR_12_RGB="cf898f"
export TINTED_COLOR_13_RGB="f0d8a8"
export TINTED_COLOR_14_RGB="bacea9"
export TINTED_COLOR_15_RGB="b0c8c7"
export TINTED_COLOR_16_RGB="abb9c6"
export TINTED_COLOR_17_RGB="c7aac2"

export TINTED_COLOR_BRIGHT08_RGB="cf898f"
export TINTED_COLOR_BRIGHT09_RGB="dca594"
export TINTED_COLOR_BRIGHT0A_RGB="f0d8a8"
export TINTED_COLOR_BRIGHT0B_RGB="bacea9"
export TINTED_COLOR_BRIGHT0C_RGB="b0c8c7"
export TINTED_COLOR_BRIGHT0D_RGB="abb9c6"
export TINTED_COLOR_BRIGHT0E_RGB="c7aac2"
export TINTED_COLOR_BRIGHT0F_RGB="c09b8d"
