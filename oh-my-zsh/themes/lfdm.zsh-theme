# Styled like the vim railscasts theme in janus

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[221]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[221]%}›"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[196]%}⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[121]%}✔%{$reset_color%}"

rvm_ruby='%{$FG[167]%}‹$(rvm-prompt i v g s)›%{$reset_color%}'
username="%{$FG[073]%}%n%{$reset_color%}"
delimiter="%{$fg[white]%}⇒%{$reset_color%}"

PROMPT='${username} %{$FG[107]%}%3~ $(git_prompt_info) ${delimiter} '
RPROMPT="${rvm_ruby} %T"
