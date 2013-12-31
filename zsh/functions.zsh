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
    # no strictly needed to eval the whole statement,
    # but the job description is prettier that way
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

# tries to open the github page for the current repository you are
# in, following remote origin. Uses chrome or firefox.
function visit_gh {
  repo_path=$(git remote -v 2>/dev/null | grep 'origin' | tail -1 |\
    cut -d ' ' -f 1 | grep -oP '(?<=[:/]).*/.*(?=\.git)')
  if [[ $repo_path == '' ]]; then
    echo "Error: No github path to go to. Are you in repository with a remote?"
    return 1
  fi

  gh_url=http://www.github.com/$repo_path

  for browser in /usr/bin/{google-chrome,firefox}; do
    if [[ -f $browser ]]; then
      echo "Visiting $gh_url"
      # supresses some firefox bugs
      $browser --new-tab $gh_url 2>/dev/null
      return 0
    fi
  done

  echo "Error: Neither chrome nor firefox found."
  return 1
}
