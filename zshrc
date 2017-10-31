# Path to dotfiles folder
export DOTFILES=$(dirname $(readlink $HOME/.zshrc))

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Path to custom files
ZSH_CUSTOM=$HOME/.zsh

ZSH_THEME='lfdm'

ENABLE_CORRECTION=true

export EDITOR="vim"

export TERM=xterm-256color

plugins=(git rvm colorize bundler zeus gibo)

source $ZSH/oh-my-zsh.sh

# Add custom script folder to PATH
export PATH=$PATH:$ZSH_CUSTOM/scripts

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

# scala
export SCALA_HOME="$HOME/tools/scala-2.10.4"
export PATH=$PATH:$SCALA_HOME/bin

# java
export JAVA_HOME="$HOME/tools/jdk1.7.0_80"
export JAVA8_HOME="$HOME/tools/jdk1.8.0_92"
export PATH=$PATH:$JAVA_HOME/bin

# android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH=$PATH:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:

# mongoDB

export PATH=$PATH:$HOME/tools/mongodb/bin

# Linuxbrew

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# Clojure
export PATH=$PATH:$HOME/tools/leiningen
export LEIN_JAVA_CMD=$JAVA8_HOME/bin/java

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

# Here the rebind-keys script was called in the past. Run it on startup of the machine
# instead, to avoid duplification of the xcape daemons.


export PATH=$PATH:$HOME/tools/google-cloud-sdk/bin

export SASS_LIBSASS_PATH=$HOME/code/libsass

export PATH=$PATH:$HOME/tools/iojs/bin

export PATH=$PATH:$HOME/tools/flow/bin

export PATH=$PATH:$HOME/tools/phantomjs/bin
export PHANTOMJS_BIN=$HOME/tools/phantomjs/bin/phantomjs

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cabal/bin

export NVM_DIR="/home/lfdm/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
