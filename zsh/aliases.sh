# Even faster cding
alias ....='cd ../../..'

# Main folders
alias c='cd ~/code'
alias dots='cd ~/dotfiles'
alias tools='cd ~/tools'
alias books='cd ~/books'

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
alias dc='cd ~/code/diploma_thesis_code'

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
alias tsnips='vim ~/dotfiles/snippets/tex.snippets'
alias aliases='vim ~/.zsh/aliases.sh'
alias zsh_func='vim ~/.zsh/functions.sh'

# Faster opening
alias open='xdg-open'

# For referencing
alias git_aliases='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# Get packages easier
alias sagi='nocorrect sudo apt-get install'
alias agi='apt-get install'

# ssh to my desktop when at home
alias connect='ssh 192.168.178.20'

# start the home tmux session
alias stmux='~/.tmux/home_session.sh'
# attach to home session
alias atmux='tmux a -t home'
# connect to home session and remain independent
alias ctmux='tmux new -s home-sub -t home'

# retrieve my current public ip (echo to strip the newline char)
alias pip='echo $(curl --silent http://ipecho.net/plain)'
