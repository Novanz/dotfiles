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
alias dx='docker exec'
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
alias cat='bat --theme OneHalfDark'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'

# dotfiles git-alias
alias cfg='/usr/bin/git --git-dir=/home/nan/.cfg/ --work-tree=/home/nan'

# ls
# Basic, colorized, directories first
alias l='ls --color=auto --group-directories-first -F'
# One line per entry
alias l1='l -1'
# Count entries in directory
alias lc='_f() { ls -A "$@" | wc -l; }; _f'
# Long listing, human readable
alias ll='l -lh'
# Long listing, show octal permissions, total size, and sort by time changed
alias lll='ll -l --time=ctime --block-size=1 --numeric-uid-gid'
# Long listing, show all files (including dotfiles)
alias la='ll -a'
# Placeholder: need eza
alias lg='echo "No ls equivalent for --git"'
# List only dotfiles in long format
alias ll.='ll -d .??*'
# List only directories in long format
alias lld='ll -d */'
# List directories in long format, sorted by modified time, reversed, paginated
alias lldt='_f() { ll -ltrd */ | less; }; _f'
# Need eza to work with find_by_size
alias llfs='find_by_size'
# Long listing, sorted by size, reversed, paginated
alias lls='_f() { ll -lSr | less; }; _f'
# Long listing, sorted by time modified, reversed, paginated
alias llt='_f() { ll -ltr | less; }; _f'
# Default ls with color, classify, human-readable, escape quoting
alias ls='ls --color=auto -F -h --quoting-style=escape'

# tree
# Tree view, directories first (tree doesn't have group-directories-first, but close)
alias t='tree -C'
# Tree view, directories only
alias td='tree -C -d'
# Tree view, directories only, depth limit
alias tdl='tree -C -d -L' # Usage: tdl <depth>
# Tree view, depth limit
alias tl='tree -C -L' # Usage: tl <depth>

# ssh
alias sst="-t -- /bin/sh -c 'tmux has-session && exec tmux attach || exec tmux'"
alias s="kitten ssh"
alias rm-nmlab='ssh rm-nmlab-main'
# alias nspki='ssh -t -p 2222 nan@127.0.0.1 "tmux attach || tmux new"'
alias vm-nspki='ssh vm-nspki-main'
alias rm-rag='ssh rm-rag-main'
alias rm-ragh='ssh rm-ragh-main'

# tmux
alias tmls='tmux ls'

# wireguard
alias hfuup='wg-quick up wg-hfu'
alias hfudown='wg-quick down wg-hfu'

# other
alias scrcp='scrcpy --no-audio -m 1024'
alias vf='fzf_find_edit'
alias cwd='copy_working_directory'
alias fkill='fzf_kill'

# functions
find_by_size() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: llfs <size> (e.g. 100k, +1M, +1G)"
  else
    find . -type f -size "$1" -exec eza --long {} \;
  fi
}
