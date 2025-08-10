#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Gruvbox dark
# Scheme author: Tinted Theming (https://github.com/tinted-theming), morhetz (https://github.com/morhetz/gruvbox)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-gruvbox-dark"

case "base16" in
  base16)
    export BASE16_THEME="gruvbox-dark"
    ;;
  base24)
    export BASE24_THEME="gruvbox-dark"
    ;;
  ansi8)
    export ANSI8_THEME="gruvbox-dark"
    ;;
esac

color00="28/28/28" # Base 00 - Black
color01="cc/24/1d" # Base 08 - Red
color02="98/97/1a" # Base 0B - Green
color03="d7/99/21" # Base 0A - Yellow
color04="45/85/88" # Base 0D - Blue
color05="b1/62/86" # Base 0E - Magenta
color06="68/9d/6a" # Base 0C - Cyan
color07="eb/db/b2" # Base 05 - White
color08="66/5c/54" # Base 03 - Bright Black
color09="e5/4f/49" # Base 12 - Bright Red
color10="db/d9/2a" # Base 14 - Bright Green
color11="e5/b4/55" # Base 13 - Bright Yellow
color12="67/af/b2" # Base 16 - Bright Blue
color13="c5/89/a4" # Base 17 - Bright Magenta
color14="8e/b6/8f" # Base 15 - Bright Cyan
color15="f9/f5/d7" # Base 07 - Bright White
color16="d6/5d/0e" # Base 09
color17="9d/00/06" # Base 0F
color18="3c/38/36" # Base 01
color19="50/49/45" # Base 02
color20="92/83/74" # Base 04
color21="fb/f1/c7" # Base 06
color_foreground="eb/db/b2" # Base 05
color_background="28/28/28" # Base 00


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
  put_template_custom Pg ebdbb2 # foreground
  put_template_custom Ph 282828 # background
  put_template_custom Pi ebdbb2 # bold color
  put_template_custom Pj 504945 # selection color
  put_template_custom Pk ebdbb2 # selected text color
  put_template_custom Pl ebdbb2 # cursor
  put_template_custom Pm 282828 # cursor text
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
  export BASE16_00_RGB="282828"
  export BASE16_01_RGB="3c3836"
  export BASE16_02_RGB="504945"
  export BASE16_03_RGB="665c54"
  export BASE16_04_RGB="928374"
  export BASE16_05_RGB="ebdbb2"
  export BASE16_06_RGB="fbf1c7"
  export BASE16_07_RGB="f9f5d7"
  export BASE16_08_RGB="cc241d"
  export BASE16_09_RGB="d65d0e"
  export BASE16_0A_RGB="d79921"
  export BASE16_0B_RGB="98971a"
  export BASE16_0C_RGB="689d6a"
  export BASE16_0D_RGB="458588"
  export BASE16_0E_RGB="b16286"
  export BASE16_0F_RGB="9d0006"
  export BASE16_B08_RGB="e54f49"
  export BASE16_B09_RGB="f28238"
  export BASE16_B0A_RGB="e5b455"
  export BASE16_B0B_RGB="dbd92a"
  export BASE16_B0C_RGB="8eb68f"
  export BASE16_B0D_RGB="67afb2"
  export BASE16_B0E_RGB="c589a4"
  export BASE16_B0F_RGB="f50009"
fi
