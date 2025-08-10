#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Dark Violet
# Scheme author: ruler501 (https://github.com/ruler501/base16-darkviolet)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-darkviolet"

case "base16" in
  base16)
    export BASE16_THEME="darkviolet"
    ;;
  base24)
    export BASE24_THEME="darkviolet"
    ;;
  ansi8)
    export ANSI8_THEME="darkviolet"
    ;;
esac

color00="00/00/00" # Base 00 - Black
color01="a8/2e/e6" # Base 08 - Red
color02="45/95/e6" # Base 0B - Green
color03="f2/9d/f2" # Base 0A - Yellow
color04="41/36/d9" # Base 0D - Blue
color05="7e/5c/e6" # Base 0E - Magenta
color06="40/df/ff" # Base 0C - Cyan
color07="b0/8a/e6" # Base 05 - White
color08="59/33/80" # Base 03 - Bright Black
color09="be/62/ec" # Base 12 - Bright Red
color10="73/b0/ec" # Base 14 - Bright Green
color11="f5/b6/f5" # Base 13 - Bright Yellow
color12="71/68/e3" # Base 16 - Bright Blue
color13="9e/85/ec" # Base 17 - Bright Magenta
color14="70/e7/ff" # Base 15 - Bright Cyan
color15="a3/66/ff" # Base 07 - Bright White
color16="bb/66/cc" # Base 09
color17="a8/86/bf" # Base 0F
color18="23/1a/40" # Base 01
color19="43/2d/59" # Base 02
color20="00/ff/00" # Base 04
color21="90/45/e6" # Base 06
color_foreground="b0/8a/e6" # Base 05
color_background="00/00/00" # Base 00


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
  put_template_custom Pg b08ae6 # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi b08ae6 # bold color
  put_template_custom Pj 432d59 # selection color
  put_template_custom Pk b08ae6 # selected text color
  put_template_custom Pl b08ae6 # cursor
  put_template_custom Pm 000000 # cursor text
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
  export BASE16_00_RGB="000000"
  export BASE16_01_RGB="231a40"
  export BASE16_02_RGB="432d59"
  export BASE16_03_RGB="593380"
  export BASE16_04_RGB="00ff00"
  export BASE16_05_RGB="b08ae6"
  export BASE16_06_RGB="9045e6"
  export BASE16_07_RGB="a366ff"
  export BASE16_08_RGB="a82ee6"
  export BASE16_09_RGB="bb66cc"
  export BASE16_0A_RGB="f29df2"
  export BASE16_0B_RGB="4595e6"
  export BASE16_0C_RGB="40dfff"
  export BASE16_0D_RGB="4136d9"
  export BASE16_0E_RGB="7e5ce6"
  export BASE16_0F_RGB="a886bf"
  export BASE16_B08_RGB="be62ec"
  export BASE16_B09_RGB="cc8cd9"
  export BASE16_B0A_RGB="f5b6f5"
  export BASE16_B0B_RGB="73b0ec"
  export BASE16_B0C_RGB="70e7ff"
  export BASE16_B0D_RGB="7168e3"
  export BASE16_B0E_RGB="9e85ec"
  export BASE16_B0F_RGB="bea4cf"
fi
