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

function gem-inst {
  all-rubies gem install $@
}

function bundle-inst {
  all-rubies bundle install
}

function topcmds {
  lines=${1:-10}
  history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' |\
    sort | uniq -c | sort -nr | head -$lines
}

function release_compdef {
  for name in $@; do
    sed -i "^'$name' /d" $ZSH_COMPDUMP
  done
}
compdef _aliases release_compdef

# inspired by scm_breeze, lightweight implementation by populating
# the associative array with a filelist.
declare -A e
function git-pretty-status-wrapper {
  if echo $(rvm_prompt_info) | grep -q 'jruby'; then
    command git status
  else
    local git_status files index file list
    list='@@filelist@@::'
    git_status=$(git-pretty-status)
    files=$(echo $git_status | grep $list | sed "s/$list//g")
    index=0
    for file in ${(s/|/)files}; do
      let index++
      e[$index]=$file
    done
    echo $git_status | grep -v $list
  fi
}

function npm-global-install {
  sudo npm install $1 -g
}
