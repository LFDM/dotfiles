### Usage

* Clone (or better: fork) this repository preferably into your home
  directory
* Run ./install.sh to install:
  * rvm with the latest ruby and jruby plus a couple of gems: rake, bundler and pry
  * zsh
  * tmux with tmuxinator
  * vim-athena
  * janus
  * exuberant-ctags
  * ack and ag
  * leiningen
  * mosh
  * hub for better communication with github (disabled atm)
  * additional vim plugins (including YouCompleteMe and a fork of
    UltiSnips)
  * all dotfiles and directories
  * git hooks to automate ctags creation
  * custom snippets
  * fonts for vim-airline and a custom theme
* Follow the instructions
  * You'll be prompted for your sudo password among other things
* Enjoy, it's awesome!

This is using a fork of oh-my-zsh which contains several refactors to
its codebase. Among it is a cleaned up git.zsh file which vastly
improves git querying speed in your prompt.
