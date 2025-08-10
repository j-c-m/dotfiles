#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Horizon Terminal Dark
# Scheme author: Michaël Ball (http://github.com/michael-ball/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-horizon-terminal-dark"

case "base16" in
  base16)
    export BASE16_THEME="horizon-terminal-dark"
    ;;
  base24)
    export BASE24_THEME="horizon-terminal-dark"
    ;;
  ansi8)
    export ANSI8_THEME="horizon-terminal-dark"
    ;;
esac

color00="1c/1e/26" # Base 00 - Black
color01="e9/56/78" # Base 08 - Red
color02="29/d3/98" # Base 0B - Green
color03="fa/c2/9a" # Base 0A - Yellow
color04="26/bb/d9" # Base 0D - Blue
color05="ee/64/ac" # Base 0E - Magenta
color06="59/e1/e3" # Base 0C - Cyan
color07="cb/ce/d0" # Base 05 - White
color08="6f/6f/70" # Base 03 - Bright Black
color09="ef/80/9a" # Base 12 - Bright Red
color10="5d/e0/b2" # Base 14 - Bright Green
color11="fb/d1/b3" # Base 13 - Bright Yellow
color12="5c/cc/e3" # Base 16 - Bright Blue
color13="f2/8b/c1" # Base 17 - Bright Magenta
color14="82/e9/ea" # Base 15 - Bright Cyan
color15="e3/e6/ee" # Base 07 - Bright White
color16="fa/b7/95" # Base 09
color17="f0/93/83" # Base 0F
color18="23/25/30" # Base 01
color19="2e/30/3e" # Base 02
color20="9d/a0/a2" # Base 04
color21="dc/df/e4" # Base 06
color_foreground="cb/ce/d0" # Base 05
color_background="1c/1e/26" # Base 00


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
  put_template_custom Pg cbced0 # foreground
  put_template_custom Ph 1c1e26 # background
  put_template_custom Pi cbced0 # bold color
  put_template_custom Pj 2e303e # selection color
  put_template_custom Pk cbced0 # selected text color
  put_template_custom Pl cbced0 # cursor
  put_template_custom Pm 1c1e26 # cursor text
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
  export BASE16_00_RGB="1c1e26"
  export BASE16_01_RGB="232530"
  export BASE16_02_RGB="2e303e"
  export BASE16_03_RGB="6f6f70"
  export BASE16_04_RGB="9da0a2"
  export BASE16_05_RGB="cbced0"
  export BASE16_06_RGB="dcdfe4"
  export BASE16_07_RGB="e3e6ee"
  export BASE16_08_RGB="e95678"
  export BASE16_09_RGB="fab795"
  export BASE16_0A_RGB="fac29a"
  export BASE16_0B_RGB="29d398"
  export BASE16_0C_RGB="59e1e3"
  export BASE16_0D_RGB="26bbd9"
  export BASE16_0E_RGB="ee64ac"
  export BASE16_0F_RGB="f09383"
  export BASE16_B08_RGB="ef809a"
  export BASE16_B09_RGB="fbc9af"
  export BASE16_B0A_RGB="fbd1b3"
  export BASE16_B0B_RGB="5de0b2"
  export BASE16_B0C_RGB="82e9ea"
  export BASE16_B0D_RGB="5ccce3"
  export BASE16_B0E_RGB="f28bc1"
  export BASE16_B0F_RGB="f4aea2"
fi
