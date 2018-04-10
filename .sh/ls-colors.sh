if type -p dircolors &> /dev/null;then
    eval $(dircolors ~/.sh/dircolors.256dark)
elif type -p gdircolors &> /dev/null;then
    eval $(gdircolors ~/.sh/dircolors.256dark)
fi

export LSCOLORS=Exfxcxdxbxegedabagacad

if [[ -n "$LS_COLORS" ]]; then
	if type -p gls &> /dev/null; then
		gls --color -d . &>/dev/null && alias ls='gls --color=tty'
	else
		ls --color -d . &>/dev/null && alias ls='ls --color=tty'
	fi
else
	if type -p colorls &> /dev/null; then
		colorls -G -d . &>/dev/null && alias ls='colorls -G'
	else
		ls -G . &>/dev/null && alias ls='ls -G'
	fi
fi
