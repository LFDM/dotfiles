# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="random"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM=xterm-256color

# Fast cding
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Remnants of the past
alias ll='ls -l'
alias la='ls -a'

# Main folders
alias c='cd ~/code'
alias d='cd ~/dotfiles'

# LLT folders
alias llt=' cd ~/code/llt/'
alias llth='cd ~/code/llt/llt-helpers'
alias lltd='cd ~/code/llt/llt-db_handler'
alias lltm='cd ~/code/llt/llt-morphologizer'
alias lltc='cd ~/code/llt/llt-constants'
alias llte='cd ~/code/llt/llt-core_extensions'
alias lltf='cd ~/code/llt/llt-form_builder'
alias lltt='cd ~/code/llt/llt-tokenizer'

# Rake and bundler
alias r='rake'
alias br='bundle exec rake'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'

# Git
alias gd='git diff'
alias gp='git push'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias gg='git hist'
alias gst='git st'

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/lfdm/.rvm/gems/ruby-2.0.0-p195/bin:/home/lfdm/.rvm/gems/ruby-2.0.0-p195@global/bin:/home/lfdm/.rvm/rubies/ruby-2.0.0-p195/bin:/home/lfdm/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/share/ruby-rvm/bin:/home/lfdm/.rvm/bin

export PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting 
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

