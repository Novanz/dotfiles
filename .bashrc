# .bashrc
# Alot of configuration copied from bluz71, see : https://bluz71.github.io/

# Prompt
. ~/.bash-seafly-prompt/command_prompt.bash
# fzf + zoxide
eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"

# Source global definitions

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# AppImages
APP_DIR="$HOME/Applications/"
if [ -d "$APP_DIR" ]; then
  if [[ ":$PATH:" != *":$APP_DIR:"* ]]; then
    export PATH="$APP_DIR:$PATH"
  fi
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

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# General environment variables.
#
export EDITOR=nvim
export LESS='-F -Q -M -R -X -i -g -s -x4 -z-2'
export LESS_TERMCAP_md=$'\e[00;34m'    # bold mode     - blue
export LESS_TERMCAP_us=$'\e[00;32m'    # underline     - green
export LESS_TERMCAP_so=$'\e[00;40;33m' # standout      - yellow on grey
export LESS_TERMCAP_me=$'\e[0m'        # end bold      - reset
export LESS_TERMCAP_ue=$'\e[0m'        # end underline - reset
export LESS_TERMCAP_se=$'\e[0m'        # end standout  - reset
export LESSHISTFILE=-
# LS_COLORS (refer to: https://is.gd/6MzI27)
#   mi - completion options color
#   so - completion matching-prefix color
export LS_COLORS="no=00:fi=00:di=38;5;111:ln=38;5;117:pi=38;5;43:bd=38;5;212:\
cd=38;5;219:or=30;48;5;203:ow=38;5;75:so=38;5;252;48;5;0:su=38;5;168:\
ex=38;5;156:mi=38;5;115:\
*.avi=38;2;175;215;175:*.mpg=38;2;175;215;175:*.mp4=38;2;244;180;180:\
*.epub=38;2;200;200;246:*.dsf=38;2;255;175;215:*.conf=38;2;95;215;175:\
*.astro=38;2;110;222;222:*.md=38;2;213;218;180:*README=38;2;213;218;180:\
*.pdf=38;2;218;218;218"
# EZA_COLORS (refer to: man eza_colors)
# export EZA_COLORS="da=38;5;252:sb=38;5;204:sn=38;5;43:xa=8:\
# uu=38;5;245:un=38;5;241:ur=38;5;223:uw=38;5;223:ux=38;5;223:ue=38;5;223:\
# gr=38;5;153:gw=38;5;153:gx=38;5;153:tr=38;5;175:tw=38;5;175:tx=38;5;175:\
# gm=38;5;203:ga=38;5;203:mp=3;38;5;111:im=38;2;180;150;250:vi=38;2;255;190;148:\
# mu=38;2;255;175;215:lo=38;2;255;215;183:cr=38;2;240;160;240:\
# do=38;2;200;200;246:co=38;2;255;119;153:tm=38;2;148;148;148:\
# cm=38;2;230;150;210:bu=38;2;95;215;175:sc=38;2;110;222;222"
export PAGER=less
export MANPAGER='nvim +Man!'
# History settings.
HISTCONTROL=ignoreboth:erasedups # Ignore and erase duplicates

HISTFILE=$HOME/.history # Custom history file
HISTFILESIZE=99999      # Max size of history file
HISTIGNORE=?:??         # Ignore one and two letter commands
HISTSIZE=99999          # Amount of history to preserve
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

# Functions
# web() gives search prompt for Brave-search
web() {
  GOLD=$(tput setaf 222)
  GREEN=$(tput setaf 79)
  NC=$(tput sgr0)

  read -ep "$(echo -e "${GOLD}Search ${GREEN}➜ ${NC}")" search_term
  if [[ -n "$search_term" ]]; then
    open "https://search.brave.com/search?q=${search_term}" &>/dev/null
  fi
}

# fzf
# git select files to stage
fzf_git_add() {
  local selections=$(
    git ls-files -m -o --exclude-standard |
      fzf --ansi \
        --preview 'if (git ls-files --error-unmatch {1} &>/dev/null); then
                           git diff --color=always {1} | delta
                       else
                           bat --color=always --line-range :500 {1}
                       fi'
  )
  if [[ -n $selections ]]; then
    git add --verbose $selections
  fi
}

# git select files to unstage
fzf_git_unadd() {
  local changes=$(git diff --name-only --cached | fzf --ansi | tr '\n' ' ')
  if [[ -n "$changes" ]]; then
    # git reset HEAD $changes
    git restore --staged $changes
  fi
}

# open fzf file in vim
fzf_find_edit() {
  local file=$(
    fzf --query="$1" --no-multi --select-1 --exit-0 \
      --preview 'bat --color=always --line-range :500 {}'
  )
  if [[ -n "$file" ]]; then
    $EDITOR "$file"
  fi
}

# fzf kill
fzf_kill() {
  if [[ $(uname) == "Linux" ]]; then
    local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $2}')
  elif [[ $(uname) == "Darwin" ]]; then
    local pids=$(ps -f -u $USER | sed 1d | fzf | awk '{print $3}')
  else
    echo 'Error: unknown platform.'
    return
  fi
  if [[ -n "$pids" ]]; then
    echo "$pids" | xargs kill -9 "$@"
  fi
}

# git smart alias
g() {
  if [[ $# -eq 0 ]]; then
    git status -sb
  else
    git "$@"
  fi
}

# copy_working_directory to clipboard
copy_working_directory() {
  if [[ $(uname) == Linux ]]; then
    echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | xclip -selection clipboard -i
  elif [[ $(uname) == Darwin ]]; then
    echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | pbcopy
  fi
  # Also copy current directory to a tmux paste buffer if tmux is active.
  if [[ -n $TMUX ]]; then
    echo -n ${PWD/#$HOME/\~} | tr -d "\r\n" | tmux load-buffer -
  fi
}
# to be able to use docker istead of podman on Fedora 41
# export DOCKER_HOST=unix:///run/docker.sock
