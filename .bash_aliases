# Core utils
alias cp='/bin/cp -iv'
alias mc='_f() { mkdir -p "$@" && command cd "$@"; }; _f'
alias mv='/bin/mv -iv'
alias rm='/bin/rm -i'
alias rmrf='/bin/rm -rf'

# Permisions
alias 664='chmod 664'
alias 775='chmod 775'

# Docker
alias d='docker'
alias dc='docker-compose'

# Git
# TODO: get into the logik of fzf functions and uncomment if needed
# alias g~='cd "$(git rev-parse --show-toplevel)"'
# alias ga='fzf_git_add'
# alias gll='fzf_git_log clean'
# alias glla='fzf_git_log all'
# alias glS='fzf_git_log_pickaxe'
# alias grl='fzf_git_reflog'
# alias gu='fzf_git_unadd'

# TODO: Start here

alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
alias open='xdg-open 2>/dev/null'

# dnf
alias cat='bat --theme gruvbox-dark'
alias srch='dnf search'
alias dnfup='sudo dnf upgrade --refresh'
alias in='sudo dnf install'
alias cfg='/usr/bin/git --git-dir=/home/nan/.cfg/ --work-tree=/home/nan'
alias v='nvim'
alias l='eza --no-quotes --color=always --color-scale-mode=fixed --group-directories-first'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias jfl='java -jar ~/opt/JFLAP7.1.jar'
alias scrcp='scrcpy --no-audio -m 1024'
