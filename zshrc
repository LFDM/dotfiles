# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lfdm"

# Editor
export EDITOR= "vi"

bindkey -v

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM=xterm-256color

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colorize bundler zeus)

source $ZSH/oh-my-zsh.sh

# Load customized aliases and functions afterwards
source $HOME/.zsh/aliases.sh
source $HOME/.zsh/functions.sh

# Customize to your needs...
export PATH=$PATH:/home/lfdm/.rvm/gems/ruby-2.0.0-p195/bin:/home/lfdm/.rvm/gems/ruby-2.0.0-p195@global/bin:/home/lfdm/.rvm/rubies/ruby-2.0.0-p195/bin:/home/lfdm/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/share/ruby-rvm/bin:/home/lfdm/.rvm/bin

export PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting 
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export RUBY_HEAP_MIN_SLOTS="800000"
export RUBY_HEAP_SLOTS_INCREMENT="1000000"
export RUBY_HEAP_SLOTS_GROWTH_FACTOR="1"
export RUBY_GC_MALLOC_LIMIT="89000000"
export RUBY_HEAP_FREE_MIN="100000"
