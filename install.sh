#!/bin/sh

inst () { sudo apt-get install $1 ; }
log () { echo "\033[93m\n######### $1 #########\033[0m" ; }
loginst () { log "Installing $1" && inst $1 ; }

log 'Beginning Installation!'

loginst 'curl'

log 'Installing rvm'
#\curl -sSL https://get.rvm.io | bash

log 'Getting MRI ruby'
#rvm install ruby

log 'Getting rake'
#gem install rake

# and do the rest via a rake task
rake install
