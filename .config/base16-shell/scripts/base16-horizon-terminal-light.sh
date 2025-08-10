#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Horizon Terminal Light
# Scheme author: Michaël Ball (http://github.com/michael-ball/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-horizon-terminal-light"

case "base16" in
  base16)
    export BASE16_THEME="horizon-terminal-light"
    ;;
  base24)
    export BASE24_THEME="horizon-terminal-light"
    ;;
  ansi8)
    export ANSI8_THEME="horizon-terminal-light"
    ;;
esac

color00="fd/f0/ed" # Base 00 - Black
color01="e9/56/78" # Base 08 - Red
color02="29/d3/98" # Base 0B - Green
color03="fa/da/d1" # Base 0A - Yellow
color04="26/bb/d9" # Base 0D - Blue
color05="ee/64/ac" # Base 0E - Magenta
color06="59/e1/e3" # Base 0C - Cyan
color07="40/3c/3d" # Base 05 - White
color08="bd/b3/b1" # Base 03 - Bright Black
color09="db/15/42" # Base 12 - Bright Red
color10="17/a6/74" # Base 14 - Bright Green
color11="f3/84/65" # Base 13 - Bright Yellow
color12="15/91/aa" # Base 16 - Bright Blue
color13="eb/13/83" # Base 17 - Bright Magenta
color14="1a/d1/d3" # Base 15 - Bright Cyan
color15="20/1c/1d" # Base 07 - Bright White
color16="f9/ce/c3" # Base 09
color17="f9/cb/be" # Base 0F
color18="fa/da/d1" # Base 01
color19="f9/cb/be" # Base 02
color20="94/8c/8a" # Base 04
color21="30/2c/2d" # Base 06
color_foreground="40/3c/3d" # Base 05
color_background="fd/f0/ed" # Base 00


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
  put_template_custom Pg 403c3d # foreground
  put_template_custom Ph fdf0ed # background
  put_template_custom Pi 403c3d # bold color
  put_template_custom Pj f9cbbe # selection color
  put_template_custom Pk 403c3d # selected text color
  put_template_custom Pl 403c3d # cursor
  put_template_custom Pm fdf0ed # cursor text
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
  export BASE16_00_RGB="fdf0ed"
  export BASE16_01_RGB="fadad1"
  export BASE16_02_RGB="f9cbbe"
  export BASE16_03_RGB="bdb3b1"
  export BASE16_04_RGB="948c8a"
  export BASE16_05_RGB="403c3d"
  export BASE16_06_RGB="302c2d"
  export BASE16_07_RGB="201c1d"
  export BASE16_08_RGB="e95678"
  export BASE16_09_RGB="f9cec3"
  export BASE16_0A_RGB="fadad1"
  export BASE16_0B_RGB="29d398"
  export BASE16_0C_RGB="59e1e3"
  export BASE16_0D_RGB="26bbd9"
  export BASE16_0E_RGB="ee64ac"
  export BASE16_0F_RGB="f9cbbe"
  export BASE16_B08_RGB="db1542"
  export BASE16_B09_RGB="f3795a"
  export BASE16_B0A_RGB="f38465"
  export BASE16_B0B_RGB="17a674"
  export BASE16_B0C_RGB="1ad1d3"
  export BASE16_B0D_RGB="1591aa"
  export BASE16_B0E_RGB="eb1383"
  export BASE16_B0F_RGB="f47856"
fi
