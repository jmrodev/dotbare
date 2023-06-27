# alternativas para saber ip publica:
# curl ipinfo.io/ip
# curl ifconfig.me
# curl bot.whatismyipaddress.com
# dig +short myip.opendns.com @resolver1.opendns.com
# curl checkip.dyndns.org
# curl ident.me
# host myip.opendns.com resolver1.opendns.com
# curl ipecho.net/plain

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Habilitar el aviso instantáneo PowerLevel10k. 
# Debe permanecer cerca de la parte superior de ~/.zshrc. 
# Código de inicialización que puede requerir entrada de consola (indicaciones de contraseña, [y/n] 
# Confirmaciones, etc.) debe ir por encima de este bloque; Todo lo demás puede ir debajo.


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi    
    
#     Prompts
# Existe una forma rápida y fácil de establecer un prompt con colores en Zsh.
# Asegúrese que el prompt está establecido para autocargarse en .zshrc. 
# Esto puede hacerse añadiendo las siguientes líneas:
#
# ~/.zshrc
# autoload -U promptinit
# promptinit
# Prompts disponibles se pueden lista ejecutando el comando:
#
# $ prompt -l
# Por ejemplo, Para usar el prompt walters, introduzca:
#
# $ prompt walters
# Para previsualizar los temas disponibles, use el comando:
#
# $ prompt -p


#   Zsh puede configurarse para recordar los DIRSTACKSIZE últimos directorio visitados.
#   Esto puede usarse para hacer cd a ellos rápidamente. 
#   Tiene que añadir algunas lineas a su archivo de configuración:



DIRSTACKFILE="$HOME/.cache/zsh/dirs"
  
  if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
  fi
    chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
    }

DIRSTACKSIZE=20

  
#Para activar el menú, pulse tab dos veces.
zstyle ':completion:*' menu select
setopt completealiases
setopt HIST_IGNORE_DUPS
awk -i inplace '!x[$0]++' ~/.zsh_history


# [[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
# [[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward
# Haciendo esto, solo comandos anteriores que comiencen con la entrada actual se mostrarán.


# Asociar combinaciones de teclas con aplicaciones ncurses
# Puede asociarse una aplicación ncurses a una combinación de teclas, pero no aceptará interacciones. Use la variable BUFFER para que funcione.
# El siguiente ejemplo permite a los usuarios abrir ncmpcpp usando Alt+\:
#
# ~/.zshrc

# ncmpcppShow() { BUFFER="ncmpcpp"; zle accept-line; }
# zle -N ncmpcppShow
# bindkey '^[\' ncmpcppShow

# Otra forma de asociar una aplicación ncurses
# Este método mantendrá todo lo que haya introducido en la línea antes de llamar a la aplicación
#
# ~/.zshrc

# ncmpcppShow() { ncmpcpp <$TTY; zle redisplay; }
# zle -N ncmpcppShow
# bindkey '^[\' ncmpcppShow
#


# Asociaciones de teclas de gestor de archivos
# Asociaciones de teclas al estilo de los gestores de archivos gráficos pueden ser muy útiles.
# El primero deja ir hacia atrás en el historial de directorios (Alt+Left),
# El segundo deja al usuario ir hacia el directorio padre (Alt+Up).
# Además de eso muestran el contenido del directorio.
#
# ~/.zshrc
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

    
    echo ''
    echo ''
    echo '            ####################################################################################'
    echo ''
    echo '            acercade()      --> Mostrar este menú'
    echo '            clone()         --> Clona y almacena en '$HOME'/code'
    echo '            configura()     --> Editar archivos configuración apps más usadas'
    echo '            laranew()       --> Crea un nuevo repositorio Laravel (¡NO TERMINADA!)'
    echo '            localip()       --> Retorna la dirección IP local'
    echo '            macaddr()       --> Retorna la MAC Address local'
    echo '            pathadd()       --> Agrega la ruta enviada al PATH'
    echo '            phpserver()     --> Monta un servidor PHP localmente'
    echo '            publicip()      --> Retorna la dirección IP pública'
    echo '            zshstats()      --> Muestra los 20 comandos más usados'
    echo '            find_man()      --> "find_man 'app' 'palabra' = Busca la 'palabra' en 'app' '
    echo '            scanner()       --> Escanea mostrando puertos abiertos en la maquina local'
    echo '            extractPorts()  --> primero :nmap -p- --open -T5 -v -n ip -oG allPorts '
    echo '            -Extrae nmap informacion en un archivo'
    echo '            fzf-lovely()    --> fzf file manager'
    echo '            backuApps()     --> Guarda en dos archivos lista de app instaladas '
    echo '            backupDots()    --> Backup de dots en github'
    echo '            appsPreview()   --> Preview de software instalado'
    #    echo '      funcion()      --> Descripcion '
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
    echo ''                
    echo '            Ir hacia atrás en el historial de directorios (Alt+Left) - Ir hacia el directorio padre (Alt+Up) '
    echo '            ####################################################################################'
    echo ''


function acercade() {
    echo ' '
    echo ' ####################################################################################'
    echo ' '
    echo ' '
    echo '      clone()         --> Clona un repositorio Git y lo almacena en '$HOME'/code'
    echo '      configura()     --> Permite editar los archivos de configuración de las aplicaciones más usadas'
    echo '      laranew()       --> Crea un nuevo repositorio Laravel (¡NO TERMINADA!)'
    echo '      localip()       --> Retorna la dirección IP local'
    echo '      macaddr()       --> Retorna la MAC Address local'
    echo '      pathadd()       --> Agrega la ruta enviada al PATH'
    echo '      phpserver()     --> Monta un servidor PHP localmente'
    echo '      publicip()      --> Retorna la dirección IP pública'
    echo '      zshstats()      --> Muestra los 20 comandos más usados'
    echo '      find_man()      --> # "find_man kill SIGTERM" = busca en man de kill la palabra SIGTERM'
    echo '      scanner()       --> # "Escanea mostrando puertos abiertos en la maquina local'
    echo '      extractPorts()  --> Extrae nmap informacion en un archivo'
    echo '      fzf-lovely()    --> fzf file manager'
    echo '      backupApps()    --> Guarda en dos archivos lista de app instaladas '
    echo '      backupDots      --> Backup de dots en github'
    echo '      appsPreview()   --> Preview de software instalado'
    echo ' '
    echo ' ####################################################################################'
    echo ' '
    echo ' '



}

ansiweather -l "Tandil,AR" -u metric -s true -f 5 -d true
# ------------------------------------------------------------------------------

# alias bing='web_search bing'
# alias brs='web_search brave'
# alias google='web_search google'
# alias yahoo='web_search yahoo'
# alias ddg='web_search duckduckgo'
# alias sp='web_search startpage'
# alias yandex='web_search yandex'
# alias github='web_search github'
# alias baidu='web_search baidu'
# alias ecosia='web_search ecosia'
# alias goodreads='web_search goodreads'
# alias qwant='web_search qwant'
# alias givero='web_search givero'
# alias stackoverflow='web_search stackoverflow'
# alias wa='web_search wolframalpha'
# alias archive='web_search archive'
# alias scholar='web_search scholar'
# alias ask='web_search ask'
# alias translate='web_search translate'

# #add your own !bang searches here
# alias wiki='web_search duckduckgo \!w'
# alias news='web_search duckduckgo \!n'
# alias youtube='web_search duckduckgo \!yt'
# alias map='web_search duckduckgo \!m'
# alias image='web_search duckduckgo \!i'
# alias ducky='web_search duckduckgo \!'



# If you come from bash you might have to change your $PATH.
# Si viene de Bash, es posible que tenga que cambiar su camino $.

export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# Ruta a su instalación oh-my-zsh.

export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Establecer el nombre del tema para cargar --- si se establece en "aleatorio", se cargará
# cargar un tema aleatorio cada vez que se cargue oh-my-zsh, en cuyo caso,
# para saber cuál se cargó específicamente, ejecute: echo $RANDOM_THEME
# Ver

ZSH_THEME="random"
echo $RANDOM_THEME


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Establecer la lista de temas para elegir al cargar al azar 
# Configuración de esta variable cuando zsh_theme = aleatorio hará que ZSH se cargue 
# Un tema de esta variable en lugar de mirar en $ ZSH/temas/ 
# Si se establece en una matriz vacía, esta variable no tendrá ningún efecto. 
# Zsh_theme_random_candidates = ("Robbyrussell" "Agnoster")

 ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "darkblood" "terminalparty" "candy" "cloud")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Descommento La siguiente línea para usar la finalización sensible a mayusculas. 
# Case_sensitive = "verdadero" 

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Descommento La siguiente línea para usar la finalización insensible a los guiones. 
# La finalización sensible al caso debe estar apagada. _ y - será intercambiable. 
# Hyphen_insensitive = "verdadero" 

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates

# Descommento Una de las siguientes líneas para cambiar el comportamiento 
# de actualización automática 
# ZStyle ': OMZ: Update' Modo deshabilitado # Deshabilitar actualizaciones automáticas

zstyle ':omz:update' mode auto      

# update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Actualizar automáticamente sin preguntar 
 # ZStyle ': OMZ: Actualizar' Recordatorio del modo # Solo recuérdame actualizar cuando sea hora 

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Descomment la siguiente línea para cambiar con qué frecuencia se actualiza automáticamente 
# (en días). 
# zstyle ': OMZ: actualización' Frecuencia 13 

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
 
 # Descomment La siguiente línea si las URL de pegado y otro texto están en mal estado. 
 # Disable_magic_functions = "verdadero" 
 
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Descommento La siguiente línea para deshabilitar los colores en LS. 
# Disable_ls_colors = "verdadero" 

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Descommento La siguiente línea para deshabilitar el título de terminal
# de establecimiento automático. 
# Disable_auto_title = "verdadero" 

# Uncomment the following line to enable command auto-correction.

# Uncomment la siguiente línea para habilitar la corrección automática del comando.

ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)

# Descommento La siguiente línea para mostrar puntos rojos mientras espera completar. 
# También puede configurarlo en otra cadena para que se muestre en lugar de los puntos rojos predeterminados. 
# p.ej. Finalización_waiting_dots = "%f {amarillo} esperando ...%f" 
# PRECAUCIÓN: Esta configuración puede causar problemas con las indicaciones múltiples en ZSH <5.7.1 (ver # 5765)

 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Descomment la siguiente línea si desea deshabilitar el marco de los archivos no seguidos 
# bajo VCS como sucio. Esto hace que el estado del repositorio verifique los grandes repositorios 
# Mucho, mucho más rápido. 
# Disable_untracked_files_dirty = "verdadero" 

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.

# Descomment la siguiente línea si desea cambiar el tiempo de ejecución de comando 
# Sello que se muestra en la salida del comando del historial. 
# Puede establecer uno de los tres formatos opcionales: 
# "mm/dd/yyyy" | "dd.mm.yyyy" | "yyyy-mm-dd" 
# o establecer un formato personalizado utilizando las especificaciones de formato de función Strftime, 
# Consulte 'Man Strftime' para más detalles.

HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ¿Le gustaría usar otra carpeta personalizada que $ ZSH/Custom? 
# Zsh_custom =/rath/to/new-custom-volador

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# ¿Qué complementos te gustaría cargar? 
# Los complementos estándar se pueden encontrar en $ ZSH/complementos/ 
# Los complementos personalizados se pueden agregar a $ zsh_custom/plugins/ 
# Formato de ejemplo: plugins = (Rails Git TextMate Ruby Lighthouse) 
# Agregue sabiamente, ya que demasiados complementos ralentizan el inicio de la carcasa.


plugins=(
zsh-syntax-highlighting
zsh-completions
git-flow-completion
git
fd
dotbare
zsh-autosuggestions
auto-notify $plugins
colorize
web-search
kubectl
zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

source /usr/share/doc/find-the-command/ftc.zsh

# User configuration
# Configuración de usuario 

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Es posible que necesite establecer manualmente su entorno de idioma 
# Exportar lang = en_us.utf-8 

# Preferred editor for local and remote sessions

# Editor preferido para sesiones locales y remotas 

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# Banderas de compilación 
# Exportar Archflags = "-Arch X86_64" 
# Establezca alias personales, anulando los proporcionados por OH-My-Zsh Libs, 
# complementos y temas. Los alias se pueden colocar aquí, aunque oh-my-zsh 
# Se alienta a los usuarios a definir alias dentro de la carpeta ZSH_CUSTOM. 
# Para una lista completa de alias activos, ejecute `alias`. 
# 
# Ejemplo de alias

echo '
    Para saber que alias activos existen escriba :"alias"
'
alias npmhelp='firefox https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/npm'
alias code='code-insiders --no-sandbox --unity-launch %F'
alias red='nmcli device show'
alias zshconfig='kate ~/.zshrc'
alias ohmyzsh='kate ~/.oh-my-zsh'
alias update='yay -Syyyu --noconfirm'
alias myip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias server='sudo python -m http.server'
#python 2 = python -m SimpleHTTPServer 8000'

#  Alias subfijos activa al escribir el nombre de archivo el software correspondiente
#  alias -s txt=nano
#  alias -s py=code
#  alias -s json=code

 alias -s txt=nano
 alias -s js=code
 alias -s html=code
 alias -s json=code

#export PATH="/opt/homebrew/bin:$PATH"
# #Homebrew
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/sbin:$PATH"
# #Homebrew END

export PATH="/usr/bin:$PATH"

#[ -d /home/linuxbrew/.linuxbrew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
 source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(atuin init zsh)"

eval $(thefuck --alias)
alias k=kubectl
compdef __start_kubectl k


  fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/jmro/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# ------------------------------------------------------------------------------
# Monta el contenido del archivo enviado como parámetro en
function pastebinit() {
    curl -F c=@- https://ptpb.pw < $1
}
# ------------------------------------------------------------------------------
# Retorna la IP pública del host local
function publicip() {
    curl ipinfo.io/ip
}

# ------------------------------------------------------------------------------
# Retorna la MAC Address de la tarjeta enp4s0
function macaddr() {
    ip -o link show enp4s0 | sed 's/.*ether \(\S*\).*/\1/g'
}

# ------------------------------------------------------------------------------
# Retorna la IP Address de la tarjeta enp4s0
function localip() {
    ip -o addr show enp4s0 | head -n 1 | sed 's/.*inet \(\S*\)\/.*/\1/g'
}

# ------------------------------------------------------------------------------
# Agrega $1 a la ruta base
function pathadd() {
    [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+"$PATH:"}$1"
}

# ------------------------------------------------------------------------------
# Clona un repositorio desde Github y almacena en ~/code/
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
# ------------------------------------------------------------------------------
# Crea un nuevo proyecto de Laravel y lo almacena en /srv/http/
# ¡¡¡NO ESTÁ TERMINADO!!!
function laranew() {
	httpdir=/srv/http/
	echo "Creando nuevo proyecto Laravel: $1"
	mkdir $1
	cd $1
	echo "$2" > index.html
	cd ..
	sudo mv $1 $httpdir
}
# ------------------------------------------------------------------------------
# Start a PHP server from a directory, optionally specifying the port (Requires PHP 5.4.0+.)
function phpserver() {
  local port="${1:-4000}";
  local ip=$(ip route get 1.2.3.4 | awk '{print $7}');
  sleep 1 && xdg-open "http://${ip}:${port}/" &
  php -S "${ip}:${port}";
}
# ------------------------------------------------------------------------------
# Muestra los 20 comandos más usados
function zshstats() {
  fc -l 1 |
  awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' |
  grep -v "./" |
  column -c3 -s " " -t |
  sort -nr |
  nl |
  head -n20
}
# ------------------------------------------------------------------------------
# Permite editar los archivos de configuración de las aplicaciones más usadas
# ¡¡¡NO ESTÁ TERMINADO!!!
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

#----------------------------------------------------------------------------------
#Escaneo de puertos locales
function scanner(){
sudo nmap -p- --open -sS --min-rate 5000 -vvv -n -Pn 127.0.0.1 -oG allport

}

# Used:
# nmap -p- --open -T5 -v -n ip -oG allPorts
# Extract nmap information:
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

# fzf improvement
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

# Set 'man' colors
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

#Crear funcion que anda como si fuera alias
#
# [alias-name]() {
#     command $parameter1 $parameter2
# }

#find_man kill SIGTERM

find_man() {
    man $1 | grep -- $2
}

function appsPreview(){
pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'

}

function backupDots(){
  dotbare commit -a -m "ultimo backup"
  dotbare push -u origin main
}

function backupApps(){
  pacman -Qqm > pkglist-aur.txt
  pacman -Qqe > pkglist.txt
}

function reload(){
  source ~/.zshrc
}



source /home/jmro/zaw/zaw.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
setopt autocd beep extendedglob nomatch notify pushdignoredups pushdminus autopushd pushdsilent pushdtohome
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jmro/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall


