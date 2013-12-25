#!/bin/sh

inst () { apt-get install $1 ; }
with_color() { echo "\033[$2m$1\033[0m" ; }
suc () { with_color "\n### $1 ###" 92 ;}
log () { with_color "\n######### $1 #########\033[0m" 93 ; }
hint () { with_color "Hint: $1", 36 ; }
loginst () { log "Installing $1" ; }
log_and_inst () { loginst $1 && inst $1 ; }
dotfiles_dir=$PWD

suc 'Beginning Installation!'

log_and_inst 'curl'

log 'Installing rvm'
#\curl -sSL https://get.rvm.io | bash

log 'Getting MRI ruby'
#rvm install ruby

log 'Getting rake'
#gem install rake

#loginst 'zsh'
log 'Making zsh the default shell'
chsh -s /bin/zsh

log_and_inst 'tmux'

log_and_inst 'vim-athena'

loginst 'janus'
#curl -Lo- https://bit.ly/janus-bootstrap | bash

log_and_inst 'exuberant-ctags'

loginst 'ack'
hint "It's called ack-grep on ubuntu platforms"
inst 'ack-grep'
ln -sf /usr/bin/ack-grep /usr/local/bin/ack
hint "Linked ack-grep to ack"

loginst 'leiningen'
curl -s https://raw.github.com/technomancy/leiningen/stable/bin/lein > /bin/lein
chmod a+x /bin/lein
hint 'Run lein to finish the installation process'

suc "Installations complete! Starting rake"
rake
