function git-on-master {
  git checkout master && git pull --rebase 
  git checkout '$(current_branch)'
  git rebase master
}

function git-nuke {
  git branch -d $1 && git push origin :$1
}

function git-nuke! {
  git branch -D $1 && git push origin :$1
}
