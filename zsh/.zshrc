# Starship 提示符
eval "$(starship init zsh)"

# 加载插件
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 启用 Zsh 补全
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
# 自动加载历史搜索功能
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# 实用别名
alias ls='ls --color=auto'
alias l='ls -lh'
alias ll='ls -lAh'
alias la='ls -A'

# Git 别名
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gs='git status'
alias gd='git diff'

# 开发别名
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias h='history'

# 设置历史文件路径
HISTFILE=$HOME/.zsh_history

# 设置历史文件中保存的命令数量
SAVEHIST=100000000

# 设置当前会话可以记住的命令数量
HISTSIZE=100000000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS

bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end

# cargo rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo:$PATH"
export PATH="$HOME/.rustup:$PATH"

export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

# uv
export UV_INDEX_URL="https://mirrors.ustc.edu.cn/pypi/simple"

# uv python install
# export UV_PYTHON_INSTALL_MIRROR="https://github.com/astral-sh/python-build-standalone/releases/download"
# export UV_PYTHON_INSTALL_MIRROR="https://mirror.nju.edu.cn/github-release/indygreg/python-build-standalone/"
export UV_PYTHON_INSTALL_MIRROR="https://ghfast.top/https://github.com/astral-sh/python-build-standalone/releases/download"
export PYTHON_BUILD_MIRROR_URL="https://registry.npmmirror.com/-/binary/python"

# android ndk home
export ANDROID_NDK_HOME="/home/dylan/workspace/tools/android-ndk-r29"

# volta
export VOLTA_HOME="$HOME/.volta/"
export PATH="$VOLTA_HOME/bin:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/dylan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/dylan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

# fvm dart and flutter 管理器
export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PATH=$PATH:~/fvm/default/bin
