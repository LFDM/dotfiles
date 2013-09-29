ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}›"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡⚡⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"

local rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g s)›%{$reset_color%}'
local username="%{$fg[cyan]%}%n%{$reset_color%}"
local delimiter="%{$fg[white]%}⇒%{$reset_color%}"

PROMPT='${username} %{$fg[green]%}%3~ $(git_prompt_info) ${delimiter} '
RPROMPT="${rvm_ruby} %T"
