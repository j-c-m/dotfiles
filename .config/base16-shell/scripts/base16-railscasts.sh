#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Railscasts
# Scheme author: Ryan Bates (http://railscasts.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-railscasts"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="railscasts"
fi

color00="2b/2b/2b" # Base 00 - Black
color01="da/49/39" # Base 08 - Red
color02="a5/c2/61" # Base 0B - Green
color03="ff/c6/6d" # Base 0A - Yellow
color04="6d/9c/be" # Base 0D - Blue
color05="b6/b3/eb" # Base 0E - Magenta
color06="51/9f/50" # Base 0C - Cyan
color07="e6/e1/dc" # Base 05 - White
color08="5a/64/7e" # Base 03 - Bright Black
color09="e3/76/6a" # Base 12 - Bright Red
color10="bc/d1/89" # Base 14 - Bright Green
color11="ff/d4/92" # Base 13 - Bright Yellow
color12="91/b5/ce" # Base 16 - Bright Blue
color13="c8/c6/f0" # Base 17 - Bright Magenta
color14="79/bb/78" # Base 15 - Bright Cyan
color15="f9/f7/f3" # Base 07 - Bright White
color16="cc/78/33" # Base 09
color17="bc/94/58" # Base 0F
color18="27/29/35" # Base 01
color19="3a/40/55" # Base 02
color20="d4/cf/c9" # Base 04
color21="f4/f1/ed" # Base 06
color_foreground="e6/e1/dc" # Base 05
color_background="2b/2b/2b" # Base 00


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
  put_template_custom Pg e6e1dc # foreground
  put_template_custom Ph 2b2b2b # background
  put_template_custom Pi e6e1dc # bold color
  put_template_custom Pj 3a4055 # selection color
  put_template_custom Pk e6e1dc # selected text color
  put_template_custom Pl e6e1dc # cursor
  put_template_custom Pm 2b2b2b # cursor text
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

export TINTED_COLOR_00_RGB="2b2b2b"
export TINTED_COLOR_01_RGB="272935"
export TINTED_COLOR_02_RGB="3a4055"
export TINTED_COLOR_03_RGB="5a647e"
export TINTED_COLOR_04_RGB="d4cfc9"
export TINTED_COLOR_05_RGB="e6e1dc"
export TINTED_COLOR_06_RGB="f4f1ed"
export TINTED_COLOR_07_RGB="f9f7f3"
export TINTED_COLOR_08_RGB="da4939"
export TINTED_COLOR_09_RGB="cc7833"
export TINTED_COLOR_0A_RGB="ffc66d"
export TINTED_COLOR_0B_RGB="a5c261"
export TINTED_COLOR_0C_RGB="519f50"
export TINTED_COLOR_0D_RGB="6d9cbe"
export TINTED_COLOR_0E_RGB="b6b3eb"
export TINTED_COLOR_0F_RGB="bc9458"
export TINTED_COLOR_10_RGB="2b2b2b"
export TINTED_COLOR_11_RGB="2b2b2b"
export TINTED_COLOR_12_RGB="e3766a"
export TINTED_COLOR_13_RGB="ffd492"
export TINTED_COLOR_14_RGB="bcd189"
export TINTED_COLOR_15_RGB="79bb78"
export TINTED_COLOR_16_RGB="91b5ce"
export TINTED_COLOR_17_RGB="c8c6f0"

export TINTED_COLOR_BRIGHT08_RGB="e3766a"
export TINTED_COLOR_BRIGHT09_RGB="d99a66"
export TINTED_COLOR_BRIGHT0A_RGB="ffd492"
export TINTED_COLOR_BRIGHT0B_RGB="bcd189"
export TINTED_COLOR_BRIGHT0C_RGB="79bb78"
export TINTED_COLOR_BRIGHT0D_RGB="91b5ce"
export TINTED_COLOR_BRIGHT0E_RGB="c8c6f0"
export TINTED_COLOR_BRIGHT0F_RGB="cdaf82"
