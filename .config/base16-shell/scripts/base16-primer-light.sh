#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Primer Light
# Scheme author: Jimmy Lin
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-primer-light"

case "base16" in
  base16)
    export BASE16_THEME="primer-light"
    ;;
  base24)
    export BASE24_THEME="primer-light"
    ;;
  ansi8)
    export ANSI8_THEME="primer-light"
    ;;
esac

color00="fa/fb/fc" # Base 00 - Black
color01="d7/3a/49" # Base 08 - Red
color02="28/a7/45" # Base 0B - Green
color03="ff/d3/3d" # Base 0A - Yellow
color04="03/66/d6" # Base 0D - Blue
color05="ea/4a/aa" # Base 0E - Magenta
color06="79/b8/ff" # Base 0C - Cyan
color07="2f/36/3d" # Base 05 - White
color08="95/9d/a5" # Base 03 - Bright Black
color09="b3/1a/29" # Base 12 - Bright Red
color10="16/85/30" # Base 14 - Bright Green
color11="ed/b7/00" # Base 13 - Bright Yellow
color12="02/4c/a1" # Base 16 - Bright Blue
color13="d5/12/87" # Base 17 - Bright Magenta
color14="1b/86/ff" # Base 15 - Bright Cyan
color15="1b/1f/23" # Base 07 - Bright White
color16="f6/6a/0a" # Base 09
color17="a0/41/00" # Base 0F
color18="e1/e4/e8" # Base 01
color19="d1/d5/da" # Base 02
color20="44/4d/56" # Base 04
color21="24/29/2e" # Base 06
color_foreground="2f/36/3d" # Base 05
color_background="fa/fb/fc" # Base 00


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
  put_template_custom Pg 2f363d # foreground
  put_template_custom Ph fafbfc # background
  put_template_custom Pi 2f363d # bold color
  put_template_custom Pj d1d5da # selection color
  put_template_custom Pk 2f363d # selected text color
  put_template_custom Pl 2f363d # cursor
  put_template_custom Pm fafbfc # cursor text
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
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
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

if [ -n "$BASE16_SHELL_ENABLE_VARS" ]; then
  export BASE16_00_RGB="fafbfc"
  export BASE16_01_RGB="e1e4e8"
  export BASE16_02_RGB="d1d5da"
  export BASE16_03_RGB="959da5"
  export BASE16_04_RGB="444d56"
  export BASE16_05_RGB="2f363d"
  export BASE16_06_RGB="24292e"
  export BASE16_07_RGB="1b1f23"
  export BASE16_08_RGB="d73a49"
  export BASE16_09_RGB="f66a0a"
  export BASE16_0A_RGB="ffd33d"
  export BASE16_0B_RGB="28a745"
  export BASE16_0C_RGB="79b8ff"
  export BASE16_0D_RGB="0366d6"
  export BASE16_0E_RGB="ea4aaa"
  export BASE16_0F_RGB="a04100"
  export BASE16_B08_RGB="b31a29"
  export BASE16_B09_RGB="bb4f05"
  export BASE16_B0A_RGB="edb700"
  export BASE16_B0B_RGB="168530"
  export BASE16_B0C_RGB="1b86ff"
  export BASE16_B0D_RGB="024ca1"
  export BASE16_B0E_RGB="d51287"
  export BASE16_B0F_RGB="783100"
fi
