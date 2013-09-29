PATH=$PATH:/usr/share/ruby-rvm/bin # Add RVM to PATH for scripting 
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

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
