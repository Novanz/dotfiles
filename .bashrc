# .bashrc
. ~/.bash-seafly-prompt/command_prompt.bash
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
# History settings.
HISTCONTROL=ignoreboth:erasedups # Ignore and erase duplicates
HISTFILE=$HOME/.history          # Custom history file
HISTFILESIZE=99999               # Max size of history file
HISTIGNORE=?:??                  # Ignore one and two letter commands
HISTSIZE=99999                   # Amount of history to preserve
# Note, to immediately append to history file refer to the 'prompt'
# function.

# Disable /etc/bashrc_Apple_Terminal Bash sessions on Mac, it does not play
# nice with normal bash history. Also, create a ~/.bash_sessions_disable
# file to be double sure to disable Bash sessions.
export SHELL_SESSION_HISTORY=0

# Enable useful shell options:
#  - autocd - change directory without no need to type 'cd' when changing directory
#  - cdspell - automatically fix directory typos when changing directory
#  - direxpand - automatically expand directory globs when completing
#  - dirspell - automatically fix directory typos when completing
#  - globstar - ** recursive glob
#  - histappend - append to history, don't overwrite
#  - histverify - expand, but don't automatically execute, history expansions
#  - nocaseglob - case-insensitive globbing
#  - no_empty_cmd_completion - do not TAB expand empty lines
shopt -s autocd cdspell direxpand dirspell globstar histappend histverify \
nocaseglob no_empty_cmd_completion 

# Prevent file overwrite on stdout redirection.
# Use `>|` to force redirection to an existing file.
set -o noclobber

# Only logout if 'Control-d' is executed two consecutive times.
export IGNOREEOF=1
