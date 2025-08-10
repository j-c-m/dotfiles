#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Ashes
# Scheme author: Jannik Siebert (https://github.com/janniks)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-ashes"

case "base16" in
  base16)
    export BASE16_THEME="ashes"
    ;;
  base24)
    export BASE24_THEME="ashes"
    ;;
  ansi8)
    export ANSI8_THEME="ashes"
    ;;
esac

color00="1c/20/23" # Base 00 - Black
color01="c7/ae/95" # Base 08 - Red
color02="95/c7/ae" # Base 0B - Green
color03="ae/c7/95" # Base 0A - Yellow
color04="ae/95/c7" # Base 0D - Blue
color05="c7/95/ae" # Base 0E - Magenta
color06="95/ae/c7" # Base 0C - Cyan
color07="c7/cc/d1" # Base 05 - White
color08="74/7c/84" # Base 03 - Bright Black
color09="d5/c2/b0" # Base 12 - Bright Red
color10="b0/d5/c2" # Base 14 - Bright Green
color11="c2/d5/b0" # Base 13 - Bright Yellow
color12="c2/b0/d5" # Base 16 - Bright Blue
color13="d5/b0/c2" # Base 17 - Bright Magenta
color14="b0/c2/d5" # Base 15 - Bright Cyan
color15="f3/f4/f5" # Base 07 - Bright White
color16="c7/c7/95" # Base 09
color17="c7/95/95" # Base 0F
color18="39/3f/45" # Base 01
color19="56/5e/65" # Base 02
color20="ad/b3/ba" # Base 04
color21="df/e2/e5" # Base 06
color_foreground="c7/cc/d1" # Base 05
color_background="1c/20/23" # Base 00


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
  put_template_custom Pg c7ccd1 # foreground
  put_template_custom Ph 1c2023 # background
  put_template_custom Pi c7ccd1 # bold color
  put_template_custom Pj 565e65 # selection color
  put_template_custom Pk c7ccd1 # selected text color
  put_template_custom Pl c7ccd1 # cursor
  put_template_custom Pm 1c2023 # cursor text
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
  export BASE16_00_RGB="1c2023"
  export BASE16_01_RGB="393f45"
  export BASE16_02_RGB="565e65"
  export BASE16_03_RGB="747c84"
  export BASE16_04_RGB="adb3ba"
  export BASE16_05_RGB="c7ccd1"
  export BASE16_06_RGB="dfe2e5"
  export BASE16_07_RGB="f3f4f5"
  export BASE16_08_RGB="c7ae95"
  export BASE16_09_RGB="c7c795"
  export BASE16_0A_RGB="aec795"
  export BASE16_0B_RGB="95c7ae"
  export BASE16_0C_RGB="95aec7"
  export BASE16_0D_RGB="ae95c7"
  export BASE16_0E_RGB="c795ae"
  export BASE16_0F_RGB="c79595"
  export BASE16_B08_RGB="d5c2b0"
  export BASE16_B09_RGB="d5d5b0"
  export BASE16_B0A_RGB="c2d5b0"
  export BASE16_B0B_RGB="b0d5c2"
  export BASE16_B0C_RGB="b0c2d5"
  export BASE16_B0D_RGB="c2b0d5"
  export BASE16_B0E_RGB="d5b0c2"
  export BASE16_B0F_RGB="d5b0b0"
fi
