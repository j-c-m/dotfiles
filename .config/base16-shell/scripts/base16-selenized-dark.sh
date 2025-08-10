#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: selenized-dark
# Scheme author: Jan Warchol (https://github.com/jan-warchol/selenized) / adapted to base16 by ali
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-selenized-dark"

case "base16" in
  base16)
    export BASE16_THEME="selenized-dark"
    ;;
  base24)
    export BASE24_THEME="selenized-dark"
    ;;
  ansi8)
    export ANSI8_THEME="selenized-dark"
    ;;
esac

color00="10/3c/48" # Base 00 - Black
color01="fa/57/50" # Base 08 - Red
color02="75/b9/38" # Base 0B - Green
color03="db/b3/2d" # Base 0A - Yellow
color04="46/95/f7" # Base 0D - Blue
color05="af/88/eb" # Base 0E - Magenta
color06="41/c7/b9" # Base 0C - Cyan
color07="ad/bc/bc" # Base 05 - White
color08="72/89/8f" # Base 03 - Bright Black
color09="fb/81/7c" # Base 12 - Bright Red
color10="97/d0/64" # Base 14 - Bright Green
color11="e4/c6/62" # Base 13 - Bright Yellow
color12="74/b0/f9" # Base 16 - Bright Blue
color13="c3/a6/f0" # Base 17 - Bright Magenta
color14="71/d5/ca" # Base 15 - Bright Cyan
color15="ca/d8/d9" # Base 07 - Bright White
color16="ed/86/49" # Base 09
color17="f2/75/be" # Base 0F
color18="18/49/56" # Base 01
color19="2d/5b/69" # Base 02
color20="72/89/8f" # Base 04
color21="ca/d8/d9" # Base 06
color_foreground="ad/bc/bc" # Base 05
color_background="10/3c/48" # Base 00


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
  put_template_custom Pg adbcbc # foreground
  put_template_custom Ph 103c48 # background
  put_template_custom Pi adbcbc # bold color
  put_template_custom Pj 2d5b69 # selection color
  put_template_custom Pk adbcbc # selected text color
  put_template_custom Pl adbcbc # cursor
  put_template_custom Pm 103c48 # cursor text
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
  export BASE16_00_RGB="103c48"
  export BASE16_01_RGB="184956"
  export BASE16_02_RGB="2d5b69"
  export BASE16_03_RGB="72898f"
  export BASE16_04_RGB="72898f"
  export BASE16_05_RGB="adbcbc"
  export BASE16_06_RGB="cad8d9"
  export BASE16_07_RGB="cad8d9"
  export BASE16_08_RGB="fa5750"
  export BASE16_09_RGB="ed8649"
  export BASE16_0A_RGB="dbb32d"
  export BASE16_0B_RGB="75b938"
  export BASE16_0C_RGB="41c7b9"
  export BASE16_0D_RGB="4695f7"
  export BASE16_0E_RGB="af88eb"
  export BASE16_0F_RGB="f275be"
  export BASE16_B08_RGB="fb817c"
  export BASE16_B09_RGB="f2a477"
  export BASE16_B0A_RGB="e4c662"
  export BASE16_B0B_RGB="97d064"
  export BASE16_B0C_RGB="71d5ca"
  export BASE16_B0D_RGB="74b0f9"
  export BASE16_B0E_RGB="c3a6f0"
  export BASE16_B0F_RGB="f598ce"
fi
