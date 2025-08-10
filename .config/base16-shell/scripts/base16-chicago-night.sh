#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Chicago Night
# Scheme author: Wendell, Ryan &lt;ryanjwendell@gmail.com&gt;
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-chicago-night"

case "base16" in
  base16)
    export BASE16_THEME="chicago-night"
    ;;
  base24)
    export BASE24_THEME="chicago-night"
    ;;
  ansi8)
    export ANSI8_THEME="chicago-night"
    ;;
esac

color00="1e/2a/24" # Base 00 - Black
color01="c6/0c/30" # Base 08 - Red
color02="00/9b/3a" # Base 0B - Green
color03="f9/e3/00" # Base 0A - Yellow
color04="52/23/98" # Base 0D - Blue
color05="e2/7e/a6" # Base 0E - Magenta
color06="00/a1/de" # Base 0C - Cyan
color07="a7/b8/af" # Base 05 - White
color08="5f/73/68" # Base 03 - Bright Black
color09="f2/2b/51" # Base 12 - Bright Red
color10="00/f4/5b" # Base 14 - Bright Green
color11="ff/ee/3b" # Base 13 - Bright Yellow
color12="77/3a/d2" # Base 16 - Bright Blue
color13="e9/9e/bc" # Base 17 - Bright Magenta
color14="27/c4/ff" # Base 15 - Bright Cyan
color15="db/e3/de" # Base 07 - Bright White
color16="f9/46/1c" # Base 09
color17="62/36/1b" # Base 0F
color18="2a/3b/32" # Base 01
color19="36/4c/40" # Base 02
color20="8a/9a/91" # Base 04
color21="c1/cd/c7" # Base 06
color_foreground="a7/b8/af" # Base 05
color_background="1e/2a/24" # Base 00


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
  put_template_custom Pg a7b8af # foreground
  put_template_custom Ph 1e2a24 # background
  put_template_custom Pi a7b8af # bold color
  put_template_custom Pj 364c40 # selection color
  put_template_custom Pk a7b8af # selected text color
  put_template_custom Pl a7b8af # cursor
  put_template_custom Pm 1e2a24 # cursor text
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
  export BASE16_00_RGB="1e2a24"
  export BASE16_01_RGB="2a3b32"
  export BASE16_02_RGB="364c40"
  export BASE16_03_RGB="5f7368"
  export BASE16_04_RGB="8a9a91"
  export BASE16_05_RGB="a7b8af"
  export BASE16_06_RGB="c1cdc7"
  export BASE16_07_RGB="dbe3de"
  export BASE16_08_RGB="c60c30"
  export BASE16_09_RGB="f9461c"
  export BASE16_0A_RGB="f9e300"
  export BASE16_0B_RGB="009b3a"
  export BASE16_0C_RGB="00a1de"
  export BASE16_0D_RGB="522398"
  export BASE16_0E_RGB="e27ea6"
  export BASE16_0F_RGB="62361b"
  export BASE16_B08_RGB="f22b51"
  export BASE16_B09_RGB="fa7455"
  export BASE16_B0A_RGB="ffee3b"
  export BASE16_B0B_RGB="00f45b"
  export BASE16_B0C_RGB="27c4ff"
  export BASE16_B0D_RGB="773ad2"
  export BASE16_B0E_RGB="e99ebc"
  export BASE16_B0F_RGB="ad6030"
fi
