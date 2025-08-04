#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: PaperColor Light
# Scheme author: Jon Leopard (http://github.com/jonleopard), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-papercolor-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="papercolor-light"
fi

color00="ee/ee/ee" # Base 00 - Black
color01="bc/bc/bc" # Base 08 - Red
color02="87/00/af" # Base 0B - Green
color03="d7/00/87" # Base 0A - Yellow
color04="d7/5f/00" # Base 0D - Blue
color05="00/5f/af" # Base 0E - Magenta
color06="d7/5f/00" # Base 0C - Cyan
color07="44/44/44" # Base 05 - White
color08="5f/87/00" # Base 03 - Bright Black
color09="$color01" # Base 12 - Bright Red
color10="$color02" # Base 14 - Bright Green
color11="$color03" # Base 13 - Bright Yellow
color12="$color04" # Base 16 - Bright Blue
color13="$color05" # Base 17 - Bright Magenta
color14="$color06" # Base 15 - Bright Cyan
color15="87/87/87" # Base 07 - Bright White
color16="d7/00/00" # Base 09
color17="00/5f/87" # Base 0F
color18="af/00/00" # Base 01
color19="00/87/00" # Base 02
color20="00/87/af" # Base 04
color21="00/5f/87" # Base 06
color_foreground="44/44/44" # Base 05
color_background="ee/ee/ee" # Base 00


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
  put_template_custom Pg 444444 # foreground
  put_template_custom Ph eeeeee # background
  put_template_custom Pi 444444 # bold color
  put_template_custom Pj 008700 # selection color
  put_template_custom Pk 444444 # selected text color
  put_template_custom Pl 444444 # cursor
  put_template_custom Pm eeeeee # cursor text
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

export TINTED_COLOR_00_RGB="eeeeee"
export TINTED_COLOR_01_RGB="af0000"
export TINTED_COLOR_02_RGB="008700"
export TINTED_COLOR_03_RGB="5f8700"
export TINTED_COLOR_04_RGB="0087af"
export TINTED_COLOR_05_RGB="444444"
export TINTED_COLOR_06_RGB="005f87"
export TINTED_COLOR_07_RGB="878787"
export TINTED_COLOR_08_RGB="bcbcbc"
export TINTED_COLOR_09_RGB="d70000"
export TINTED_COLOR_0A_RGB="d70087"
export TINTED_COLOR_0B_RGB="8700af"
export TINTED_COLOR_0C_RGB="d75f00"
export TINTED_COLOR_0D_RGB="d75f00"
export TINTED_COLOR_0E_RGB="005faf"
export TINTED_COLOR_0F_RGB="005f87"
export TINTED_COLOR_10_RGB="eeeeee"
export TINTED_COLOR_11_RGB="eeeeee"
export TINTED_COLOR_12_RGB="bcbcbc"
export TINTED_COLOR_13_RGB="d70087"
export TINTED_COLOR_14_RGB="8700af"
export TINTED_COLOR_15_RGB="d75f00"
export TINTED_COLOR_16_RGB="d75f00"
export TINTED_COLOR_17_RGB="005faf"
