# Find the option for using colors in ls, depending on the version: Linux or BSD
if [[ "$(uname -s)" == "NetBSD" || "$(uname -s)" == "SunOS" ]]; then
  # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors); 
  # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
  gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
elif [[ "$(uname -s)" == "OpenBSD" ]]; then
  # On OpenBSD, test if "colorls" is installed (this one supports colors);
  # otherwise, leave ls as is, because OpenBSD's ls doesn't support -G
  colorls -G -d . &>/dev/null 2>&1 && alias ls='colorls -G'
else
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

if type -p dircolors &> /dev/null;then
    eval `dircolors ~/.zsh/dircolors.256dark`
else
    export LSCOLORS=Exfxcxdxbxegedabagacad
fi
