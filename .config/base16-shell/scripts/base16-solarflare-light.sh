#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Solar Flare Light
# Scheme author: Chuck Harmston (https://chuck.harmston.ch)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-solarflare-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="solarflare-light"
fi

color00="f5/f7/fa" # Base 00 - Black
color01="ef/52/53" # Base 08 - Red
color02="7c/c8/44" # Base 0B - Green
color03="e4/b5/1c" # Base 0A - Yellow
color04="33/b5/e1" # Base 0D - Blue
color05="a3/63/d5" # Base 0E - Magenta
color06="52/cb/b0" # Base 0C - Cyan
color07="58/68/75" # Base 05 - White
color08="85/93/9e" # Base 03 - Bright Black
color09="e1/0f/11" # Base 12 - Bright Red
color10="5a/a7/22" # Base 14 - Bright Green
color11="b1/8b/0f" # Base 13 - Bright Yellow
color12="14/91/bb" # Base 16 - Bright Blue
color13="7f/25/c5" # Base 17 - Bright Magenta
color14="25/b1/92" # Base 15 - Bright Cyan
color15="18/26/2f" # Base 07 - Bright White
color16="e6/6b/2b" # Base 09
color17="d7/3c/9a" # Base 0F
color18="e8/e9/ed" # Base 01
color19="a6/af/b8" # Base 02
color20="66/75/81" # Base 04
color21="22/2e/38" # Base 06
color_foreground="58/68/75" # Base 05
color_background="f5/f7/fa" # Base 00


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
  put_template_custom Pg 586875 # foreground
  put_template_custom Ph f5f7fa # background
  put_template_custom Pi 586875 # bold color
  put_template_custom Pj a6afb8 # selection color
  put_template_custom Pk 586875 # selected text color
  put_template_custom Pl 586875 # cursor
  put_template_custom Pm f5f7fa # cursor text
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

export TINTED_COLOR_00_RGB="f5f7fa"
export TINTED_COLOR_01_RGB="e8e9ed"
export TINTED_COLOR_02_RGB="a6afb8"
export TINTED_COLOR_03_RGB="85939e"
export TINTED_COLOR_04_RGB="667581"
export TINTED_COLOR_05_RGB="586875"
export TINTED_COLOR_06_RGB="222e38"
export TINTED_COLOR_07_RGB="18262f"
export TINTED_COLOR_08_RGB="ef5253"
export TINTED_COLOR_09_RGB="e66b2b"
export TINTED_COLOR_0A_RGB="e4b51c"
export TINTED_COLOR_0B_RGB="7cc844"
export TINTED_COLOR_0C_RGB="52cbb0"
export TINTED_COLOR_0D_RGB="33b5e1"
export TINTED_COLOR_0E_RGB="a363d5"
export TINTED_COLOR_0F_RGB="d73c9a"
export TINTED_COLOR_10_RGB="f5f7fa"
export TINTED_COLOR_11_RGB="f5f7fa"
export TINTED_COLOR_12_RGB="e10f11"
export TINTED_COLOR_13_RGB="b18b0f"
export TINTED_COLOR_14_RGB="5aa722"
export TINTED_COLOR_15_RGB="25b192"
export TINTED_COLOR_16_RGB="1491bb"
export TINTED_COLOR_17_RGB="7f25c5"

export TINTED_COLOR_BRIGHT08_RGB="e10f11"
export TINTED_COLOR_BRIGHT09_RGB="bd4b10"
export TINTED_COLOR_BRIGHT0A_RGB="b18b0f"
export TINTED_COLOR_BRIGHT0B_RGB="5aa722"
export TINTED_COLOR_BRIGHT0C_RGB="25b192"
export TINTED_COLOR_BRIGHT0D_RGB="1491bb"
export TINTED_COLOR_BRIGHT0E_RGB="7f25c5"
export TINTED_COLOR_BRIGHT0F_RGB="b41a77"
