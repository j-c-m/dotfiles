#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Purpledream
# Scheme author: malet
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-purpledream"

case "base16" in
  base16)
    export BASE16_THEME="purpledream"
    ;;
  base24)
    export BASE24_THEME="purpledream"
    ;;
  ansi8)
    export ANSI8_THEME="purpledream"
    ;;
esac

color00="10/05/10" # Base 00 - Black
color01="ff/1d/0d" # Base 08 - Red
color02="14/cc/64" # Base 0B - Green
color03="f0/00/a0" # Base 0A - Yellow
color04="00/a0/f0" # Base 0D - Blue
color05="b0/00/d0" # Base 0E - Magenta
color06="00/75/b0" # Base 0C - Cyan
color07="dd/d0/dd" # Base 05 - White
color08="60/50/60" # Base 03 - Bright Black
color09="ff/56/4a" # Base 12 - Bright Red
color10="3c/ec/88" # Base 14 - Bright Green
color11="ff/34/bc" # Base 13 - Bright Yellow
color12="34/bc/ff" # Base 16 - Bright Blue
color13="dc/1c/ff" # Base 17 - Bright Magenta
color14="04/ab/ff" # Base 15 - Bright Cyan
color15="ff/f0/ff" # Base 07 - Bright White
color16="cc/ae/14" # Base 09
color17="6a/2a/3c" # Base 0F
color18="30/20/30" # Base 01
color19="40/30/40" # Base 02
color20="bb/b0/bb" # Base 04
color21="ee/e0/ee" # Base 06
color_foreground="dd/d0/dd" # Base 05
color_background="10/05/10" # Base 00


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
  put_template_custom Pg ddd0dd # foreground
  put_template_custom Ph 100510 # background
  put_template_custom Pi ddd0dd # bold color
  put_template_custom Pj 403040 # selection color
  put_template_custom Pk ddd0dd # selected text color
  put_template_custom Pl ddd0dd # cursor
  put_template_custom Pm 100510 # cursor text
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
  export BASE16_00_RGB="100510"
  export BASE16_01_RGB="302030"
  export BASE16_02_RGB="403040"
  export BASE16_03_RGB="605060"
  export BASE16_04_RGB="bbb0bb"
  export BASE16_05_RGB="ddd0dd"
  export BASE16_06_RGB="eee0ee"
  export BASE16_07_RGB="fff0ff"
  export BASE16_08_RGB="ff1d0d"
  export BASE16_09_RGB="ccae14"
  export BASE16_0A_RGB="f000a0"
  export BASE16_0B_RGB="14cc64"
  export BASE16_0C_RGB="0075b0"
  export BASE16_0D_RGB="00a0f0"
  export BASE16_0E_RGB="b000d0"
  export BASE16_0F_RGB="6a2a3c"
  export BASE16_B08_RGB="ff564a"
  export BASE16_B09_RGB="eccf3c"
  export BASE16_B0A_RGB="ff34bc"
  export BASE16_B0B_RGB="3cec88"
  export BASE16_B0C_RGB="04abff"
  export BASE16_B0D_RGB="34bcff"
  export BASE16_B0E_RGB="dc1cff"
  export BASE16_B0F_RGB="ab4461"
fi
