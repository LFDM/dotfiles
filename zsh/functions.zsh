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

function all_rubies {
  # captures the ruby version from where the command was issued
  current_ruby=$(rvm current)
  integer col=9
  for impl in ruby jruby ; do
    col+=1
    identifier=$(print -nP "%B%F{$col}$impl: %b%f")
    rvm use $impl
    eval "{ $@ | sed 's/^/$identifier/' } &"
  done
  wait
  rvm use $current_ruby
}

function gem_inst {
  all_rubies gem install $@
}

function bundle_inst {
  all_rubies bundle install
}

# attaches to a tmux session through mosh
function connect {
  declare -A dict
  dict=(
    home 192.168.178.20
    alph dev.alpheios.net
  )

  dest=${1:-home}
  com="mosh --ssh 'ssh -X' $dict[$dest] -- tmux a -t $dest"
  echo "Executing $com"
  eval $com
}
