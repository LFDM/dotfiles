function git-on-master {
  branch=`current_branch`
  git checkout master && git pull --rebase origin master
  git checkout $branch
  git rebase master
}

function git-cleanup {
  branch=`current_branch`
  git checkout master && git pull
  git-nuke! $current_branch
}

function git-new-tracked-branch {
  git checkout -b $1 && git push -u origin $1
}

function git-checkout-remote-branch {
  git checkout --track origin/$1
}

function git-nuke {
  git branch -d $1 && git push origin :$1
}

function git-nuke! {
  git branch -D $1 && git push origin :$1
}

function git-post-merge-cleanup {
  branch = `current_branch`
  git checkout master
  git pull origin master && git-nuke! $branch
}

function git-push-with-force {
  git push -f origin `current_branch`
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

# run rake or grunt, whatever is available to us
function rake-or-grunt {
  rake # rake exits with 1 when no Rakefile is found

  if [[ $? == 1 ]]; then
    grunt
  fi
}

function xml-format {
  xmllint --format $1 > temporary_formatted_xml_file && mv temporary_formatted_xml_file $1
}

# echoes a clickable link to the last commit in our work repo
# and copies it to the clipboard
function sigh {
  str="https://github.com/SmallImprovements/praisemanager/commit/$(git rev-parse HEAD)"
  echo -n $str | xclip -sel clip
  echo $str
}
