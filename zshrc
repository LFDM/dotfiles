# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Path to custom files
ZSH_CUSTOM=$HOME/.zsh

ZSH_THEME='lfdm'

export EDITOR="vi"

export TERM=xterm-256color

plugins=(git rvm colorize bundler zeus)

source $ZSH/oh-my-zsh.sh

# Add custom script folder to PATH
export PATH=$PATH:$ZSH_CUSTOM/scripts
# Using a custom theme not included in oh-my-zsh
source $ZSH_CUSTOM/themes/lfdm.zsh-theme

# RVM
export PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# Sourcing rvm here in case we are not running as a login shell
source ~/.rvm/scripts/rvm

# Faster MRI ruby GC (actually needs testing if 2.1.0 makes this obsolete)
#export RUBY_HEAP_MIN_SLOTS="800000" # deprecated after 2.1.0
export RUBY_GC_HEAP_MIN_SLOTS="800000" # changed with 2.1.0
export RUBY_HEAP_SLOTS_INCREMENT="1000000"
export RUBY_HEAP_SLOTS_GROWTH_FACTOR="1"
export RUBY_GC_MALLOC_LIMIT="89000000"
export RUBY_HEAP_FREE_MIN="100000"

export JRUBY_OPTS=--2.0

# run bundler in parallel
export BUNDLER_JOBS=4

# vi mode (oh-my-zsh is overwriting something here, so we stuff it in the back)
bindkey -v
bindkey ' ' magic-space
bindkey "^?" backward-delete-char # deletes past insert mode
bindkey '^R' history-incremental-search-backward # retain the emacs search
# some bad habits without vi mode...
bindkey '^[[1~' beginning-of-line #
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
# more vim like attitude
bindkey '^X' edit-command-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'Y' vi-yank-eol
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line
