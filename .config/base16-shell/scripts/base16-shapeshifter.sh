#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Shapeshifter
# Scheme author: Tyler Benziger (http://tybenz.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-shapeshifter"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="shapeshifter"
fi

color00="f9/f9/f9" # Base 00 - Black
color01="e9/2f/2f" # Base 08 - Red
color02="0e/d8/39" # Base 0B - Green
color03="dd/dd/13" # Base 0A - Yellow
color04="3b/48/e3" # Base 0D - Blue
color05="f9/96/e2" # Base 0E - Magenta
color06="23/ed/da" # Base 0C - Cyan
color07="10/20/15" # Base 05 - White
color08="55/55/55" # Base 03 - Bright Black
color09="c3/0f/0f" # Base 12 - Bright Red
color10="08/a5/29" # Base 14 - Bright Green
color11="a9/a9/0b" # Base 13 - Bright Yellow
color12="14/22/c2" # Base 16 - Bright Blue
color13="f6/35/c9" # Base 17 - Bright Magenta
color14="0c/c0/af" # Base 15 - Bright Cyan
color15="00/00/00" # Base 07 - Bright White
color16="e0/94/48" # Base 09
color17="69/54/2d" # Base 0F
color18="e0/e0/e0" # Base 01
color19="ab/ab/ab" # Base 02
color20="34/34/34" # Base 04
color21="04/04/04" # Base 06
color_foreground="10/20/15" # Base 05
color_background="f9/f9/f9" # Base 00


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
  put_template_custom Pg 102015 # foreground
  put_template_custom Ph f9f9f9 # background
  put_template_custom Pi 102015 # bold color
  put_template_custom Pj ababab # selection color
  put_template_custom Pk 102015 # selected text color
  put_template_custom Pl 102015 # cursor
  put_template_custom Pm f9f9f9 # cursor text
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

export TINTED_COLOR_00_RGB="f9f9f9"
export TINTED_COLOR_01_RGB="e0e0e0"
export TINTED_COLOR_02_RGB="ababab"
export TINTED_COLOR_03_RGB="555555"
export TINTED_COLOR_04_RGB="343434"
export TINTED_COLOR_05_RGB="102015"
export TINTED_COLOR_06_RGB="040404"
export TINTED_COLOR_07_RGB="000000"
export TINTED_COLOR_08_RGB="e92f2f"
export TINTED_COLOR_09_RGB="e09448"
export TINTED_COLOR_0A_RGB="dddd13"
export TINTED_COLOR_0B_RGB="0ed839"
export TINTED_COLOR_0C_RGB="23edda"
export TINTED_COLOR_0D_RGB="3b48e3"
export TINTED_COLOR_0E_RGB="f996e2"
export TINTED_COLOR_0F_RGB="69542d"
export TINTED_COLOR_10_RGB="f9f9f9"
export TINTED_COLOR_11_RGB="f9f9f9"
export TINTED_COLOR_12_RGB="c30f0f"
export TINTED_COLOR_13_RGB="a9a90b"
export TINTED_COLOR_14_RGB="08a529"
export TINTED_COLOR_15_RGB="0cc0af"
export TINTED_COLOR_16_RGB="1422c2"
export TINTED_COLOR_17_RGB="f635c9"

export TINTED_COLOR_BRIGHT08_RGB="c30f0f"
export TINTED_COLOR_BRIGHT09_RGB="c66f18"
export TINTED_COLOR_BRIGHT0A_RGB="a9a90b"
export TINTED_COLOR_BRIGHT0B_RGB="08a529"
export TINTED_COLOR_BRIGHT0C_RGB="0cc0af"
export TINTED_COLOR_BRIGHT0D_RGB="1422c2"
export TINTED_COLOR_BRIGHT0E_RGB="f635c9"
export TINTED_COLOR_BRIGHT0F_RGB="574219"
