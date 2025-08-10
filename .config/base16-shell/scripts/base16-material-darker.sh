#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Material Darker
# Scheme author: Nate Peterson
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-material-darker"

case "base16" in
  base16)
    export BASE16_THEME="material-darker"
    ;;
  base24)
    export BASE24_THEME="material-darker"
    ;;
  ansi8)
    export ANSI8_THEME="material-darker"
    ;;
esac

color00="21/21/21" # Base 00 - Black
color01="f0/71/78" # Base 08 - Red
color02="c3/e8/8d" # Base 0B - Green
color03="ff/cb/6b" # Base 0A - Yellow
color04="82/aa/ff" # Base 0D - Blue
color05="c7/92/ea" # Base 0E - Magenta
color06="89/dd/ff" # Base 0C - Cyan
color07="ee/ff/ff" # Base 05 - White
color08="4a/4a/4a" # Base 03 - Bright Black
color09="f4/94/9a" # Base 12 - Bright Red
color10="d2/ee/aa" # Base 14 - Bright Green
color11="ff/d8/90" # Base 13 - Bright Yellow
color12="a1/bf/ff" # Base 16 - Bright Blue
color13="d5/ad/ef" # Base 17 - Bright Magenta
color14="a7/e6/ff" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="f7/8c/6c" # Base 09
color17="ff/53/70" # Base 0F
color18="30/30/30" # Base 01
color19="35/35/35" # Base 02
color20="b2/cc/d6" # Base 04
color21="ee/ff/ff" # Base 06
color_foreground="ee/ff/ff" # Base 05
color_background="21/21/21" # Base 00


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
  put_template_custom Pg eeffff # foreground
  put_template_custom Ph 212121 # background
  put_template_custom Pi eeffff # bold color
  put_template_custom Pj 353535 # selection color
  put_template_custom Pk eeffff # selected text color
  put_template_custom Pl eeffff # cursor
  put_template_custom Pm 212121 # cursor text
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
  export BASE16_00_RGB="212121"
  export BASE16_01_RGB="303030"
  export BASE16_02_RGB="353535"
  export BASE16_03_RGB="4a4a4a"
  export BASE16_04_RGB="b2ccd6"
  export BASE16_05_RGB="eeffff"
  export BASE16_06_RGB="eeffff"
  export BASE16_07_RGB="ffffff"
  export BASE16_08_RGB="f07178"
  export BASE16_09_RGB="f78c6c"
  export BASE16_0A_RGB="ffcb6b"
  export BASE16_0B_RGB="c3e88d"
  export BASE16_0C_RGB="89ddff"
  export BASE16_0D_RGB="82aaff"
  export BASE16_0E_RGB="c792ea"
  export BASE16_0F_RGB="ff5370"
  export BASE16_B08_RGB="f4949a"
  export BASE16_B09_RGB="f9a991"
  export BASE16_B0A_RGB="ffd890"
  export BASE16_B0B_RGB="d2eeaa"
  export BASE16_B0C_RGB="a7e6ff"
  export BASE16_B0D_RGB="a1bfff"
  export BASE16_B0E_RGB="d5adef"
  export BASE16_B0F_RGB="ff7e94"
fi
