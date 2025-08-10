#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Spacemacs
# Scheme author: Nasser Alshammari (https://github.com/nashamri/spacemacs-theme)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-spacemacs"

case "base16" in
  base16)
    export BASE16_THEME="spacemacs"
    ;;
  base24)
    export BASE24_THEME="spacemacs"
    ;;
  ansi8)
    export ANSI8_THEME="spacemacs"
    ;;
esac

color00="1f/20/22" # Base 00 - Black
color01="f2/24/1f" # Base 08 - Red
color02="67/b1/1d" # Base 0B - Green
color03="b1/95/1d" # Base 0A - Yellow
color04="4f/97/d7" # Base 0D - Blue
color05="a3/1d/b1" # Base 0E - Magenta
color06="2d/95/74" # Base 0C - Cyan
color07="a3/a3/a3" # Base 05 - White
color08="58/58/58" # Base 03 - Bright Black
color09="f5/5b/57" # Base 12 - Bright Red
color10="8d/df/3b" # Base 14 - Bright Green
color11="df/c0/3b" # Base 13 - Bright Yellow
color12="7b/b1/e1" # Base 16 - Bright Blue
color13="cf/3b/df" # Base 17 - Bright Magenta
color14="49/c8/a0" # Base 15 - Bright Cyan
color15="f8/f8/f8" # Base 07 - Bright White
color16="ff/a5/00" # Base 09
color17="b0/30/60" # Base 0F
color18="28/28/28" # Base 01
color19="44/41/55" # Base 02
color20="b8/b8/b8" # Base 04
color21="e8/e8/e8" # Base 06
color_foreground="a3/a3/a3" # Base 05
color_background="1f/20/22" # Base 00


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
  put_template_custom Pg a3a3a3 # foreground
  put_template_custom Ph 1f2022 # background
  put_template_custom Pi a3a3a3 # bold color
  put_template_custom Pj 444155 # selection color
  put_template_custom Pk a3a3a3 # selected text color
  put_template_custom Pl a3a3a3 # cursor
  put_template_custom Pm 1f2022 # cursor text
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
  export BASE16_00_RGB="1f2022"
  export BASE16_01_RGB="282828"
  export BASE16_02_RGB="444155"
  export BASE16_03_RGB="585858"
  export BASE16_04_RGB="b8b8b8"
  export BASE16_05_RGB="a3a3a3"
  export BASE16_06_RGB="e8e8e8"
  export BASE16_07_RGB="f8f8f8"
  export BASE16_08_RGB="f2241f"
  export BASE16_09_RGB="ffa500"
  export BASE16_0A_RGB="b1951d"
  export BASE16_0B_RGB="67b11d"
  export BASE16_0C_RGB="2d9574"
  export BASE16_0D_RGB="4f97d7"
  export BASE16_0E_RGB="a31db1"
  export BASE16_0F_RGB="b03060"
  export BASE16_B08_RGB="f55b57"
  export BASE16_B09_RGB="ffbc40"
  export BASE16_B0A_RGB="dfc03b"
  export BASE16_B0B_RGB="8ddf3b"
  export BASE16_B0C_RGB="49c8a0"
  export BASE16_B0D_RGB="7bb1e1"
  export BASE16_B0E_RGB="cf3bdf"
  export BASE16_B0F_RGB="d15684"
fi
