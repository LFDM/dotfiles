#!/bin/bash

inst () { sudo apt-get install $1 ; }
with_color() { echo -e "\033[$2m$1\033[0m" ; }
suc () { with_color "\n### $1 ###" 92 ;}
log () { with_color "\n######### $1 #########\033[0m" 93 ; }
hint () { with_color "Hint: $1" 36 ; }
loginst () { log "Installing $1" ; }
log_and_inst () { loginst $1 && inst $1 ; }
gem_inst () {
  rvm use jruby ;
  gem install "$@" ;
  rvm use ruby ;
  gem install "$@" ;
}
dotfiles_dir=$PWD

suc 'Beginning Installation'

log 'Updating repositories'
add-apt-repository ppa:pi-rho/dev
apt-get update

log_and_inst 'curl'

log 'Installing rvm'
#curl -SL https://get.rvm.io | bash

# need to source rvm in this script separately to run it
source "$HOME/.rvm/scripts/rvm"

#log_and_inst 'zsh'
sudo chsh -s /bin/zsh
hint 'zsh set as default shell'

log_and_inst 'tmux'

log 'Getting MRI ruby'
#rvm install ruby

log 'Getting jruby'
#rvm install jruby
# not sure if we have to switch or if it would be done automatically
log 'Getting gems rake andbundler'
gem_inst rake bundler

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
curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > /bin/lein
chmod a+x /bin/lein
hint 'The installation will complete itself the first time you run lein'

log 'Creating ~/code directory'
mkdir ~/code

rake

suc 'Success!'
echo "Now close this terminal and start a new one. Enjoy!"
