#env vars
export HOMEBREW_GITHUB_API_TOKEN=43931fe91d77d58335368ef6cc187235c0caf468
export HOMEBREW_EDITOR=vim

export PATH=/usr/local/bin:/usr/local/sbin:`echo $PATH | sed -E 's/\/usr\/local\/s?bin:?//'`
#alias
if [ -f ~/.bash_alias ]
then 
source ~/.bash_alias
fi

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
