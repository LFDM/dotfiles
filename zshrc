# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Using a custom theme
ZSH_THEME="lfdm"

export EDITOR="vi"

export TERM=xterm-256color

plugins=(git colorize bundler zeus)

source $ZSH/oh-my-zsh.sh

# Load customized aliases and functions afterwards
source $HOME/.zsh/aliases.sh
source $HOME/.zsh/functions.sh
# Additional completion file
source $HOME/.zsh/tmuxinator.zsh

# Customize to your needs...
export PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Sourcing rvm here in case we are not running as a login shell
source ~/.rvm/scripts/rvm

# Faster MRI ruby GC (actually needs testing if 2.1.0 makes this obsolete)
export RUBY_HEAP_MIN_SLOTS="800000"
export RUBY_GC_HEAP_MIN_SLOTS="800000" # changed with 2.1.0
export RUBY_HEAP_SLOTS_INCREMENT="1000000"
export RUBY_HEAP_SLOTS_GROWTH_FACTOR="1"
export RUBY_GC_MALLOC_LIMIT="89000000"
export RUBY_HEAP_FREE_MIN="100000"

export JRUBY_OPTS=--2.0

# vi mode (oh-my-zsh is overwriting something here, so we stuff it in the back
bindkey -v
bindkey "^?" backward-delete-char # deletes past insert mode
bindkey '^R' history-incremental-search-backward # retain the emacs search
