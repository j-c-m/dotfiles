#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Rosé Pine
# Scheme author: Emilia Dunfelt &lt;edun@dunfelt.se&gt;
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-rose-pine"

case "base16" in
  base16)
    export BASE16_THEME="rose-pine"
    ;;
  base24)
    export BASE24_THEME="rose-pine"
    ;;
  ansi8)
    export ANSI8_THEME="rose-pine"
    ;;
esac

color00="19/17/24" # Base 00 - Black
color01="eb/6f/92" # Base 08 - Red
color02="31/74/8f" # Base 0B - Green
color03="eb/bc/ba" # Base 0A - Yellow
color04="c4/a7/e7" # Base 0D - Blue
color05="f6/c1/77" # Base 0E - Magenta
color06="9c/cf/d8" # Base 0C - Cyan
color07="e0/de/f4" # Base 05 - White
color08="6e/6a/86" # Base 03 - Bright Black
color09="f0/93/ad" # Base 12 - Bright Red
color10="4d/a1/c2" # Base 14 - Bright Green
color11="f0/cd/cb" # Base 13 - Bright Yellow
color12="d3/bd/ed" # Base 16 - Bright Blue
color13="f8/d1/99" # Base 17 - Bright Magenta
color14="b5/db/e2" # Base 15 - Bright Cyan
color15="52/4f/67" # Base 07 - Bright White
color16="f6/c1/77" # Base 09
color17="52/4f/67" # Base 0F
color18="1f/1d/2e" # Base 01
color19="26/23/3a" # Base 02
color20="90/8c/aa" # Base 04
color21="e0/de/f4" # Base 06
color_foreground="e0/de/f4" # Base 05
color_background="19/17/24" # Base 00


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
  put_template_custom Pg e0def4 # foreground
  put_template_custom Ph 191724 # background
  put_template_custom Pi e0def4 # bold color
  put_template_custom Pj 26233a # selection color
  put_template_custom Pk e0def4 # selected text color
  put_template_custom Pl e0def4 # cursor
  put_template_custom Pm 191724 # cursor text
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
  export BASE16_00_RGB="191724"
  export BASE16_01_RGB="1f1d2e"
  export BASE16_02_RGB="26233a"
  export BASE16_03_RGB="6e6a86"
  export BASE16_04_RGB="908caa"
  export BASE16_05_RGB="e0def4"
  export BASE16_06_RGB="e0def4"
  export BASE16_07_RGB="524f67"
  export BASE16_08_RGB="eb6f92"
  export BASE16_09_RGB="f6c177"
  export BASE16_0A_RGB="ebbcba"
  export BASE16_0B_RGB="31748f"
  export BASE16_0C_RGB="9ccfd8"
  export BASE16_0D_RGB="c4a7e7"
  export BASE16_0E_RGB="f6c177"
  export BASE16_0F_RGB="524f67"
  export BASE16_B08_RGB="f093ad"
  export BASE16_B09_RGB="f8d199"
  export BASE16_B0A_RGB="f0cdcb"
  export BASE16_B0B_RGB="4da1c2"
  export BASE16_B0C_RGB="b5dbe2"
  export BASE16_B0D_RGB="d3bded"
  export BASE16_B0E_RGB="f8d199"
  export BASE16_B0F_RGB="787494"
fi
