setopt PROMPT_SUBST

# primary prompt (standard color)
PROMPT='[%{$fg_bold[blue]%}%D{%F %T}%{$reset_color%}] \
%{$fg_bold[cyan]$bg[blue]%}%~$(git_echo_prompt)%{$reset_color%}:\
%(!.%{$fg[red]%}.%{$fg[white]%})%{$bg[blue]%}%n@%m%{$reset_color%}
%(!.#.$) '

# right
RPROMPT=

# git settings
GIT_PROMPT_PREFIX=":"
GIT_PROMPT_CLEAN=
GIT_PROMPT_DIRTY="%{$fg_no_bold[red]%}*"
GIT_PROMPT_SUFFIX=

