typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
##typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

ZSH_THEME="cool"

#### Si no da error Kitty
### export TERM=xterm-kitty

### Mis variables #####

export sysfont="SF Pro Display"
export termfont="SF Mono"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Para que no te flata el maldito historial....
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt  SHARE_HISTORY
bindkey -v
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jsolis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

plugins=(
  docker
  git
)

##Mis complementos de autocompletado sugenercias etc.

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export LANGUAGE="es_AR:es_ES:es"

### ALIASES ###
# spark aliases
# alias clear='clear; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias vim='nvim'

# Changing "ls" to "exa"
# alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias ls="exa --color=auto --icons"
#list
#alias ls='lsd --color=auto'
#alias la='lsd -a'
#alias ll='lsd -la'
#alias l='lsd'
alias l.="lsd -A | egrep '^\.'"

alias apt='nala'
#readable output
alias df='df -h'

# pacman and paru
#alias update='sudo pacman -Syyu'                 # update only standard pkgs
#alias parusua='paru -Sua --noconfirm'              # update only AUR pkgs
#alias upall='paru -Syu --noconfirm'              # update standard pkgs and AUR pkgs
#alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
#alias clean='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packages

alias update='sudo nala upgrade'                
alias repos='sudo dnf repolist all'    # listar repositorios habilitados
alias grupos='sudo dnf grouplist'  # remove orphaned packages

#skip integrity check
#alias paruskip='paru -S --mflags --skipinteg'


#pacman unlock
#alias unlock="sudo rm /var/lib/pacman/db.lck"
#alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"



# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep -E --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -E --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
#alias vifm='./.config/vifm/scripts/vifmrun'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
#alias merge='xrdb -merge ~/.Xresources'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"


# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

##fix obvious typo's
#alias cd..='cd ..'
#alias pdw="pwd"
#alias udpate='sudo pacman -Syyu'
#alias upate='sudo pacman -Syyu'
#alias updte='sudo pacman -Syyu'
#alias updqte='sudo pacman -Syyu'

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo dnf upgrade'
alias upate='sudo dnf upgrade'
alias updte='sudo dnf upgrade'
alias updqte='sudo dnf upgrade'

#free
alias free="free -mt"
#continue download
alias wget="wget -c"
#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy bashrc-latest over on bashrc - cb= copy bashrc
#alias cb='sudo cp /etc/skel/.bashrc ~/.bashrc && source ~/.bashrc'
#copy /etc/skel/.zshrc over on ~/.zshrc - cb= copy zshrc
#alias cz='sudo cp /etc/skel/.zshrc ~/.zshrc && source ~/.zshrc'


#hardware info --short
alias hw="hwinfo --short"

##alias yt="ytfzf"

alias yay='paru'

alias sshold="ssh -oKexAlgorithms=+diffie-hellman-group1-sha1"
alias ssh="TERM=xterm-256color ssh"
alias editfish='nano .config/fish/config.fish'
alias editi3='nano .config/i3/config'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'
alias icat="kitty +kitten icat"

##alias df='duf'
alias clima="curl 'wttr.in/Cba?lang=es'"


#ver las cosas sin que se cierre la terminal
#alias mpv='i3-smallow mpv'
#alias sxiv="i3-smallow sxiv"
#alias zathura="i3-smallow zathura"
#alias noclose="i3-smallow"

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
## colorscript random
### SETTING THE STARSHIP PROMPT ###
## starship init fish | source
#/home/jsolis/.config/shell-color-scrips/colorscript.sh -r 
## afetch

alias myip="curl http://ipecho.net/plain; echo"
alias zshrc="nano $HOME/.zshrc"

#Tip If you don’t like the user@host part of the prompt, you 
#can make this disappear by adding 

alias du="dust"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

neofetch

alias superserver="ssh -i /home/jsolis/.sshold/ssh-key-2021-10-01.key ubuntu@140.238.190.234"

# add this to easily extract compressed files, use extract <filename> to extract 

extract () {
    if [ -f $1 ] ; then
            case $1 in
            *.tar.bz2)    tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.tar.xz)    tar xf $1      ;;
            *.bz2)        bunzip2 $1     ;;
            *.rar)        unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)        tar xvf $1     ;;
            *.tbz2)        tar xvjf $1    ;;
            *.tgz)        tar xvzf $1    ;;
            *.zip)        unzip $1       ;;
            *.Z)        uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)        echo "don't know how to extract '$1'..." ;;
            esac
    else
            echo "'$1' is not a valid file!"
    fi
 }



alias buscar="ddgr"

[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"
source ~/powerlevel10k/powerlevel10k.zsh-theme
source /home/jsolis/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ejemplos="tldr" 
alias history="history 1"

#Borrar error Key is stored in legacy trusted.gpg keyring
#Otra opción es copiar el archivo /etc/apt/trusted.gpg en el directorio /etc/apt/trusted.gpg.d. 
#Después de todo, Ubuntu solo se queja de que necesita las claves GPG en el directorio /etc/apt/trusted.gpg.d.
#Todavía tendrás que usar la terminal. Ábrelo y usa el siguiente comando:
alias repararkeys= "sudo cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d"

alias nombre="nslookup"
alias nombre-ip="nslookup"
