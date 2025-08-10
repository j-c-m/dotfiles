#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Everforest Dark Hard
# Scheme author: Sainnhe Park (https://github.com/sainnhe)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-everforest-dark-hard"

case "base16" in
  base16)
    export BASE16_THEME="everforest-dark-hard"
    ;;
  base24)
    export BASE24_THEME="everforest-dark-hard"
    ;;
  ansi8)
    export ANSI8_THEME="everforest-dark-hard"
    ;;
esac

color00="27/2e/33" # Base 00 - Black
color01="e6/7e/80" # Base 08 - Red
color02="a7/c0/80" # Base 0B - Green
color03="db/bc/7f" # Base 0A - Yellow
color04="7f/bb/b3" # Base 0D - Blue
color05="d6/99/b6" # Base 0E - Magenta
color06="83/c0/92" # Base 0C - Cyan
color07="d3/c6/aa" # Base 05 - White
color08="85/92/89" # Base 03 - Bright Black
color09="ec/9e/a0" # Base 12 - Bright Red
color10="bd/d0/a0" # Base 14 - Bright Green
color11="e4/cd/9f" # Base 13 - Bright Yellow
color12="9f/cc/c6" # Base 16 - Bright Blue
color13="e0/b2/c8" # Base 17 - Bright Magenta
color14="a2/d0/ad" # Base 15 - Bright Cyan
color15="ff/fb/ef" # Base 07 - Bright White
color16="e6/98/75" # Base 09
color17="9d/a9/a0" # Base 0F
color18="2e/38/3c" # Base 01
color19="41/4b/50" # Base 02
color20="9d/a9/a0" # Base 04
color21="ed/ea/da" # Base 06
color_foreground="d3/c6/aa" # Base 05
color_background="27/2e/33" # Base 00


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
  put_template_custom Pg d3c6aa # foreground
  put_template_custom Ph 272e33 # background
  put_template_custom Pi d3c6aa # bold color
  put_template_custom Pj 414b50 # selection color
  put_template_custom Pk d3c6aa # selected text color
  put_template_custom Pl d3c6aa # cursor
  put_template_custom Pm 272e33 # cursor text
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
  export BASE16_00_RGB="272e33"
  export BASE16_01_RGB="2e383c"
  export BASE16_02_RGB="414b50"
  export BASE16_03_RGB="859289"
  export BASE16_04_RGB="9da9a0"
  export BASE16_05_RGB="d3c6aa"
  export BASE16_06_RGB="edeada"
  export BASE16_07_RGB="fffbef"
  export BASE16_08_RGB="e67e80"
  export BASE16_09_RGB="e69875"
  export BASE16_0A_RGB="dbbc7f"
  export BASE16_0B_RGB="a7c080"
  export BASE16_0C_RGB="83c092"
  export BASE16_0D_RGB="7fbbb3"
  export BASE16_0E_RGB="d699b6"
  export BASE16_0F_RGB="9da9a0"
  export BASE16_B08_RGB="ec9ea0"
  export BASE16_B09_RGB="ecb297"
  export BASE16_B0A_RGB="e4cd9f"
  export BASE16_B0B_RGB="bdd0a0"
  export BASE16_B0C_RGB="a2d0ad"
  export BASE16_B0D_RGB="9fccc6"
  export BASE16_B0E_RGB="e0b2c8"
  export BASE16_B0F_RGB="b6bfb8"
fi
