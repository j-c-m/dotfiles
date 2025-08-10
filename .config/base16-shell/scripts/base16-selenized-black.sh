#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: selenized-black
# Scheme author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-selenized-black"

case "base16" in
  base16)
    export BASE16_THEME="selenized-black"
    ;;
  base24)
    export BASE24_THEME="selenized-black"
    ;;
  ansi8)
    export ANSI8_THEME="selenized-black"
    ;;
esac

color00="18/18/18" # Base 00 - Black
color01="ed/4a/46" # Base 08 - Red
color02="70/b4/33" # Base 0B - Green
color03="db/b3/2d" # Base 0A - Yellow
color04="36/8a/eb" # Base 0D - Blue
color05="a5/80/e2" # Base 0E - Magenta
color06="3f/c5/b7" # Base 0C - Cyan
color07="b9/b9/b9" # Base 05 - White
color08="77/77/77" # Base 03 - Bright Black
color09="f2/77/74" # Base 12 - Bright Red
color10="93/d1/5c" # Base 14 - Bright Green
color11="e4/c6/62" # Base 13 - Bright Yellow
color12="68/a7/f0" # Base 16 - Bright Blue
color13="bc/a0/e9" # Base 17 - Bright Magenta
color14="6f/d4/c9" # Base 15 - Bright Cyan
color15="de/de/de" # Base 07 - Bright White
color16="e6/7f/43" # Base 09
color17="eb/6e/b7" # Base 0F
color18="25/25/25" # Base 01
color19="3b/3b/3b" # Base 02
color20="77/77/77" # Base 04
color21="de/de/de" # Base 06
color_foreground="b9/b9/b9" # Base 05
color_background="18/18/18" # Base 00


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
  put_template_custom Pg b9b9b9 # foreground
  put_template_custom Ph 181818 # background
  put_template_custom Pi b9b9b9 # bold color
  put_template_custom Pj 3b3b3b # selection color
  put_template_custom Pk b9b9b9 # selected text color
  put_template_custom Pl b9b9b9 # cursor
  put_template_custom Pm 181818 # cursor text
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
  export BASE16_00_RGB="181818"
  export BASE16_01_RGB="252525"
  export BASE16_02_RGB="3b3b3b"
  export BASE16_03_RGB="777777"
  export BASE16_04_RGB="777777"
  export BASE16_05_RGB="b9b9b9"
  export BASE16_06_RGB="dedede"
  export BASE16_07_RGB="dedede"
  export BASE16_08_RGB="ed4a46"
  export BASE16_09_RGB="e67f43"
  export BASE16_0A_RGB="dbb32d"
  export BASE16_0B_RGB="70b433"
  export BASE16_0C_RGB="3fc5b7"
  export BASE16_0D_RGB="368aeb"
  export BASE16_0E_RGB="a580e2"
  export BASE16_0F_RGB="eb6eb7"
  export BASE16_B08_RGB="f27774"
  export BASE16_B09_RGB="ec9f72"
  export BASE16_B0A_RGB="e4c662"
  export BASE16_B0B_RGB="93d15c"
  export BASE16_B0C_RGB="6fd4c9"
  export BASE16_B0D_RGB="68a7f0"
  export BASE16_B0E_RGB="bca0e9"
  export BASE16_B0F_RGB="f092c9"
fi
