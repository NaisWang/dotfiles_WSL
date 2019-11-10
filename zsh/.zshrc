# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# TERM theme setting
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH="/root/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# POWERLEVEL10K_MODE='awesome-patched'
POWERLEVEL10K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs virtualenv time)
POWERLEVEL9K_DISABLE_RPROMPT=true

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ "

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

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
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv vi-mode)

source $ZSH/oh-my-zsh.sh

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

# install zplug, plugin manager for zsh, https://github.com/zplug/zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
# zplug configruation
# if [[ ! -d "${ZPLUG_HOME}" ]]; then
#   if [[ ! -d ~/.zplug ]]; then
#     git clone https://github.com/zplug/zplug ~/.zplug
#     # If we can't get zplug, it'll be a very sobering shell experience. To at
#     # least complete the sourcing of this file, we'll define an always-false
#     # returning zplug function.
#     if [[ $? != 0 ]]; then
#       function zplug() {
#         return 1
#       }
#     fi
#   fi
#   export ZPLUG_HOME=~/.zplug
# fi
# if [[ -d "${ZPLUG_HOME}" ]]; then
#   source "${ZPLUG_HOME}/init.zsh"
# fi

# zplug 'plugins/git', from:oh-my-zsh, if:'which git'
# zplug 'romkatv/powerlevel10k', use:powerlevel10k.zsh-theme
# zplug "plugins/vi-mode", from:oh-my-zsh
# zplug 'zsh-users/zsh-autosuggestions'
# zplug 'zsh-users/zsh-completions', defer:2
# zplug 'zsh-users/zsh-history-substring-search'
# zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# if ! zplug check; then
#   zplug install
# fi

# zplug load

# fzf config, must brew install fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source self-defined .env.sh
[ -f ~/.env.sh ] && source ~/.env.sh


# Start tmux as default automatically when shell start
if [ -z "$TMUX" ]; then
	tmux
fi

# the setting of dircolors
eval `dircolors ~/.dircolors` 
