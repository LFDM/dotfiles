# Even faster cding
alias ....='cd ../../..'
alias .....='cd ../../../../'

# Main folders
alias tools='cd ~/tools'
alias books='cd ~/books'
# sadly not possible to name the dir, autocorrection
# doesn't like dots...
alias dots="cd $DOTFILES"
c="$HOME/code"
forks="$HOME/code/forks"
scripts="$HOME/.zsh/scripts"
SI_FE="$HOME/code/si/praisemanager/frontend"
VISTIVO="$HOME/code/vistivo"

# Active projects
#alias llt=' cd ~/code/llt/'
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
alias are='cd ~/code/arethusa'

alias si="cd ~/code/si/praisemanager/frontend"
alias sim="cd $SI_FE/src/app/screens/message"
alias simc="cd $SI_FE/src/app/screens/message/components"
alias sims="cd $SI_FE/src/app/screens/message/services"
alias sio="cd $SI_FE/src/app/screens/objective"

alias vis="cd ~/code/vistivo"

# Rake

# noglob to enable arguments without zsh escaping, uses
# the bundler plugin
alias r='noglob bundled_rake'
alias rake='noglob bundled_rake'

# accessing vanilla rake (no bundler plugin) without escaping
alias r!='noglob rake'
alias rake!='noglob rake'

# Additional Git
alias gh='git hist'
alias gcom='gcmsg'
alias gs='gss' # usually starts ghostscript, a common and annoying typo
alias gss='git status -s -b' # show branch - and therefore remote stats
alias gcof='git checkout --'
alias gcor='git-checkout-remote-branch'
alias gcob='git checkout -b'
alias gcobt='git-new-tracked-branch'
alias gom='git-on-master'
alias gdw='git diff --word-diff'
alias gst='git-pretty-status-wrapper'
alias gprum='git pull --rebase upstream master'
alias gpm='git-post-merge-cleanup'
alias gbr="git for-each-ref --sort=-committerdate --format='%(committerdate:short) %(objectname:short) %(refname:short)' --count=25"
alias ggpushs="ggpush && sigh"

# Fast vim
alias v='vim'
alias minvim= 'MINVIM=1 vim'

# Config files
alias vimrc="vim $DOTFILES/vimrc.after"
alias zshrc="vim $DOTFILES/zshrc"
alias pryrc="vim $DOTFILES/pryrc"
alias tmuxc="vim $DOTFILES/tmux.conf"
alias aliases="vim $DOTFILES/zsh/aliases.zsh"
alias zsh_func="vim $DOTFILES/zsh/functions.zsh"
alias funcs='zsh_func'

# Faster opening
alias open='xdg-open'

# For referencing
alias git_aliases='cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

# Get packages easier
alias sagi='nocorrect sudo apt-get install'
alias agi='apt-get install'

# start the home tmux session
alias htmux='~/.tmux/home_session.sh'
alias ttmux='~/.tmux/thinkpad-session.sh'
alias sitmux='~/.tmux/si-session.sh'
# connect to home session and remain independent
# kills subsession immediately after detachment
alias ctmux='tmux new -s home-sub -t home; tmux kill-session -t home-sub'
alias cttmux='tmux new -s thinkpad-sub -t thinkpad; tmux kill-session -t thinkpad-sub'
alias csitmux='tmux new -s si-sub -t si; tmux kill-session -t si-sub'

# retrieve my current public ip (echo to strip the newline char)
#alias pip='echo $(curl --silent http://ipecho.net/plain)'

# Kill tmux sessions with ease
alias tks='tmux kill-session'

# source .zshrc
alias source!='source ~/.zshrc'
alias s!='source!'

# short history (what zsh does without oh-my-zsh)
alias h='fc -l'

# dated command search through ack or grep
alias ha='fc -El 0 | ack'
alias hg='fc -El 0 | grep'

# find file or dir faster
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# fast ack
alias a='ack'
# don't correct ag!
alias ag='nocorrect ag'

# fast jobs
alias j='jobs'

# no output
alias -g NO=">/dev/null"
# no error
alias -g NE="2>/dev/null"
# no nothing
#  redirects stdout to the black hole and stderr to stdout
#  - which is in the black hole already
alias -g NN=">/dev/null 2>&1"

# fast pipes
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g A='| ack'
alias -g L="| less"
alias -g XC='| xclip -sel clip'

# fast visit_gh
alias vgh='visit-gh'

# fast exit
alias x='exit'

# fast echo
alias e='echo'
compdef _echotc e=echotc
compdef _echoti e=echoti

# Script shortcuts
alias b='breakout'
alias gbs='git-bisect'
alias gfwu='git-fork-with-upstream'
alias tkss='tmux-kill-sessions'
alias tkps='tmux-kill-panes'
alias tkws='tmux-kill-windows'
alias tdp='tmux display-panes'
alias kvs='kill-vim-swaps'

# open chrome silently on my second monitor
alias chrome='google-chrome --window-position=1921,0 2>/dev/null &!'

# replacements
alias top='htop'

# using hub
# disabled temporarily, is buggy
#alias git=hub

# For local development
alias gem_polish="$HOME/code/gem_polish/bin/gem_polish"

alias ghi='/home/lfdm/code/ghi/bin/ghi'

# gem_polish aliases
alias gph='gem_polish help'
alias gpp='gem_polish polish'
alias gpv='gem_polish version'
alias gpga='gem_polish gem add'
alias gpgd='gem_polish gem delete'
alias gpgu='gem_polish gem update'

# tig
alias t='tig'
alias ts="tig status"
alias ta="tig --all"
alias td="tig show"
alias tb="tig blame"

# npm
alias ni="npm install"
alias ngi="npm-global-install"

# bower - b as prefix is gone for bundler already
alias boi="bower install"

# npm and bower
alias nbi="npm install && bower install"

# arethusa cli - local
alias acli="$HOME/code/arethusa-cli/bin/arethusa"

# arethusa dev server
alias ares="DEV=1 grunt reloading-server"

# time-track
alias tts="node $HOME/code/time-track start"
alias tte="node $HOME/code/time-track stop"
alias ttsh="node $HOME/code/time-track show"

# Running karma
alias ks="karma start --reporters mocha,progress,growl"
