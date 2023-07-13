# Put your user-specified config here.
# Fancy prompt.
# if over_ssh && [ -z "${TMUX}" ]; then
#     prompt_is_ssh='%F{blue}[%F{red}SSH%F{blue}] '
# elif over_ssh; then
#     prompt_is_ssh='%F{blue}[%F{253}SSH%F{blue}] '
# else
#     unset prompt_is_ssh
# fi

case $USER in
    root)
        PROMPT='%B%F{cyan}%m%k %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{blue}%1~${git_prompt}%F{blue} %# %b%f%k'
    ;;

    *)
        PROMPT='%B%F{blue}%n@%m%k %(?..%F{blue}[%F{253}%?%F{blue}] )${prompt_is_ssh}%B%F{cyan}%1~${git_prompt}%F{cyan} %# %b%f%k'

    ;;
esac
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi



    echo ''
    echo '            ****  Alias : ################################################################  ****'
    echo '            ****  bing        brs             google       yahoo         ddg                ****'
    echo '            ****  yandex      github          baidu        ecosia        goodreads          ****'
    echo '            ****  givero      stackoverflow   qwant        wa            sp                 ****'
    echo '            ****  archive     scholar         ask          translate     wiki               ****'
    echo '            ****  news        youtube         map          image         duckynpmhelp       ****'
    echo '            ****  code        red             zshconfig    ohmyzsh       update             ****'
    echo '            ****  myip        distro          reload       server                           ****'
    echo '            ****  ########################################################################  ****'
    echo '            ****  negrok http 80 -expone puerto 80 para development                         ****'
    echo '            ****  navi - es un buscador de comandos                                         ****'
    echo '            ****  Para activar el menú, pulse tab dos veces.                                ****'
    echo '            ****  asciinema rec : graba la terminal -asciinema play : reproduce lo grabado  ****'
    echo '            ****  Atrás en historial dir (Alt+Left) - Ir al dir padre (Alt+Up)              ****'
    echo ''
    echo '            Para saber que alias activos existen escriba :"alias"
'
alias npmhelp='firefox https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm'
alias code='code-insiders --no-sandbox --unity-launch %F'
alias red='nmcli device show'
alias zshconfig='kate ~/.zshrc'
alias ohmyzsh='kate ~/.oh-my-zsh/oh-my-zsh.sh'
alias update='yay -Syyyu --noconfirm'
alias myip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias server='sudo python -m http.server 80'
alias bing='web_search bing'
alias brs='web_search brave'
alias google='web_search google'
alias yahoo='web_search yahoo'
alias ddg='web_search duckduckgo'
alias sp='web_search startpage'
alias yandex='web_search yandex'
alias github='web_search github'
alias baidu='web_search baidu'
alias ecosia='web_search ecosia'
alias goodreads='web_search goodreads'
alias qwant='web_search qwant'
alias givero='web_search givero'
alias stackoverflow='web_search stackoverflow'
alias wa='web_search wolframalpha'
alias archive='web_search archive'
alias scholar='web_search scholar'
alias ask='web_search ask'
alias translate='web_search translate'
alias wiki='web_search duckduckgo \!w'
alias news='web_search duckduckgo \!n'
alias youtube='web_search duckduckgo \!yt'
alias map='web_search duckduckgo \!m'
alias image='web_search duckduckgo \!i'
alias ducky='web_search duckduckgo \!'
alias k=kubectl
alias cp='cp -iv --reflink=auto'
alias rcp='rsync -v --progress'
alias rmv='rsync -v --progress --remove-source-files'
alias mv='mv -iv'
alias rm='rm -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod="chmod -c"
alias chown="chown -c"
alias mkdir="mkdir -v"
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias ls='ls --color=auto --human-readable --group-directories-first --classify'
alias ll='ls --color=auto --human-readable --group-directories-first --classify -l'
alias lla='ls --color=auto --human-readable --group-directories-first --classify -la'

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

alias -s txt=nano
alias -s js=code
alias -s html=code
alias -s json=code



 if [ ! -d "${ZSHDDIR}" ]; then
    mkdir -p "${ZSHDDIR}" && echo "# Put your user-specified config here." > "${ZSHDDIR}/user_zshrc.zsh"
  fi


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

setopt autocd beep extendedglob nomatch notify pushdignoredups pushdminus autopushd pushdsilent pushdtohome extendedGlob promptsubst interactivecomments hist_ignore_dups completealiases hist_ignore_space noflowcontrol
bindkey -e

autoload -Uz compinit promptinit
compinit
promptinit

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

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zstyle :compinstall filename '/home/jmro/.zshrc'
zstyle ':omz:update' mode auto
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

autoload -U zargs
autoload -U zmv
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
##unalias run-help
alias help=run-help


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
##ansiweather -l "Tandil,AR" -u metric -s true -f 5 -d true
