  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
#-----------------------------------------------------------------------
zstyle ':omz:update' mode auto
#-----------------------------------------------------------------------
ZSHDDIR="${HOME}/.zsh.user_config"

#-----------------------------------------------------------------------

DIRSTACKFILE="$HOME/.cache/zsh/dirs"

  if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
  fi
    chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
    }

DIRSTACKSIZE=20
#------------------------------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"
#------------------------------------------------------------------------
autoload -Uz compinit promptinit
compinit
promptinit
zstyle :compinstall filename '/home/jmro/.zsh.user_config/completion.zsh'
#------------------------------------------------------------------------
setopt autocd beep extendedglob nomatch notify pushdignoredups pushdminus autopushd pushdsilent pushdtohome extendedGlob promptsubst
#------------------------------------------------------------------------
bindkey -e
#------------------------------------------------------------------------
autoload -U zargs
autoload -U zmv
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
##unalias run-help
alias help=run-help
#------------------------------------------------------------------------
#Para activar el menú, pulse tab dos veces.
setopt completealiases
setopt HIST_IGNORE_DUPS


cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
zle -N                 cdUndoKey
bindkey '^[[1;3A'      cdParentKey
bindkey '^[[1;3D'      cdUndoKey

    TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}
#----------------------------------------------------------------------------------------------
export PATH="/usr/bin:$PATH"
export LANG=es_AR.UTF-8
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/jmro/scripts/

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/jmro/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# export MANPATH="/usr/local/man:$MANPATH"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#-----------------------------------------------------------------------------------------------
source $ZSH/oh-my-zsh.sh
source /usr/share/doc/find-the-command/ftc.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /home/jmro/zaw/zaw.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#------------------------------------------------------------------------------------------------
plugins=(zsh-syntax-highlighting zsh-completions git-flow-completion git fd dotbare
zsh-autosuggestions auto-notify $plugins  colorize  web-search kubectl zsh-navigation-tools)
#------------------------------------------------------------------------------------------------
# User configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

for zshd in $(ls -A ${HOME}/.zsh.user_config/^*.(z)sh$); do
     . "${zshd}"
 done

