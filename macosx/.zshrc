#env vars

export HOMEBREW_EDITOR=vim
export PATH=/usr/local/bin:/usr/local/sbin:`echo $PATH | sed -E 's/\/usr\/local\/s?bin:?//'`

#private env
if [ -f $HOME/.private_env ]; then
source $HOME/.private_env
fi

#alias
if [ -f $HOME/.cmd_aliases ]; then
source $HOME/.cmd_aliases
fi


#complete
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit
setopt completealiases
zstyle ':completion:*' menu select #菜单选择
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' #修正大小写

#错误校正
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
