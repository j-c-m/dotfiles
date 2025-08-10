#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Nord
# Scheme author: arcticicestudio
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-nord"

case "base16" in
  base16)
    export BASE16_THEME="nord"
    ;;
  base24)
    export BASE24_THEME="nord"
    ;;
  ansi8)
    export ANSI8_THEME="nord"
    ;;
esac

color00="2e/34/40" # Base 00 - Black
color01="bf/61/6a" # Base 08 - Red
color02="a3/be/8c" # Base 0B - Green
color03="eb/cb/8b" # Base 0A - Yellow
color04="81/a1/c1" # Base 0D - Blue
color05="b4/8e/ad" # Base 0E - Magenta
color06="88/c0/d0" # Base 0C - Cyan
color07="e5/e9/f0" # Base 05 - White
color08="4c/56/6a" # Base 03 - Bright Black
color09="cf/89/8f" # Base 12 - Bright Red
color10="ba/ce/a9" # Base 14 - Bright Green
color11="f0/d8/a8" # Base 13 - Bright Yellow
color12="a1/b9/d1" # Base 16 - Bright Blue
color13="c7/aa/c2" # Base 17 - Bright Magenta
color14="a6/d0/dc" # Base 15 - Bright Cyan
color15="8f/bc/bb" # Base 07 - Bright White
color16="d0/87/70" # Base 09
color17="5e/81/ac" # Base 0F
color18="3b/42/52" # Base 01
color19="43/4c/5e" # Base 02
color20="d8/de/e9" # Base 04
color21="ec/ef/f4" # Base 06
color_foreground="e5/e9/f0" # Base 05
color_background="2e/34/40" # Base 00


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
  put_template_custom Pg e5e9f0 # foreground
  put_template_custom Ph 2e3440 # background
  put_template_custom Pi e5e9f0 # bold color
  put_template_custom Pj 434c5e # selection color
  put_template_custom Pk e5e9f0 # selected text color
  put_template_custom Pl e5e9f0 # cursor
  put_template_custom Pm 2e3440 # cursor text
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
  export BASE16_00_RGB="2e3440"
  export BASE16_01_RGB="3b4252"
  export BASE16_02_RGB="434c5e"
  export BASE16_03_RGB="4c566a"
  export BASE16_04_RGB="d8dee9"
  export BASE16_05_RGB="e5e9f0"
  export BASE16_06_RGB="eceff4"
  export BASE16_07_RGB="8fbcbb"
  export BASE16_08_RGB="bf616a"
  export BASE16_09_RGB="d08770"
  export BASE16_0A_RGB="ebcb8b"
  export BASE16_0B_RGB="a3be8c"
  export BASE16_0C_RGB="88c0d0"
  export BASE16_0D_RGB="81a1c1"
  export BASE16_0E_RGB="b48ead"
  export BASE16_0F_RGB="5e81ac"
  export BASE16_B08_RGB="cf898f"
  export BASE16_B09_RGB="dca594"
  export BASE16_B0A_RGB="f0d8a8"
  export BASE16_B0B_RGB="bacea9"
  export BASE16_B0C_RGB="a6d0dc"
  export BASE16_B0D_RGB="a1b9d1"
  export BASE16_B0E_RGB="c7aac2"
  export BASE16_B0F_RGB="86a1c1"
fi
