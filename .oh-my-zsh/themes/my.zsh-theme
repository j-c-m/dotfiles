# my theme

# if [ $UID -eq 0 ]; then UCOLOR="red"; else UCOLOR="green"; fi
#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# primary prompt
PROMPT='[%{$FG[015]%}%t%{$reset_color%}] %w \
[%{$FG[117]$BG[004]%}%~%{$reset_color%}]:\
%{$FG[252]$BG[004]%}%n@%m%{$reset_color%}
%(!.#.$) '
# right
RPROMPT='$(git_prompt_info)'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[015]$BG[004]%}branch:"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[163]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
