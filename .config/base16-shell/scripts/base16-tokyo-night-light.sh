#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Tokyo Night Light
# Scheme author: Michaël Ball
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-tokyo-night-light"

case "base16" in
  base16)
    export BASE16_THEME="tokyo-night-light"
    ;;
  base24)
    export BASE24_THEME="tokyo-night-light"
    ;;
  ansi8)
    export ANSI8_THEME="tokyo-night-light"
    ;;
esac

color00="d5/d6/db" # Base 00 - Black
color01="34/3b/58" # Base 08 - Red
color02="48/5e/30" # Base 0B - Green
color03="16/67/75" # Base 0A - Yellow
color04="34/54/8a" # Base 0D - Blue
color05="5a/4a/78" # Base 0E - Magenta
color06="3e/69/68" # Base 0C - Cyan
color07="34/3b/59" # Base 05 - White
color08="96/99/a3" # Base 03 - Bright Black
color09="1d/26/4c" # Base 12 - Bright Red
color10="36/4f/1b" # Base 14 - Bright Green
color11="0c/50/5c" # Base 13 - Bright Yellow
color12="1d/3d/71" # Base 16 - Bright Blue
color13="3f/2a/68" # Base 17 - Bright Magenta
color14="23/5a/59" # Base 15 - Bright Cyan
color15="1a/1b/26" # Base 07 - Bright White
color16="96/50/27" # Base 09
color17="8c/43/51" # Base 0F
color18="cb/cc/d1" # Base 01
color19="df/e0/e5" # Base 02
color20="4c/50/5e" # Base 04
color21="1a/1b/26" # Base 06
color_foreground="34/3b/59" # Base 05
color_background="d5/d6/db" # Base 00


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
  put_template_custom Pg 343b59 # foreground
  put_template_custom Ph d5d6db # background
  put_template_custom Pi 343b59 # bold color
  put_template_custom Pj dfe0e5 # selection color
  put_template_custom Pk 343b59 # selected text color
  put_template_custom Pl 343b59 # cursor
  put_template_custom Pm d5d6db # cursor text
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
  export BASE16_00_RGB="d5d6db"
  export BASE16_01_RGB="cbccd1"
  export BASE16_02_RGB="dfe0e5"
  export BASE16_03_RGB="9699a3"
  export BASE16_04_RGB="4c505e"
  export BASE16_05_RGB="343b59"
  export BASE16_06_RGB="1a1b26"
  export BASE16_07_RGB="1a1b26"
  export BASE16_08_RGB="343b58"
  export BASE16_09_RGB="965027"
  export BASE16_0A_RGB="166775"
  export BASE16_0B_RGB="485e30"
  export BASE16_0C_RGB="3e6968"
  export BASE16_0D_RGB="34548a"
  export BASE16_0E_RGB="5a4a78"
  export BASE16_0F_RGB="8c4351"
  export BASE16_B08_RGB="1d264c"
  export BASE16_B09_RGB="783a16"
  export BASE16_B0A_RGB="0c505c"
  export BASE16_B0B_RGB="364f1b"
  export BASE16_B0C_RGB="235a59"
  export BASE16_B0D_RGB="1d3d71"
  export BASE16_B0E_RGB="3f2a68"
  export BASE16_B0F_RGB="762635"
fi
