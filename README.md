### Prerequisites

* Get vim (preferably something with clipboard support like vim-athena)
* Get zsh and make it your default shell (chsh -s /bin/zsh)
* Get janus
* Get rvm
* In terminal preferences allow Run command as login shell
* Get leiningen
* Get ack
  Don't forget that it's called ack-grep under ubuntu...
  (sudo ln -sf /usr/bin/ack-grep /usr/local/bin/ack to place a proper link for it)
* Get tmux (preferably 1.8+) and tmuxinator.
* Get exuberant-ctags
* Clone this repository
* Run rake
* Enjoy

Using the installation script

* Clone (or better: fork) this repository preferably into your home
  directory
* Run sudo ./install.sh to install:
  * rvm with ruby and rake
  * zsh
  * tmux
  * vim-athena
  * janus
  * exuberant-ctags
  * ack
  * leiningen
* This will also run the default rake task, which adds
  * additional plugins
  * all dotfiles and directories
  * custom snippets
  * patches to SnipMate to gain compatibility with SuperTab
  * fonts for vim-airline and a custom theme
* Follow the instructions
* Enjoy
