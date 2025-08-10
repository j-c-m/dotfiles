#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Windows 10
# Scheme author: Fergus Collins (https://github.com/ferguscollins)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-windows-10"

case "base16" in
  base16)
    export BASE16_THEME="windows-10"
    ;;
  base24)
    export BASE24_THEME="windows-10"
    ;;
  ansi8)
    export ANSI8_THEME="windows-10"
    ;;
esac

color00="0c/0c/0c" # Base 00 - Black
color01="e7/48/56" # Base 08 - Red
color02="16/c6/0c" # Base 0B - Green
color03="f9/f1/a5" # Base 0A - Yellow
color04="3b/78/ff" # Base 0D - Blue
color05="b4/00/9e" # Base 0E - Magenta
color06="61/d6/d6" # Base 0C - Cyan
color07="cc/cc/cc" # Base 05 - White
color08="76/76/76" # Base 03 - Bright Black
color09="ed/76/80" # Base 12 - Bright Red
color10="36/f2/2b" # Base 14 - Bright Green
color11="fb/f5/bc" # Base 13 - Bright Yellow
color12="6c/9a/ff" # Base 16 - Bright Blue
color13="ff/08/e1" # Base 17 - Bright Magenta
color14="88/e0/e0" # Base 15 - Bright Cyan
color15="f2/f2/f2" # Base 07 - Bright White
color16="c1/9c/00" # Base 09
color17="13/a1/0e" # Base 0F
color18="2f/2f/2f" # Base 01
color19="53/53/53" # Base 02
color20="b9/b9/b9" # Base 04
color21="df/df/df" # Base 06
color_foreground="cc/cc/cc" # Base 05
color_background="0c/0c/0c" # Base 00


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
  put_template_custom Pg cccccc # foreground
  put_template_custom Ph 0c0c0c # background
  put_template_custom Pi cccccc # bold color
  put_template_custom Pj 535353 # selection color
  put_template_custom Pk cccccc # selected text color
  put_template_custom Pl cccccc # cursor
  put_template_custom Pm 0c0c0c # cursor text
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
  export BASE16_00_RGB="0c0c0c"
  export BASE16_01_RGB="2f2f2f"
  export BASE16_02_RGB="535353"
  export BASE16_03_RGB="767676"
  export BASE16_04_RGB="b9b9b9"
  export BASE16_05_RGB="cccccc"
  export BASE16_06_RGB="dfdfdf"
  export BASE16_07_RGB="f2f2f2"
  export BASE16_08_RGB="e74856"
  export BASE16_09_RGB="c19c00"
  export BASE16_0A_RGB="f9f1a5"
  export BASE16_0B_RGB="16c60c"
  export BASE16_0C_RGB="61d6d6"
  export BASE16_0D_RGB="3b78ff"
  export BASE16_0E_RGB="b4009e"
  export BASE16_0F_RGB="13a10e"
  export BASE16_B08_RGB="ed7680"
  export BASE16_B09_RGB="ffd111"
  export BASE16_B0A_RGB="fbf5bc"
  export BASE16_B0B_RGB="36f22b"
  export BASE16_B0C_RGB="88e0e0"
  export BASE16_B0D_RGB="6c9aff"
  export BASE16_B0E_RGB="ff08e1"
  export BASE16_B0F_RGB="1feb18"
fi
