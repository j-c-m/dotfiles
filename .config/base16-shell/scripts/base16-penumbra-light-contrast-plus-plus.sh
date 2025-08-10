#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Penumbra Light Contrast Plus Plus
# Scheme author: Zachary Weiss (https://github.com/zacharyweiss)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-penumbra-light-contrast-plus-plus"

case "base16" in
  base16)
    export BASE16_THEME="penumbra-light-contrast-plus-plus"
    ;;
  base24)
    export BASE24_THEME="penumbra-light-contrast-plus-plus"
    ;;
  ansi8)
    export ANSI8_THEME="penumbra-light-contrast-plus-plus"
    ;;
esac

color00="ff/fd/fb" # Base 00 - Black
color01="f5/8c/81" # Base 08 - Red
color02="54/c7/94" # Base 0B - Green
color03="a9/b8/52" # Base 0A - Yellow
color04="6e/b2/fd" # Base 0D - Blue
color05="b6/9c/f6" # Base 0E - Magenta
color06="00/c4/d7" # Base 0C - Cyan
color07="63/63/63" # Base 05 - White
color08="de/de/de" # Base 03 - Bright Black
color09="f2/3a/26" # Base 12 - Bright Red
color10="27/ad/72" # Base 14 - Bright Green
color11="8b/9c/2c" # Base 13 - Bright Yellow
color12="14/82/fd" # Base 16 - Bright Blue
color13="70/3c/f2" # Base 17 - Bright Magenta
color14="00/93/a1" # Base 15 - Bright Cyan
color15="0d/0f/13" # Base 07 - Bright White
color16="e0/9f/47" # Base 09
color17="e5/8c/c5" # Base 0F
color18="ff/f7/ed" # Base 01
color19="f2/e6/d4" # Base 02
color20="ae/ae/ae" # Base 04
color21="18/1b/1f" # Base 06
color_foreground="63/63/63" # Base 05
color_background="ff/fd/fb" # Base 00


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
  put_template_custom Pg 636363 # foreground
  put_template_custom Ph fffdfb # background
  put_template_custom Pi 636363 # bold color
  put_template_custom Pj f2e6d4 # selection color
  put_template_custom Pk 636363 # selected text color
  put_template_custom Pl 636363 # cursor
  put_template_custom Pm fffdfb # cursor text
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
  export BASE16_00_RGB="fffdfb"
  export BASE16_01_RGB="fff7ed"
  export BASE16_02_RGB="f2e6d4"
  export BASE16_03_RGB="dedede"
  export BASE16_04_RGB="aeaeae"
  export BASE16_05_RGB="636363"
  export BASE16_06_RGB="181b1f"
  export BASE16_07_RGB="0d0f13"
  export BASE16_08_RGB="f58c81"
  export BASE16_09_RGB="e09f47"
  export BASE16_0A_RGB="a9b852"
  export BASE16_0B_RGB="54c794"
  export BASE16_0C_RGB="00c4d7"
  export BASE16_0D_RGB="6eb2fd"
  export BASE16_0E_RGB="b69cf6"
  export BASE16_0F_RGB="e58cc5"
  export BASE16_B08_RGB="f23a26"
  export BASE16_B09_RGB="c57c18"
  export BASE16_B0A_RGB="8b9c2c"
  export BASE16_B0B_RGB="27ad72"
  export BASE16_B0C_RGB="0093a1"
  export BASE16_B0D_RGB="1482fd"
  export BASE16_B0E_RGB="703cf2"
  export BASE16_B0F_RGB="df36a2"
fi
