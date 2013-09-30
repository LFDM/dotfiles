function git-on-master {
  git checkout master && git pull --rebase 
  git checkout '$(current_branch)'
  git rebase master
}
