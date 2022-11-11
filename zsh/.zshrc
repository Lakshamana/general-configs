# If you come from bash you might have to change your $PATH.
export ASDF_DIR=/opt/asdf-vm
export PATH=$HOME/bin:/usr/local/bin:~/.scripts:$PATH:$ASDF_DIR/bin:~/.cargo/bin:~/.local/bin
export SUDO_ASKPASS=/sbin/xaskpass
export SSH_ASKPASS=/sbin/xaskpass

source ~/.zplug/init.zsh

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"
export EDITOR='vim'

# export $BROWSER
export BROWSER="/usr/bin/microsoft-edge-beta"

export CLOUDSDK_PYTHON=python2

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	# git 
	# aws 
	# gcloud 
  asdf
)

# zplug "nyquase/vi-mode"
# zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
# zplug "b4b4r07/zsh-vimode-visual", defer:3

source $ZSH/oh-my-zsh.sh

# Use vi mode
bindkey -v
export KEYTIMEOUT=1

## Init
setopt PROMPT_SUBST

# Options
THEME_PROMPT_PREFIX=${THEME_PROMPT_PREFIX:-''}
THEME_VI_INS_MODE_SYMBOL=${THEME_VI_INS_MODE_SYMBOL:-'λ'}
THEME_VI_CMD_MODE_SYMBOL=${THEME_VI_CMD_MODE_SYMBOL:-'ᐅ'}

## Set symbol for the initial mode
THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"

# on keymap change, define the mode and redraw prompt
zle-keymap-select() {
	if [ "${KEYMAP}" = 'vicmd'  ]; then
	THEME_VI_MODE_SYMBOL="${THEME_VI_CMD_MODE_SYMBOL}"
	else
	THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
	fi
	zle reset-prompt
}
zle -N zle-keymap-select

# reset to default mode at the end of line input reading
zle-line-finish() {
 THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode, you'd be prompted with CMD mode indicator
# while in fact you would be in INS mode.
# Fixed by catching SIGINT (C-c), set mode to INS and repropagate the SIGINT,
# so if anything else depends on it, we will not break it.
TRAPINT() {
	THEME_VI_MODE_SYMBOL="${THEME_VI_INS_MODE_SYMBOL}"
	return $(( 128 + $1  ))
}

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias la="ls -a"
alias ta="tmux attach -t 0"
alias reboot="sudo systemctl reboot"
alias shutdown="sudo systemctl poweroff"
alias halt="sudo systemctl halt"
alias icat="kitty +kitten icat"
alias w3m="w3m -v"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}:: "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}%{$reset_color%}"

PROMPT='$THEME_PROMPT_PREFIX%f%B%F{240}%1~ %f%b$(git_prompt_info)%(?.%F{green}$THEME_VI_MODE_SYMBOL.%F{red}$THEME_VI_MODE_SYMBOL) '

fpath+=~/.zfunc
compinit
zplug load

# pnpm
export PNPM_HOME="/home/arjuna/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
