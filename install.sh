#!/bin/bash

inst () { sudo apt-get install $1; }
with_color () { echo -e "\033[$2m$1\033[0m"; }

suc ()  { with_color "\n### $1 ###" 92; }
log ()  { with_color "\n######### $1 #########\033[0m" 93; }
hint () { with_color "Hint: $1" 36; }

loginst () { log "Installing $1"; }
log_and_inst () { loginst $1; inst $1; }
log_and_mkdir () { log "Creating $1"; mkdir -p $1; }

add_repos () {
  # appears that the add-apt-repository function takes only one argument
  for repo in "$@"
  do
    sudo add-apt-repository $repo
  done
  sudo apt-get update
}

gem_inst () {
  for impl in jruby ruby ; do
    rvm use $impl
    gem install "$@"
  done
}

suc 'Beginning Installation'

log 'Updating repositories'
add_repos ppa:pi-rho/dev ppa:keithw/mosh # for latest tmux and mosh

log_and_inst git

log_and_inst curl

log 'Installing rvm'
curl -SL https://get.rvm.io | bash
# need to source rvm in this script to run it as a shell function
source "$HOME/.rvm/scripts/rvm"

log_and_inst zsh
chsh -s /bin/zsh $USER
hint "zsh set as default shell for user $USER"

log_and_inst tmux

loginst mosh
inst python-software-properties
inst mosh

log 'Getting MRI ruby'
rvm install ruby

log 'Getting jruby'
rvm install jruby

log 'Getting rake, bundler, tmuxinator, pry and awesome_print'
gem_inst rake bundler tmuxinator pry awesome_print

log_and_inst vim-athena

loginst janus
curl -Lo- https://bit.ly/janus-bootstrap | bash
mkdir -p ~/.janus
hint 'Created ~/.janus directory to add customizations'

log_and_inst exuberant-ctags

loginst ack
hint "It's called ack-grep on ubuntu platforms"
inst ack-grep
sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack
hint "Linked ack-grep to ack"

loginst leiningen
sudo curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > /bin/lein
sudo chmod a+x /bin/lein
hint 'The installation will complete itself the first time you run lein'

log_and_mkdir ~/code
log_and_mkdir ~/tools

rake # installs all customizations
hint "Don't forget to use a powerline font in your terminal emulator"

suc Success!
echo "Now close this terminal and start a new one. Enjoy!"
