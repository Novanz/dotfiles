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

alias gs='git status'
alias gcm='git commit -m'
alias ga='fzf_git_add'
# alias gll='fzf_git_log clean'
# alias glla='fzf_git_log all'
# alias glS='fzf_git_log_pickaxe'
# alias grl='fzf_git_reflog'
alias gu='fzf_git_unadd'

# TODO: Start here

alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
alias open='xdg-open 2>/dev/null'

# dnf
alias srch='dnf search'
alias dnfup='sudo dnf upgrade --refresh'
alias in='sudo dnf install'

# cmd-line tools
alias cat='bat --theme gruvbox-dark'
alias v='nvim'

# dotfiles git-alias
alias cfg='/usr/bin/git --git-dir=/home/nan/.cfg/ --work-tree=/home/nan'

# ls
alias l='eza --no-quotes --color=always --color-scale-mode=fixed --group-directories-first'
alias l1='l --oneline'
alias lc='_f() { ls "$@" | wc -l; }; _f'
alias ll='l --long'
alias lll='ll --changed --total-size --octal-permissions'
alias la='ll --all'
alias lg='ll --git'
alias ll.='ll -d .*'
alias lld='ll -D'
alias lldt='_f() { ll -r --sort=modified -D "$@" | less; }; _f'
alias llfs='find_by_size'
alias lls='_f() { lll -r --sort=size "$@" | less; }; _f'
alias llt='_f() { ll -r --sort=modified "$@" | less; }; _f'
alias ls='ls --color --classify --human-readable --quoting-style=escape'

# tree 
alias t='eza --tree --group-directories-first'
alias td='tree -C -d'
alias tdl='tree -C -d -L'
alias tl='eza --tree --group-directories-first -L'

# other
alias jfl='java -jar ~/opt/JFLAP7.1.jar'
alias scrcp='scrcpy --no-audio -m 1024'
alias vf='fzf_find_edit'
alias cwd='copy_working_directory'
alias fkill='fzf_kill'
# functions
find_by_size() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
    else
        find . -type f -size "$1" -exec eza --long {} \; ;
    fi
}
