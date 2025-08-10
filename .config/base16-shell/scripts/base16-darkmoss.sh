#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: darkmoss
# Scheme author: Gabriel Avanzi (https://github.com/avanzzzi)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-darkmoss"

case "base16" in
  base16)
    export BASE16_THEME="darkmoss"
    ;;
  base24)
    export BASE24_THEME="darkmoss"
    ;;
  ansi8)
    export ANSI8_THEME="darkmoss"
    ;;
esac

color00="17/1e/1f" # Base 00 - Black
color01="ff/46/58" # Base 08 - Red
color02="49/91/80" # Base 0B - Green
color03="fd/b1/1f" # Base 0A - Yellow
color04="49/80/91" # Base 0D - Blue
color05="9b/c0/c8" # Base 0E - Magenta
color06="66/d9/ef" # Base 0C - Cyan
color07="c7/c7/a5" # Base 05 - White
color08="55/5e/5f" # Base 03 - Bright Black
color09="ff/74/82" # Base 12 - Bright Red
color10="6d/b6/a5" # Base 14 - Bright Green
color11="fd/c5/57" # Base 13 - Bright Yellow
color12="6d/a5/b6" # Base 16 - Bright Blue
color13="b4/d0/d6" # Base 17 - Bright Magenta
color14="8c/e3/f3" # Base 15 - Bright Cyan
color15="e1/ea/ef" # Base 07 - Bright White
color16="e6/db/74" # Base 09
color17="d2/7b/53" # Base 0F
color18="25/2c/2d" # Base 01
color19="37/3c/3d" # Base 02
color20="81/8f/80" # Base 04
color21="e3/e3/c8" # Base 06
color_foreground="c7/c7/a5" # Base 05
color_background="17/1e/1f" # Base 00


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
  put_template_custom Pg c7c7a5 # foreground
  put_template_custom Ph 171e1f # background
  put_template_custom Pi c7c7a5 # bold color
  put_template_custom Pj 373c3d # selection color
  put_template_custom Pk c7c7a5 # selected text color
  put_template_custom Pl c7c7a5 # cursor
  put_template_custom Pm 171e1f # cursor text
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
  export BASE16_00_RGB="171e1f"
  export BASE16_01_RGB="252c2d"
  export BASE16_02_RGB="373c3d"
  export BASE16_03_RGB="555e5f"
  export BASE16_04_RGB="818f80"
  export BASE16_05_RGB="c7c7a5"
  export BASE16_06_RGB="e3e3c8"
  export BASE16_07_RGB="e1eaef"
  export BASE16_08_RGB="ff4658"
  export BASE16_09_RGB="e6db74"
  export BASE16_0A_RGB="fdb11f"
  export BASE16_0B_RGB="499180"
  export BASE16_0C_RGB="66d9ef"
  export BASE16_0D_RGB="498091"
  export BASE16_0E_RGB="9bc0c8"
  export BASE16_0F_RGB="d27b53"
  export BASE16_B08_RGB="ff7482"
  export BASE16_B09_RGB="ece497"
  export BASE16_B0A_RGB="fdc557"
  export BASE16_B0B_RGB="6db6a5"
  export BASE16_B0C_RGB="8ce3f3"
  export BASE16_B0D_RGB="6da5b6"
  export BASE16_B0E_RGB="b4d0d6"
  export BASE16_B0F_RGB="dd9c7e"
fi
