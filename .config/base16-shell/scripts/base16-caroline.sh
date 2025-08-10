#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: caroline
# Scheme author: ed (https://codeberg.org/ed)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-caroline"

case "base16" in
  base16)
    export BASE16_THEME="caroline"
    ;;
  base24)
    export BASE24_THEME="caroline"
    ;;
  ansi8)
    export ANSI8_THEME="caroline"
    ;;
esac

color00="1c/12/13" # Base 00 - Black
color01="c2/4f/57" # Base 08 - Red
color02="80/6c/61" # Base 0B - Green
color03="f2/81/71" # Base 0A - Yellow
color04="68/4c/59" # Base 0D - Blue
color05="a6/36/50" # Base 0E - Magenta
color06="6b/65/66" # Base 0C - Cyan
color07="a8/75/69" # Base 05 - White
color08="6d/47/45" # Base 03 - Bright Black
color09="d1/7b/81" # Base 12 - Bright Red
color10="a3/90/85" # Base 14 - Bright Green
color11="f5/a1/95" # Base 13 - Bright Yellow
color12="97/70/82" # Base 16 - Bright Blue
color13="ca/5b/75" # Base 17 - Bright Magenta
color14="91/8a/8c" # Base 15 - Bright Cyan
color15="e3/a6/8c" # Base 07 - Bright White
color16="a6/36/50" # Base 09
color17="89/3f/45" # Base 0F
color18="3a/24/25" # Base 01
color19="56/38/37" # Base 02
color20="8b/5d/57" # Base 04
color21="c5/8d/7b" # Base 06
color_foreground="a8/75/69" # Base 05
color_background="1c/12/13" # Base 00


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
  put_template_custom Pg a87569 # foreground
  put_template_custom Ph 1c1213 # background
  put_template_custom Pi a87569 # bold color
  put_template_custom Pj 563837 # selection color
  put_template_custom Pk a87569 # selected text color
  put_template_custom Pl a87569 # cursor
  put_template_custom Pm 1c1213 # cursor text
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
  export BASE16_00_RGB="1c1213"
  export BASE16_01_RGB="3a2425"
  export BASE16_02_RGB="563837"
  export BASE16_03_RGB="6d4745"
  export BASE16_04_RGB="8b5d57"
  export BASE16_05_RGB="a87569"
  export BASE16_06_RGB="c58d7b"
  export BASE16_07_RGB="e3a68c"
  export BASE16_08_RGB="c24f57"
  export BASE16_09_RGB="a63650"
  export BASE16_0A_RGB="f28171"
  export BASE16_0B_RGB="806c61"
  export BASE16_0C_RGB="6b6566"
  export BASE16_0D_RGB="684c59"
  export BASE16_0E_RGB="a63650"
  export BASE16_0F_RGB="893f45"
  export BASE16_B08_RGB="d17b81"
  export BASE16_B09_RGB="ca5b75"
  export BASE16_B0A_RGB="f5a195"
  export BASE16_B0B_RGB="a39085"
  export BASE16_B0C_RGB="918a8c"
  export BASE16_B0D_RGB="977082"
  export BASE16_B0E_RGB="ca5b75"
  export BASE16_B0F_RGB="b66067"
fi
