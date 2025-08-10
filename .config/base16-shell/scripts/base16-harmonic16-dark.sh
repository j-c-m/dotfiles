#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Harmonic16 Dark
# Scheme author: Jannik Siebert (https://github.com/janniks)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-harmonic16-dark"

case "base16" in
  base16)
    export BASE16_THEME="harmonic16-dark"
    ;;
  base24)
    export BASE24_THEME="harmonic16-dark"
    ;;
  ansi8)
    export ANSI8_THEME="harmonic16-dark"
    ;;
esac

color00="0b/1c/2c" # Base 00 - Black
color01="bf/8b/56" # Base 08 - Red
color02="56/bf/8b" # Base 0B - Green
color03="8b/bf/56" # Base 0A - Yellow
color04="8b/56/bf" # Base 0D - Blue
color05="bf/56/8b" # Base 0E - Magenta
color06="56/8b/bf" # Base 0C - Cyan
color07="cb/d6/e2" # Base 05 - White
color08="62/7e/99" # Base 03 - Bright Black
color09="cf/a8/80" # Base 12 - Bright Red
color10="80/cf/a8" # Base 14 - Bright Green
color11="a8/cf/80" # Base 13 - Bright Yellow
color12="a8/80/cf" # Base 16 - Bright Blue
color13="cf/80/a8" # Base 17 - Bright Magenta
color14="80/a8/cf" # Base 15 - Bright Cyan
color15="f7/f9/fb" # Base 07 - Bright White
color16="bf/bf/56" # Base 09
color17="bf/56/56" # Base 0F
color18="22/3b/54" # Base 01
color19="40/5c/79" # Base 02
color20="aa/bc/ce" # Base 04
color21="e5/eb/f1" # Base 06
color_foreground="cb/d6/e2" # Base 05
color_background="0b/1c/2c" # Base 00


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
  put_template_custom Pg cbd6e2 # foreground
  put_template_custom Ph 0b1c2c # background
  put_template_custom Pi cbd6e2 # bold color
  put_template_custom Pj 405c79 # selection color
  put_template_custom Pk cbd6e2 # selected text color
  put_template_custom Pl cbd6e2 # cursor
  put_template_custom Pm 0b1c2c # cursor text
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
  export BASE16_00_RGB="0b1c2c"
  export BASE16_01_RGB="223b54"
  export BASE16_02_RGB="405c79"
  export BASE16_03_RGB="627e99"
  export BASE16_04_RGB="aabcce"
  export BASE16_05_RGB="cbd6e2"
  export BASE16_06_RGB="e5ebf1"
  export BASE16_07_RGB="f7f9fb"
  export BASE16_08_RGB="bf8b56"
  export BASE16_09_RGB="bfbf56"
  export BASE16_0A_RGB="8bbf56"
  export BASE16_0B_RGB="56bf8b"
  export BASE16_0C_RGB="568bbf"
  export BASE16_0D_RGB="8b56bf"
  export BASE16_0E_RGB="bf568b"
  export BASE16_0F_RGB="bf5656"
  export BASE16_B08_RGB="cfa880"
  export BASE16_B09_RGB="cfcf80"
  export BASE16_B0A_RGB="a8cf80"
  export BASE16_B0B_RGB="80cfa8"
  export BASE16_B0C_RGB="80a8cf"
  export BASE16_B0D_RGB="a880cf"
  export BASE16_B0E_RGB="cf80a8"
  export BASE16_B0F_RGB="cf8080"
fi
