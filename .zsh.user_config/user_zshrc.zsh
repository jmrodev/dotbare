# Put your user-specified config here.
#     echo ''
#     echo '              negrok http 80 -expone puerto 80 para development                         '
#     echo '              navi - es un buscador de comandos                                         '
#     echo '              Para activar el menú, pulse tab dos veces.                                '
#     echo '              asciinema rec : graba la terminal -asciinema play : reproduce lo grabado  '
#     echo '              Atrás en historial dir (Alt+Left) - Ir al dir padre (Alt+Up)              '

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi


setopt autocd beep extendedglob nomatch notify pushdignoredups pushdminus autopushd pushdtohome promptsubst interactivecomments hist_ignore_dups completealiases hist_ignore_space ## noflowcontrol  pushdsilent

bindkey -e

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



zstyle ':omz:update' mode auto


autoload -U zargs
autoload -U zmv
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
##unalias run-help
alias help=run-help

    TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

eval "$(atuin init zsh)"
eval $(thefuck --alias)
compdef __start_kubectl k

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


# ^A to open new terminal in current working directory
# Check `logname` so we won't create new terminal as user after `su`.
_open_new_terminal_here(){
    if \
        [ "${XAUTHORITY}" ] && \
        [ "${DISPLAY}" ] && \
        [ "${LOGNAME}" = "$(logname)" ] && \
        command -v konsole >/dev/null 2>&1
    then
        # Spawn terminal with clean login shell.
        env -i \
            XAUTHORITY="${XAUTHORITY}" \
            PATH="${PATH}" \
            HOME="${HOME}" \
            DISPLAY="${DISPLAY}" \
            LOGNAME="${LOGNAME}" \
            SHELL="${SHELL}" \
            LANG="${LANG}" \
            konsole -e "${SHELL}" --login >/dev/null 2>&1 &!
    fi
}
zle -N _open_new_terminal_here
bindkey "^A" _open_new_terminal_here

awk -i inplace '!x[$0]++' ~/.zsh_history
ansiweather -l "Tandil,AR" -u metric -s true -f 5 -d true


