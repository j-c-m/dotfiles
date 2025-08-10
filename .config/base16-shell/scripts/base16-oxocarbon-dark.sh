#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Oxocarbon Dark
# Scheme author: shaunsingh/IBM
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-oxocarbon-dark"

case "base16" in
  base16)
    export BASE16_THEME="oxocarbon-dark"
    ;;
  base24)
    export BASE24_THEME="oxocarbon-dark"
    ;;
  ansi8)
    export ANSI8_THEME="oxocarbon-dark"
    ;;
esac

color00="16/16/16" # Base 00 - Black
color01="3d/db/d9" # Base 08 - Red
color02="33/b1/ff" # Base 0B - Green
color03="ee/53/96" # Base 0A - Yellow
color04="42/be/65" # Base 0D - Blue
color05="be/95/ff" # Base 0E - Magenta
color06="ff/7e/b6" # Base 0C - Cyan
color07="f2/f4/f8" # Base 05 - White
color08="52/52/52" # Base 03 - Bright Black
color09="6e/e4/e3" # Base 12 - Bright Red
color10="66/c5/ff" # Base 14 - Bright Green
color11="f2/7e/b0" # Base 13 - Bright Yellow
color12="71/ce/8c" # Base 16 - Bright Blue
color13="ce/b0/ff" # Base 17 - Bright Magenta
color14="ff/9e/c8" # Base 15 - Bright Cyan
color15="08/bd/ba" # Base 07 - Bright White
color16="78/a9/ff" # Base 09
color17="82/cf/ff" # Base 0F
color18="26/26/26" # Base 01
color19="39/39/39" # Base 02
color20="dd/e1/e6" # Base 04
color21="ff/ff/ff" # Base 06
color_foreground="f2/f4/f8" # Base 05
color_background="16/16/16" # Base 00


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
  put_template_custom Pg f2f4f8 # foreground
  put_template_custom Ph 161616 # background
  put_template_custom Pi f2f4f8 # bold color
  put_template_custom Pj 393939 # selection color
  put_template_custom Pk f2f4f8 # selected text color
  put_template_custom Pl f2f4f8 # cursor
  put_template_custom Pm 161616 # cursor text
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
  export BASE16_00_RGB="161616"
  export BASE16_01_RGB="262626"
  export BASE16_02_RGB="393939"
  export BASE16_03_RGB="525252"
  export BASE16_04_RGB="dde1e6"
  export BASE16_05_RGB="f2f4f8"
  export BASE16_06_RGB="ffffff"
  export BASE16_07_RGB="08bdba"
  export BASE16_08_RGB="3ddbd9"
  export BASE16_09_RGB="78a9ff"
  export BASE16_0A_RGB="ee5396"
  export BASE16_0B_RGB="33b1ff"
  export BASE16_0C_RGB="ff7eb6"
  export BASE16_0D_RGB="42be65"
  export BASE16_0E_RGB="be95ff"
  export BASE16_0F_RGB="82cfff"
  export BASE16_B08_RGB="6ee4e3"
  export BASE16_B09_RGB="9abfff"
  export BASE16_B0A_RGB="f27eb0"
  export BASE16_B0B_RGB="66c5ff"
  export BASE16_B0C_RGB="ff9ec8"
  export BASE16_B0D_RGB="71ce8c"
  export BASE16_B0E_RGB="ceb0ff"
  export BASE16_B0F_RGB="a1dbff"
fi
