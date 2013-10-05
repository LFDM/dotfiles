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
