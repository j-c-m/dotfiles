#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Mountain
# Scheme author: gnsfujiwara (https://github.com/gnsfujiwara)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-mountain"

case "base16" in
  base16)
    export BASE16_THEME="mountain"
    ;;
  base24)
    export BASE24_THEME="mountain"
    ;;
  ansi8)
    export ANSI8_THEME="mountain"
    ;;
esac

color00="0f/0f/0f" # Base 00 - Black
color01="ac/8a/8c" # Base 08 - Red
color02="8a/ac/8b" # Base 0B - Green
color03="ac/a9/8a" # Base 0A - Yellow
color04="8f/8a/ac" # Base 0D - Blue
color05="ac/8a/ac" # Base 0E - Magenta
color06="8a/ab/ac" # Base 0C - Cyan
color07="ca/ca/ca" # Base 05 - White
color08="39/39/39" # Base 03 - Bright Black
color09="c1/a7/a9" # Base 12 - Bright Red
color10="a7/c1/a8" # Base 14 - Bright Green
color11="c1/bf/a7" # Base 13 - Bright Yellow
color12="ab/a7/c1" # Base 16 - Bright Blue
color13="c1/a7/c1" # Base 17 - Bright Magenta
color14="a7/c0/c1" # Base 15 - Bright Cyan
color15="f0/f0/f0" # Base 07 - Bright White
color16="ce/b1/88" # Base 09
color17="ac/8a/8c" # Base 0F
color18="19/19/19" # Base 01
color19="26/26/26" # Base 02
color20="4c/4c/4c" # Base 04
color21="e7/e7/e7" # Base 06
color_foreground="ca/ca/ca" # Base 05
color_background="0f/0f/0f" # Base 00


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
  put_template_custom Pg cacaca # foreground
  put_template_custom Ph 0f0f0f # background
  put_template_custom Pi cacaca # bold color
  put_template_custom Pj 262626 # selection color
  put_template_custom Pk cacaca # selected text color
  put_template_custom Pl cacaca # cursor
  put_template_custom Pm 0f0f0f # cursor text
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
  export BASE16_00_RGB="0f0f0f"
  export BASE16_01_RGB="191919"
  export BASE16_02_RGB="262626"
  export BASE16_03_RGB="393939"
  export BASE16_04_RGB="4c4c4c"
  export BASE16_05_RGB="cacaca"
  export BASE16_06_RGB="e7e7e7"
  export BASE16_07_RGB="f0f0f0"
  export BASE16_08_RGB="ac8a8c"
  export BASE16_09_RGB="ceb188"
  export BASE16_0A_RGB="aca98a"
  export BASE16_0B_RGB="8aac8b"
  export BASE16_0C_RGB="8aabac"
  export BASE16_0D_RGB="8f8aac"
  export BASE16_0E_RGB="ac8aac"
  export BASE16_0F_RGB="ac8a8c"
  export BASE16_B08_RGB="c1a7a9"
  export BASE16_B09_RGB="dac5a6"
  export BASE16_B0A_RGB="c1bfa7"
  export BASE16_B0B_RGB="a7c1a8"
  export BASE16_B0C_RGB="a7c0c1"
  export BASE16_B0D_RGB="aba7c1"
  export BASE16_B0E_RGB="c1a7c1"
  export BASE16_B0F_RGB="c1a7a9"
fi
