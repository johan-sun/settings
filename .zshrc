#env vars
export HOMEBREW_GITHUB_API_TOKEN="ha ha, you can not see"
export HOMEBREW_EDITOR=mvim

export PATH=/usr/local/bin:/usr/local/sbin:`echo $PATH | sed -E 's/\/usr\/local\/s?bin:?//'`
#alias
if [ -f .bash_alias ]
then 
source .bash_alias
fi

fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit
setopt completealiases
zstyle ':completion:*' menu select
