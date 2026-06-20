HISTFILE=~/.bash_history
HISTSIZE=100000
HISTFILESIZE=100000
HISTTIMEFORMAT='%F %T '

# ignore consecutive dups; don't save commands prefixed with a space
HISTCONTROL=ignoredups:ignorespace

shopt -s histappend
shopt -s histverify

# append after each command and pick up history from other sessions
__sync_history() {
    history -a
    history -n
}
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }__sync_history"