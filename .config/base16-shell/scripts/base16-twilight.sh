#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Twilight
# Scheme author: David Hart (https://github.com/hartbit)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-twilight"

case "base16" in
  base16)
    export BASE16_THEME="twilight"
    ;;
  base24)
    export BASE24_THEME="twilight"
    ;;
  ansi8)
    export ANSI8_THEME="twilight"
    ;;
esac

color00="1e/1e/1e" # Base 00 - Black
color01="cf/6a/4c" # Base 08 - Red
color02="8f/9d/6a" # Base 0B - Green
color03="f9/ee/98" # Base 0A - Yellow
color04="75/87/a6" # Base 0D - Blue
color05="9b/85/9d" # Base 0E - Magenta
color06="af/c4/db" # Base 0C - Cyan
color07="a7/a7/a7" # Base 05 - White
color08="5f/5a/60" # Base 03 - Bright Black
color09="db/8f/79" # Base 12 - Bright Red
color10="ab/b6/8f" # Base 14 - Bright Green
color11="fb/f2/b2" # Base 13 - Bright Yellow
color12="98/a5/bc" # Base 16 - Bright Blue
color13="b4/a4/b6" # Base 17 - Bright Magenta
color14="c3/d3/e4" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="cd/a8/69" # Base 09
color17="9b/70/3f" # Base 0F
color18="32/35/37" # Base 01
color19="46/4b/50" # Base 02
color20="83/81/84" # Base 04
color21="c3/c3/c3" # Base 06
color_foreground="a7/a7/a7" # Base 05
color_background="1e/1e/1e" # Base 00


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
  put_template_custom Pg a7a7a7 # foreground
  put_template_custom Ph 1e1e1e # background
  put_template_custom Pi a7a7a7 # bold color
  put_template_custom Pj 464b50 # selection color
  put_template_custom Pk a7a7a7 # selected text color
  put_template_custom Pl a7a7a7 # cursor
  put_template_custom Pm 1e1e1e # cursor text
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
  export BASE16_00_RGB="1e1e1e"
  export BASE16_01_RGB="323537"
  export BASE16_02_RGB="464b50"
  export BASE16_03_RGB="5f5a60"
  export BASE16_04_RGB="838184"
  export BASE16_05_RGB="a7a7a7"
  export BASE16_06_RGB="c3c3c3"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="cf6a4c"
  export BASE16_09_RGB="cda869"
  export BASE16_0A_RGB="f9ee98"
  export BASE16_0B_RGB="8f9d6a"
  export BASE16_0C_RGB="afc4db"
  export BASE16_0D_RGB="7587a6"
  export BASE16_0E_RGB="9b859d"
  export BASE16_0F_RGB="9b703f"
  export BASE16_B08_RGB="db8f79"
  export BASE16_B09_RGB="dabe8f"
  export BASE16_B0A_RGB="fbf2b2"
  export BASE16_B0B_RGB="abb68f"
  export BASE16_B0C_RGB="c3d3e4"
  export BASE16_B0D_RGB="98a5bc"
  export BASE16_B0E_RGB="b4a4b6"
  export BASE16_B0F_RGB="c09563"
fi
