#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Equilibrium Gray Light
# Scheme author: Carlo Abelli
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-equilibrium-gray-light"

case "base16" in
  base16)
    export BASE16_THEME="equilibrium-gray-light"
    ;;
  base24)
    export BASE24_THEME="equilibrium-gray-light"
    ;;
  ansi8)
    export ANSI8_THEME="equilibrium-gray-light"
    ;;
esac

color00="f1/f1/f1" # Base 00 - Black
color01="d0/20/23" # Base 08 - Red
color02="63/72/00" # Base 0B - Green
color03="9d/6f/00" # Base 0A - Yellow
color04="00/73/b5" # Base 0D - Blue
color05="4e/66/b6" # Base 0E - Magenta
color06="00/7a/72" # Base 0C - Cyan
color07="47/47/47" # Base 05 - White
color08="77/77/77" # Base 03 - Bright Black
color09="a2/12/14" # Base 12 - Bright Red
color10="4a/56/00" # Base 14 - Bright Green
color11="76/53/00" # Base 13 - Bright Yellow
color12="00/56/88" # Base 16 - Bright Blue
color13="2b/44/98" # Base 17 - Bright Magenta
color14="00/5c/56" # Base 15 - Bright Cyan
color15="1b/1b/1b" # Base 07 - Bright White
color16="bf/3e/05" # Base 09
color17="c4/27/75" # Base 0F
color18="e2/e2/e2" # Base 01
color19="d4/d4/d4" # Base 02
color20="5e/5e/5e" # Base 04
color21="30/30/30" # Base 06
color_foreground="47/47/47" # Base 05
color_background="f1/f1/f1" # Base 00


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
  put_template_custom Pg 474747 # foreground
  put_template_custom Ph f1f1f1 # background
  put_template_custom Pi 474747 # bold color
  put_template_custom Pj d4d4d4 # selection color
  put_template_custom Pk 474747 # selected text color
  put_template_custom Pl 474747 # cursor
  put_template_custom Pm f1f1f1 # cursor text
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
  export BASE16_00_RGB="f1f1f1"
  export BASE16_01_RGB="e2e2e2"
  export BASE16_02_RGB="d4d4d4"
  export BASE16_03_RGB="777777"
  export BASE16_04_RGB="5e5e5e"
  export BASE16_05_RGB="474747"
  export BASE16_06_RGB="303030"
  export BASE16_07_RGB="1b1b1b"
  export BASE16_08_RGB="d02023"
  export BASE16_09_RGB="bf3e05"
  export BASE16_0A_RGB="9d6f00"
  export BASE16_0B_RGB="637200"
  export BASE16_0C_RGB="007a72"
  export BASE16_0D_RGB="0073b5"
  export BASE16_0E_RGB="4e66b6"
  export BASE16_0F_RGB="c42775"
  export BASE16_B08_RGB="a21214"
  export BASE16_B09_RGB="902e03"
  export BASE16_B0A_RGB="765300"
  export BASE16_B0B_RGB="4a5600"
  export BASE16_B0C_RGB="005c56"
  export BASE16_B0D_RGB="005688"
  export BASE16_B0E_RGB="2b4498"
  export BASE16_B0F_RGB="9a1658"
fi
