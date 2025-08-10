#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Tokyo City Terminal Light
# Scheme author: Michaël Ball
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-tokyo-city-terminal-light"

case "base16" in
  base16)
    export BASE16_THEME="tokyo-city-terminal-light"
    ;;
  base24)
    export BASE24_THEME="tokyo-city-terminal-light"
    ;;
  ansi8)
    export ANSI8_THEME="tokyo-city-terminal-light"
    ;;
esac

color00="fb/fb/fd" # Base 00 - Black
color01="8c/43/51" # Base 08 - Red
color02="33/63/5c" # Base 0B - Green
color03="8f/5e/15" # Base 0A - Yellow
color04="34/54/8a" # Base 0D - Blue
color05="5a/4a/78" # Base 0E - Magenta
color06="0f/4b/6e" # Base 0C - Cyan
color07="28/32/3a" # Base 05 - White
color08="b7/c5/d3" # Base 03 - Bright Black
color09="76/26/35" # Base 12 - Bright Red
color10="1d/54/4c" # Base 14 - Bright Green
color11="6f/47/0c" # Base 13 - Bright Yellow
color12="1d/3d/71" # Base 16 - Bright Blue
color13="3f/2a/68" # Base 17 - Bright Magenta
color14="08/39/55" # Base 15 - Bright Cyan
color15="17/1d/23" # Base 07 - Bright White
color16="96/50/27" # Base 09
color17="7e/51/40" # Base 0F
color18="f6/f6/f8" # Base 01
color19="d8/e2/ec" # Base 02
color20="52/62/70" # Base 04
color21="1d/25/2c" # Base 06
color_foreground="28/32/3a" # Base 05
color_background="fb/fb/fd" # Base 00


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
  put_template_custom Pg 28323a # foreground
  put_template_custom Ph fbfbfd # background
  put_template_custom Pi 28323a # bold color
  put_template_custom Pj d8e2ec # selection color
  put_template_custom Pk 28323a # selected text color
  put_template_custom Pl 28323a # cursor
  put_template_custom Pm fbfbfd # cursor text
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
  export BASE16_00_RGB="fbfbfd"
  export BASE16_01_RGB="f6f6f8"
  export BASE16_02_RGB="d8e2ec"
  export BASE16_03_RGB="b7c5d3"
  export BASE16_04_RGB="526270"
  export BASE16_05_RGB="28323a"
  export BASE16_06_RGB="1d252c"
  export BASE16_07_RGB="171d23"
  export BASE16_08_RGB="8c4351"
  export BASE16_09_RGB="965027"
  export BASE16_0A_RGB="8f5e15"
  export BASE16_0B_RGB="33635c"
  export BASE16_0C_RGB="0f4b6e"
  export BASE16_0D_RGB="34548a"
  export BASE16_0E_RGB="5a4a78"
  export BASE16_0F_RGB="7e5140"
  export BASE16_B08_RGB="762635"
  export BASE16_B09_RGB="783a16"
  export BASE16_B0A_RGB="6f470c"
  export BASE16_B0B_RGB="1d544c"
  export BASE16_B0C_RGB="083955"
  export BASE16_B0D_RGB="1d3d71"
  export BASE16_B0E_RGB="3f2a68"
  export BASE16_B0F_RGB="6a3724"
fi
