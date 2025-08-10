#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Nebula
# Scheme author: Gabriel Fontes (https://github.com/Misterio77)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-nebula"

case "base16" in
  base16)
    export BASE16_THEME="nebula"
    ;;
  base24)
    export BASE24_THEME="nebula"
    ;;
  ansi8)
    export ANSI8_THEME="nebula"
    ;;
esac

color00="22/27/3b" # Base 00 - Black
color01="77/7a/bc" # Base 08 - Red
color02="65/62/a8" # Base 0B - Green
color03="4f/90/62" # Base 0A - Yellow
color04="4d/6b/b6" # Base 0D - Blue
color05="71/6c/ae" # Base 0E - Magenta
color06="22/6f/68" # Base 0C - Cyan
color07="a4/a6/a9" # Base 05 - White
color08="6e/6f/72" # Base 03 - Bright Black
color09="99/9b/cd" # Base 12 - Bright Red
color10="8c/89/be" # Base 14 - Bright Green
color11="74/b3/86" # Base 13 - Bright Yellow
color12="7a/90/c8" # Base 16 - Bright Blue
color13="95/91/c2" # Base 17 - Bright Magenta
color14="37/b5/a9" # Base 15 - Bright Cyan
color15="8d/bd/aa" # Base 07 - Bright White
color16="94/92/9e" # Base 09
color17="8c/70/a7" # Base 0F
color18="41/4f/60" # Base 01
color19="5a/83/80" # Base 02
color20="87/88/8b" # Base 04
color21="c7/c9/cd" # Base 06
color_foreground="a4/a6/a9" # Base 05
color_background="22/27/3b" # Base 00


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
  put_template_custom Pg a4a6a9 # foreground
  put_template_custom Ph 22273b # background
  put_template_custom Pi a4a6a9 # bold color
  put_template_custom Pj 5a8380 # selection color
  put_template_custom Pk a4a6a9 # selected text color
  put_template_custom Pl a4a6a9 # cursor
  put_template_custom Pm 22273b # cursor text
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
  export BASE16_00_RGB="22273b"
  export BASE16_01_RGB="414f60"
  export BASE16_02_RGB="5a8380"
  export BASE16_03_RGB="6e6f72"
  export BASE16_04_RGB="87888b"
  export BASE16_05_RGB="a4a6a9"
  export BASE16_06_RGB="c7c9cd"
  export BASE16_07_RGB="8dbdaa"
  export BASE16_08_RGB="777abc"
  export BASE16_09_RGB="94929e"
  export BASE16_0A_RGB="4f9062"
  export BASE16_0B_RGB="6562a8"
  export BASE16_0C_RGB="226f68"
  export BASE16_0D_RGB="4d6bb6"
  export BASE16_0E_RGB="716cae"
  export BASE16_0F_RGB="8c70a7"
  export BASE16_B08_RGB="999bcd"
  export BASE16_B09_RGB="afadb6"
  export BASE16_B0A_RGB="74b386"
  export BASE16_B0B_RGB="8c89be"
  export BASE16_B0C_RGB="37b5a9"
  export BASE16_B0D_RGB="7a90c8"
  export BASE16_B0E_RGB="9591c2"
  export BASE16_B0F_RGB="a994bd"
fi
