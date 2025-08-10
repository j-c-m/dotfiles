#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Material Vivid
# Scheme author: joshyrobot
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-material-vivid"

case "base16" in
  base16)
    export BASE16_THEME="material-vivid"
    ;;
  base24)
    export BASE24_THEME="material-vivid"
    ;;
  ansi8)
    export ANSI8_THEME="material-vivid"
    ;;
esac

color00="20/21/24" # Base 00 - Black
color01="f4/43/36" # Base 08 - Red
color02="00/e6/76" # Base 0B - Green
color03="ff/eb/3b" # Base 0A - Yellow
color04="21/96/f3" # Base 0D - Blue
color05="67/3a/b7" # Base 0E - Magenta
color06="00/bc/d4" # Base 0C - Cyan
color07="80/86/8b" # Base 05 - White
color08="44/46/4d" # Base 03 - Bright Black
color09="f7/72/68" # Base 12 - Bright Red
color10="2d/ff/99" # Base 14 - Bright Green
color11="ff/f0/6c" # Base 13 - Bright Yellow
color12="59/b0/f6" # Base 16 - Bright Blue
color13="8b/66/ce" # Base 17 - Bright Magenta
color14="20/e6/ff" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="ff/98/00" # Base 09
color17="8d/6e/63" # Base 0F
color18="27/29/2c" # Base 01
color19="32/36/39" # Base 02
color20="67/6c/71" # Base 04
color21="9e/9e/9e" # Base 06
color_foreground="80/86/8b" # Base 05
color_background="20/21/24" # Base 00


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
  put_template_custom Pg 80868b # foreground
  put_template_custom Ph 202124 # background
  put_template_custom Pi 80868b # bold color
  put_template_custom Pj 323639 # selection color
  put_template_custom Pk 80868b # selected text color
  put_template_custom Pl 80868b # cursor
  put_template_custom Pm 202124 # cursor text
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
  export BASE16_00_RGB="202124"
  export BASE16_01_RGB="27292c"
  export BASE16_02_RGB="323639"
  export BASE16_03_RGB="44464d"
  export BASE16_04_RGB="676c71"
  export BASE16_05_RGB="80868b"
  export BASE16_06_RGB="9e9e9e"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="f44336"
  export BASE16_09_RGB="ff9800"
  export BASE16_0A_RGB="ffeb3b"
  export BASE16_0B_RGB="00e676"
  export BASE16_0C_RGB="00bcd4"
  export BASE16_0D_RGB="2196f3"
  export BASE16_0E_RGB="673ab7"
  export BASE16_0F_RGB="8d6e63"
  export BASE16_B08_RGB="f77268"
  export BASE16_B09_RGB="ffb240"
  export BASE16_B0A_RGB="fff06c"
  export BASE16_B0B_RGB="2dff99"
  export BASE16_B0C_RGB="20e6ff"
  export BASE16_B0D_RGB="59b0f6"
  export BASE16_B0E_RGB="8b66ce"
  export BASE16_B0F_RGB="ab9188"
fi
