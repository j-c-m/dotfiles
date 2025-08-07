#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Bespin
# Scheme author: Jan T. Sott
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-bespin"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="bespin"
fi

color00="28/21/1c" # Base 00 - Black
color01="cf/6a/4c" # Base 08 - Red
color02="54/be/0d" # Base 0B - Green
color03="f9/ee/98" # Base 0A - Yellow
color04="5e/a6/ea" # Base 0D - Blue
color05="9b/85/9d" # Base 0E - Magenta
color06="af/c4/db" # Base 0C - Cyan
color07="8a/89/86" # Base 05 - White
color08="66/66/66" # Base 03 - Bright Black
color09="db/8f/79" # Base 12 - Bright Red
color10="78/f0/27" # Base 14 - Bright Green
color11="fb/f2/b2" # Base 13 - Bright Yellow
color12="86/bc/ef" # Base 16 - Bright Blue
color13="b4/a4/b6" # Base 17 - Bright Magenta
color14="c3/d3/e4" # Base 15 - Bright Cyan
color15="ba/ae/9e" # Base 07 - Bright White
color16="cf/7d/34" # Base 09
color17="93/71/21" # Base 0F
color18="36/31/2e" # Base 01
color19="5e/5d/5c" # Base 02
color20="79/79/77" # Base 04
color21="9d/9b/97" # Base 06
color_foreground="8a/89/86" # Base 05
color_background="28/21/1c" # Base 00


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
  put_template_custom Pg 8a8986 # foreground
  put_template_custom Ph 28211c # background
  put_template_custom Pi 8a8986 # bold color
  put_template_custom Pj 5e5d5c # selection color
  put_template_custom Pk 8a8986 # selected text color
  put_template_custom Pl 8a8986 # cursor
  put_template_custom Pm 28211c # cursor text
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

export TINTED_COLOR_00_RGB="28211c"
export TINTED_COLOR_01_RGB="36312e"
export TINTED_COLOR_02_RGB="5e5d5c"
export TINTED_COLOR_03_RGB="666666"
export TINTED_COLOR_04_RGB="797977"
export TINTED_COLOR_05_RGB="8a8986"
export TINTED_COLOR_06_RGB="9d9b97"
export TINTED_COLOR_07_RGB="baae9e"
export TINTED_COLOR_08_RGB="cf6a4c"
export TINTED_COLOR_09_RGB="cf7d34"
export TINTED_COLOR_0A_RGB="f9ee98"
export TINTED_COLOR_0B_RGB="54be0d"
export TINTED_COLOR_0C_RGB="afc4db"
export TINTED_COLOR_0D_RGB="5ea6ea"
export TINTED_COLOR_0E_RGB="9b859d"
export TINTED_COLOR_0F_RGB="937121"
export TINTED_COLOR_10_RGB="28211c"
export TINTED_COLOR_11_RGB="28211c"
export TINTED_COLOR_12_RGB="db8f79"
export TINTED_COLOR_13_RGB="fbf2b2"
export TINTED_COLOR_14_RGB="78f027"
export TINTED_COLOR_15_RGB="c3d3e4"
export TINTED_COLOR_16_RGB="86bcef"
export TINTED_COLOR_17_RGB="b4a4b6"

export TINTED_COLOR_BRIGHT08_RGB="db8f79"
export TINTED_COLOR_BRIGHT09_RGB="db9e67"
export TINTED_COLOR_BRIGHT0A_RGB="fbf2b2"
export TINTED_COLOR_BRIGHT0B_RGB="78f027"
export TINTED_COLOR_BRIGHT0C_RGB="c3d3e4"
export TINTED_COLOR_BRIGHT0D_RGB="86bcef"
export TINTED_COLOR_BRIGHT0E_RGB="b4a4b6"
export TINTED_COLOR_BRIGHT0F_RGB="d2a335"
