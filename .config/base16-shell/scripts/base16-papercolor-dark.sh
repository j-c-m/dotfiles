#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: PaperColor Dark
# Scheme author: Jon Leopard (http://github.com/jonleopard), based on PaperColor Theme (https://github.com/NLKNguyen/papercolor-theme)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-papercolor-dark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="papercolor-dark"
fi

color00="1c/1c/1c" # Base 00 - Black
color01="58/58/58" # Base 08 - Red
color02="af/87/d7" # Base 0B - Green
color03="af/d7/00" # Base 0A - Yellow
color04="ff/5f/af" # Base 0D - Blue
color05="00/af/af" # Base 0E - Magenta
color06="ff/af/00" # Base 0C - Cyan
color07="80/80/80" # Base 05 - White
color08="d7/af/5f" # Base 03 - Bright Black
color09="82/82/82" # Base 12 - Bright Red
color10="c3/a5/e1" # Base 14 - Bright Green
color11="d6/ff/22" # Base 13 - Bright Yellow
color12="ff/87/c3" # Base 16 - Bright Blue
color13="04/ff/ff" # Base 17 - Bright Magenta
color14="ff/c3/40" # Base 15 - Bright Cyan
color15="d0/d0/d0" # Base 07 - Bright White
color16="5f/af/5f" # Base 09
color17="5f/87/87" # Base 0F
color18="af/00/5f" # Base 01
color19="5f/af/00" # Base 02
color20="5f/af/d7" # Base 04
color21="d7/87/5f" # Base 06
color_foreground="80/80/80" # Base 05
color_background="1c/1c/1c" # Base 00


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
  put_template_custom Pg 808080 # foreground
  put_template_custom Ph 1c1c1c # background
  put_template_custom Pi 808080 # bold color
  put_template_custom Pj 5faf00 # selection color
  put_template_custom Pk 808080 # selected text color
  put_template_custom Pl 808080 # cursor
  put_template_custom Pm 1c1c1c # cursor text
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

export TINTED_COLOR_00_RGB="1c1c1c"
export TINTED_COLOR_01_RGB="af005f"
export TINTED_COLOR_02_RGB="5faf00"
export TINTED_COLOR_03_RGB="d7af5f"
export TINTED_COLOR_04_RGB="5fafd7"
export TINTED_COLOR_05_RGB="808080"
export TINTED_COLOR_06_RGB="d7875f"
export TINTED_COLOR_07_RGB="d0d0d0"
export TINTED_COLOR_08_RGB="585858"
export TINTED_COLOR_09_RGB="5faf5f"
export TINTED_COLOR_0A_RGB="afd700"
export TINTED_COLOR_0B_RGB="af87d7"
export TINTED_COLOR_0C_RGB="ffaf00"
export TINTED_COLOR_0D_RGB="ff5faf"
export TINTED_COLOR_0E_RGB="00afaf"
export TINTED_COLOR_0F_RGB="5f8787"
export TINTED_COLOR_10_RGB="1c1c1c"
export TINTED_COLOR_11_RGB="1c1c1c"
export TINTED_COLOR_12_RGB="828282"
export TINTED_COLOR_13_RGB="d6ff22"
export TINTED_COLOR_14_RGB="c3a5e1"
export TINTED_COLOR_15_RGB="ffc340"
export TINTED_COLOR_16_RGB="ff87c3"
export TINTED_COLOR_17_RGB="04ffff"

export TINTED_COLOR_BRIGHT08_RGB="828282"
export TINTED_COLOR_BRIGHT09_RGB="87c387"
export TINTED_COLOR_BRIGHT0A_RGB="d6ff22"
export TINTED_COLOR_BRIGHT0B_RGB="c3a5e1"
export TINTED_COLOR_BRIGHT0C_RGB="ffc340"
export TINTED_COLOR_BRIGHT0D_RGB="ff87c3"
export TINTED_COLOR_BRIGHT0E_RGB="04ffff"
export TINTED_COLOR_BRIGHT0F_RGB="84a8a8"
