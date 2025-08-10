#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Seaside
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-seaside"

case "base16" in
  base16)
    export BASE16_THEME="atelier-seaside"
    ;;
  base24)
    export BASE24_THEME="atelier-seaside"
    ;;
  ansi8)
    export ANSI8_THEME="atelier-seaside"
    ;;
esac

color00="13/15/13" # Base 00 - Black
color01="e6/19/3c" # Base 08 - Red
color02="29/a3/29" # Base 0B - Green
color03="98/98/1b" # Base 0A - Yellow
color04="3d/62/f5" # Base 0D - Blue
color05="ad/2b/ee" # Base 0E - Magenta
color06="19/99/b3" # Base 0C - Cyan
color07="8c/a6/8c" # Base 05 - White
color08="68/7d/68" # Base 03 - Bright Black
color09="ec/53/6d" # Base 12 - Bright Red
color10="48/d1/48" # Base 14 - Bright Green
color11="da/da/2c" # Base 13 - Bright Yellow
color12="6e/89/f8" # Base 16 - Bright Blue
color13="c2/60/f2" # Base 17 - Bright Magenta
color14="36/c6/e3" # Base 15 - Bright Cyan
color15="f4/fb/f4" # Base 07 - Bright White
color16="87/71/1d" # Base 09
color17="e6/19/c3" # Base 0F
color18="24/29/24" # Base 01
color19="5e/6e/5e" # Base 02
color20="80/99/80" # Base 04
color21="cf/e8/cf" # Base 06
color_foreground="8c/a6/8c" # Base 05
color_background="13/15/13" # Base 00


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
  put_template_custom Pg 8ca68c # foreground
  put_template_custom Ph 131513 # background
  put_template_custom Pi 8ca68c # bold color
  put_template_custom Pj 5e6e5e # selection color
  put_template_custom Pk 8ca68c # selected text color
  put_template_custom Pl 8ca68c # cursor
  put_template_custom Pm 131513 # cursor text
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
  export BASE16_00_RGB="131513"
  export BASE16_01_RGB="242924"
  export BASE16_02_RGB="5e6e5e"
  export BASE16_03_RGB="687d68"
  export BASE16_04_RGB="809980"
  export BASE16_05_RGB="8ca68c"
  export BASE16_06_RGB="cfe8cf"
  export BASE16_07_RGB="f4fbf4"
  export BASE16_08_RGB="e6193c"
  export BASE16_09_RGB="87711d"
  export BASE16_0A_RGB="98981b"
  export BASE16_0B_RGB="29a329"
  export BASE16_0C_RGB="1999b3"
  export BASE16_0D_RGB="3d62f5"
  export BASE16_0E_RGB="ad2bee"
  export BASE16_0F_RGB="e619c3"
  export BASE16_B08_RGB="ec536d"
  export BASE16_B09_RGB="cead2c"
  export BASE16_B0A_RGB="dada2c"
  export BASE16_B0B_RGB="48d148"
  export BASE16_B0C_RGB="36c6e3"
  export BASE16_B0D_RGB="6e89f8"
  export BASE16_B0E_RGB="c260f2"
  export BASE16_B0F_RGB="ec53d2"
fi
