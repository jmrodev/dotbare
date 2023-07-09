  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi


  if [ ! -d "${ZSHDDIR}" ]; then
    mkdir -p "${ZSHDDIR}" && echo "# Put your user-specified config here." > "${ZSHDDIR}/user_zshrc.zsh"
  fi


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

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
  
  if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
  fi
    chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
    }

DIRSTACKSIZE=20
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd/mm/yyyy"

setopt autocd beep extendedglob nomatch notify pushdignoredups pushdminus autopushd pushdsilent pushdtohome extendedGlob promptsubst
bindkey -e

zstyle :compinstall filename '/home/jmro/.zshrc'
zstyle ':omz:update' mode auto
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true

autoload -U zargs
autoload -U zmv
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help

autoload -Uz compinit promptinit
compinit
promptinit
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

    echo ''
    echo ''
    echo '            ####################################################################################'
    echo '            ****  clone()         --> Clona y almacena en '$HOME'/code                   ****'
    echo '            ****  configura()     --> Editar archivos configuración apps más usadas         ****'
    echo '            ****  laranew()       --> Crea un nuevo repositorio Laravel (¡NO TERMINADA!)    ****'
    echo '            ****  localip()       --> Retorna la dirección IP local                         ****'
    echo '            ****  macaddr()       --> Retorna la MAC Address local                          ****'
    echo '            ****  pathadd()       --> Agrega la ruta enviada al PATH                        ****'
    echo '            ****  phpserver()     --> Monta un servidor PHP localmente                      ****'
    echo '            ****  publicip()      --> Retorna la dirección IP pública                       ****'
    echo '            ****  zshstats()      --> Muestra los 20 comandos más usados                    ****'
    echo '            ****  find_man()      --> "find_man 'app' 'palabra' = Busca'palabra' en 'app'           ****'
    echo '            ****  scanner()       --> Escanea puertos abiertos en la maquina local          ****'
    echo '            ****  extractPorts()  --> primero :nmap -p- --open -T5 -v -n ip -oG allPorts    ****'
    echo '            ****  -Extrae nmap informacion en un archivo                                    ****' 
    echo '            ****  fzf-lovely()    --> fzf file manager                                      ****'
    echo '            ****  backuApps()     --> Guarda en dos archivos lista de app instaladas        ****'
    echo '            ****  backupDots()    --> Backup de dots en github                              ****' 
    echo '            ****  appsPreview()   --> Preview de software instalado                         ****'    
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
    echo '            #################################################################################### '
    echo '            Alias : '
    echo '            bing            brs             google            yahoo             ddg           '             
    echo '            yandex          github          baidu             ecosia            goodreads     '   
    echo '            givero          stackoverflow   qwant             wa                sp            '
    echo '            archive         scholar         ask               translate         wiki          '
    echo '            news            youtube         map               image             duckynpmhelp  '
    echo '            code            red             zshconfig         ohmyzsh           update        '    
    echo '            myip            distro          reload            server                          '
    echo '            #################################################################################### '
    echo '            El programa "navi " es un buscador de comandos - Para activar el menú, pulse tab dos veces.'
    echo '            asciinema rec : graba la terminal -asciinema play : reproduce lo grabado - '
    echo '            Ir hacia atrás en el historial de directorios (Alt+Left) - Ir hacia el directorio padre (Alt+Up) '

    echo '            ####################################################################################'
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

alias -s txt=nano
alias -s js=code
alias -s html=code
alias -s json=code

export PATH="/usr/bin:$PATH"
export LANG=es_AR.UTF-8
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/jmro/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# export MANPATH="/usr/local/man:$MANPATH"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

source $ZSH/oh-my-zsh.sh
source /usr/share/doc/find-the-command/ftc.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /home/jmro/zaw/zaw.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(zsh-syntax-highlighting zsh-completions git-flow-completion git fd dotbare
zsh-autosuggestions auto-notify $plugins  colorize  web-search kubectl zsh-navigation-tools)

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(atuin init zsh)"
eval $(thefuck --alias)
compdef __start_kubectl k

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

## functions

function pastebinit() {
    curl -F c=@- https://ptpb.pw < $1
}

function publicip() {
    curl ipinfo.io/ip
}

function macaddr() {
    ip -o link show enp4s0 | sed 's/.*ether \(\S*\).*/\1/g'
}

function localip() {
    ip -o addr show enp4s0 | head -n 1 | sed 's/.*inet \(\S*\)\/.*/\1/g'
}

function pathadd() {
    [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+"$PATH:"}$1"
}

function clone() {
  case "$1" in
    */*)
      target=$HOME/code/$1
      mkdir -p "$(dirname "$target")"
      git clone "git@github.com:$1" "$target"
      cd "$target"
      ;;
  esac
}

function laranew() {
	httpdir=/srv/http/
	echo "Creando nuevo proyecto Laravel: $1"
	mkdir $1
	cd $1
	echo "$2" > index.html
	cd ..
	sudo mv $1 $httpdir
}

function phpserver() {
  local port="${1:-4000}";
  local ip=$(ip route get 1.2.3.4 | awk '{print $7}');
  sleep 1 && xdg-open "http://${ip}:${port}/" &
  php -S "${ip}:${port}";
}

function zshstats() {
  fc -l 1 |
  awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' |
  grep -v "./" |
  column -c3 -s " " -t |
  sort -nr |
  nl |
  head -n20
}

configura() {
  case $1 in
    alias)   micro ~/.aliases ;;
    funcs)   micro ~/.funcs ;;
    zsh)     micro ~/.zshrc ;;
    ayuda)   echo 'configura <archivo>\n'
             echo 'Configuraciones disponibles: alias; funcs; zsh'
             echo '' ;;
    *)       echo "Aplicación desconocida: $1" ;;
  esac
}

function scanner(){
sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn 127.0.0.1 -oG allport

}

function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

function manColor() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

find_man() {
    man $1 | grep -- $2
}

function appsPreview(){
pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'

}

function backupDots(){
  pacman -Qqm > pkglist-aur.txt
  pacman -Qqe > pkglist.txt
  dotbare commit -a -m "ultimo backup"
  dotbare push -u origin main
}

function backupApps(){
  pacman -Qqm > pkglist-aur.txt
  pacman -Qqe > pkglist.txt
}

function reload(){
  exec "${SHELL}" "$@"
 # source ~/.zshrc
}

awk -i inplace '!x[$0]++' ~/.zsh_history
ansiweather -l "Tandil,AR" -u metric -s true -f 5 -d true
