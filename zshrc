# zsh runtime config
# Che-Huai Lin <lzh9102@gmail.com>
# This file contains generic zsh configurations. System-specific settings
# should be written in `~/.zshrc-local`. Extra completion scripts should be
# put in `~/.zsh/completion/`.

# custom completion scripts
fpath=(~/.zsh/completion $fpath)

# history
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=$HISTSIZE
setopt hist_ignore_space
setopt extended_history

bindkey -e # emacs-style keybindings
setopt rmstarsilent # don't confirm 'rm *'
unsetopt beep
setopt extended_glob
unsetopt glob_dots # don't match dot files by *
unsetopt auto_pushd

# enable auto completion
autoload -U compinit && compinit

# completion settings
zstyle ':completion:*' menu select
zstyle -e ':completion:*:default' list-colors 'reply=(${(s.:.)LS_COLORS})'
zstyle ':completion:*' accept-exact false

# killall completion
zstyle ':completion:*:processes-names' command 'ps -e -o comm='

# enable insertion of any arguments from previous commands
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "m" copy-earlier-word

# virtualenvwrapper integration {{{
if which virtualenvwrapper_lazy.sh >& /dev/null; then
	# virtualenvwrapper is installed
	source "`which virtualenvwrapper_lazy.sh`"
	# custom prompt
	export VIRTUAL_ENV_DISABLE_PROMPT=1
fi
# function to be used in the command prompt
function virtualenv_info() {
	if [ -z "$VIRTUAL_ENV" ]; then # no active virtualenv
		echo ""
	else # inside an active virtualenv
		echo "(${VIRTUAL_ENV##*/})" # remove the path and leave only the env name
	fi
}
# }}}

# command line prompt {{{
autoload -U colors && colors
setopt prompt_subst # substitute vairables in prompt at runtime

exitstatus_color="%(?.%{$fg_bold[green]%}.%{$fg_bold[red]%})"
# PROMPT="${exitstatus_color}[%{$reset_color%}"
PROMPT="\$(virtualenv_info)"
PROMPT+="%{$fg_bold[cyan]%}[%n%{$reset_color%}" # username
PROMPT+="%{$fg_bold[green]%}@%{$reset_color%}" # @
PROMPT+="%{$fg_bold[magenta]%}%m%{$reset_color%}" # hostname
PROMPT+="%{$fg_bold[cyan]%}:%{$reset_color%}" # :
PROMPT+="%{$fg_bold[green]%}%~]%{$reset_color%}" # working directory
# second line
PROMPT+="
%{$fg_bold[cyan]%}$%{$reset_color%} "
# PROMPT+="
# ${exitstatus_color}$%{$reset_color%} "
# ${exitstatus_color}└%(#.#.>)%{$reset_color%} "
unset exitstatus_color

RPROMPT=

PROMPT2="%_> "

# }}}

# characters considered as part of a word
WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# other useful modules
autoload -U zmv

# always show the prompt at a new line
setopt prompt_cr
setopt prompt_sp

# define LS_COLORS if it is not defined
export LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.xz=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:"

# handle command-not-found
command_not_found_handler() {
	echo "command not found: $1"
	return 0
}

# cd toward root {{{
alias ..="cd .."                                # 1
alias ...="cd ../.."                            # 2
alias ....="cd ../../.."                        # 3
alias .....="cd ../../../../"                   # 4
alias ......="cd ../../../../../"               # 5
alias .......="cd ../../../../../../"           # 6
alias ........="cd ../../../../../../../"       # 7
alias .........="cd ../../../../../../../../"   # 8
# }}}

alias tmux='tmux -2'

case `uname` in
  Darwin)
    # commands for OS X go here
		alias ls="ls -G"
  ;;
  Linux)
    # commands for Linux go here
		alias ls="ls --color=auto"
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# ranger wrapper: start new instance only if it's not in the current shell
ranger() {
	if [ -z "$RANGER_LEVEL" ]; then
		command ranger "$@"
	else
		exit
	fi
}

# system-specific settings
[ -f ~/.zsh/zshrc.system ] && source ~/.zsh/zshrc.system
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# export $term value for 256 color
export TERM=screen-256color
