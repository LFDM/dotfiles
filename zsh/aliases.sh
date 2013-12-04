# Even faster cding
alias ....='cd ../../..'

# Main folders
alias c='cd ~/code'
alias dots='cd ~/dotfiles'

# Active projects
alias llt=' cd ~/code/llt/'
alias lltdev='cd ~/code/llt-dev/'
alias lltm='cd ~/code/llt-dev/llt'
alias lltc='cd ~/code/llt-dev/llt-core'
alias lltl='cd ~/code/llt-dev/llt-logger/'
alias llth='cd ~/code/llt-dev/llt-helpers'
alias lltd='cd ~/code/llt-dev/llt-db_handler'
alias lltk='cd ~/code/llt-dev/llt-constants'
alias llts='cd ~/code/llt-dev/llt-segmenter'
alias llte='cd ~/code/llt-dev/llt-core_extensions'
alias lltf='cd ~/code/llt-dev/llt-form_builder'
alias lltt='cd ~/code/llt-dev/llt-tokenizer'
alias mlld='cd ~/code/multi_language_latin_dictionary'
alias diploma='cd ~/code/diploma_thesis'

# Rake and bundler
alias r='rake'
alias br='bundle exec rake'

# Additional Git
alias gh='git hist'
alias gcom='gcmsg'
alias gs='gss' # usually starts ghostscript, a common and annoying typo
alias gcof='git checkout --'
alias gcob='git checkout -b'
alias gcobt='git-new-tracked-branch'

# Show the full current path
alias p='echo $PWD'

# Fast vim
alias v='vim'

# Config files
alias vimrc='vim ~/.vimrc.after'
alias zshrc='vim ~/.zshrc'
alias pryrc='vim ~/.pryrc'
alias tmuxc='vim ~/.tmux.conf'
alias rsnips='vim ~/dotfiles/snippets/ruby.snippets'
alias csnips='vim ~/dotfiles/snippets/clojure.snippets'
alias msnips='vim ~/dotfiles/snippets/markdown.snippets'
alias aliases='vim ~/.zsh/aliases.sh'
alias zsh_func='vim ~/.zsh/functions.sh'

# Start the dual screen tmux sessions
alias tmux_start='~/.scripts/tmux_dual_screen_setup.sh'

# Connect with tmux sessions
alias tmux_main='tmux -2 attach-session -d -t main'
alias tmux_aux='tmux -2 attach-session -d -t aux'

# Faster opening
alias open='xdg-open'

# For referencing
alias git_aliases='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# Get packages easier
alias sagi='nocorrect sudo apt-get install'
alias agi='apt-get install'
