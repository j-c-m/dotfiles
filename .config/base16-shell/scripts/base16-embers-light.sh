#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Embers Light
# Scheme author: Jannik Siebert (https://github.com/janniks)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-embers-light"

case "base16" in
  base16)
    export BASE16_THEME="embers-light"
    ;;
  base24)
    export BASE24_THEME="embers-light"
    ;;
  ansi8)
    export ANSI8_THEME="embers-light"
    ;;
esac

color00="d1/d6/db" # Base 00 - Black
color01="57/6d/82" # Base 08 - Red
color02="6d/82/57" # Base 0B - Green
color03="57/82/6d" # Base 0A - Yellow
color04="82/57/6d" # Base 0D - Blue
color05="6d/57/82" # Base 0E - Magenta
color06="82/6d/57" # Base 0C - Cyan
color07="32/3b/43" # Base 05 - White
color08="75/80/8a" # Base 03 - Bright Black
color09="31/52/72" # Base 12 - Bright Red
color10="52/72/31" # Base 14 - Bright Green
color11="31/72/52" # Base 13 - Bright Yellow
color12="72/31/52" # Base 16 - Bright Blue
color13="52/31/72" # Base 17 - Bright Magenta
color14="72/52/31" # Base 15 - Bright Cyan
color15="0f/13/16" # Base 07 - Bright White
color16="57/82/82" # Base 09
color17="57/57/82" # Base 0F
color18="ae/b6/be" # Base 01
color19="90/9a/a3" # Base 02
color20="47/50/5a" # Base 04
color21="20/26/2c" # Base 06
color_foreground="32/3b/43" # Base 05
color_background="d1/d6/db" # Base 00


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
  put_template_custom Pg 323b43 # foreground
  put_template_custom Ph d1d6db # background
  put_template_custom Pi 323b43 # bold color
  put_template_custom Pj 909aa3 # selection color
  put_template_custom Pk 323b43 # selected text color
  put_template_custom Pl 323b43 # cursor
  put_template_custom Pm d1d6db # cursor text
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
  export BASE16_00_RGB="d1d6db"
  export BASE16_01_RGB="aeb6be"
  export BASE16_02_RGB="909aa3"
  export BASE16_03_RGB="75808a"
  export BASE16_04_RGB="47505a"
  export BASE16_05_RGB="323b43"
  export BASE16_06_RGB="20262c"
  export BASE16_07_RGB="0f1316"
  export BASE16_08_RGB="576d82"
  export BASE16_09_RGB="578282"
  export BASE16_0A_RGB="57826d"
  export BASE16_0B_RGB="6d8257"
  export BASE16_0C_RGB="826d57"
  export BASE16_0D_RGB="82576d"
  export BASE16_0E_RGB="6d5782"
  export BASE16_0F_RGB="575782"
  export BASE16_B08_RGB="315272"
  export BASE16_B09_RGB="317272"
  export BASE16_B0A_RGB="317252"
  export BASE16_B0B_RGB="527231"
  export BASE16_B0C_RGB="725231"
  export BASE16_B0D_RGB="723152"
  export BASE16_B0E_RGB="523172"
  export BASE16_B0F_RGB="313172"
fi
