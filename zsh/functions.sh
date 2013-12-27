function git-on-master {
  branch=`current_branch`
  git checkout master && git pull --rebase origin master
  git checkout $branch
  git rebase master
}

function git-new-tracked-branch {
  git checkout -b $1 && git push -u origin $1
}

function git-nuke {
  git branch -d $1 && git push origin :$1
}

function git-nuke! {
  git branch -D $1 && git push origin :$1
}

# compile and run C
function car {
  gcc -o $1 $1.c; ./$1
}

# map esc to caps lock if it fails on startup
function esc {
  /usr/bin/xmodmap $HOME/.Xmodmap
}

# creates a pdf from a tex file and opens it
function texrel {
  pdflatex $1 && xdg-open $1.pdf
}

function gem_inst {
  rvm use jruby
  gem install $@
  rvm use ruby
  gem install $@
}

function bundle_inst {
  rvm use jruby
  bundle install
  rvm use ruby
  bundle install
}

# attaches to a tmux session through mosh
function connect {
  typeset -A dict
  dict=(
    home 192.168.178.20
    alph dev.alpheios.net
  )

  if [[ -z $1 ]]; then
    key='home'
  else
    key=$1
  fi

  mosh --ssh 'ssh -X' $dict[$key] -- tmux a -t $key
}
