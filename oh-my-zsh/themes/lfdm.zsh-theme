# Styled like the vim railscasts theme in janus
# 221 is yellow
# 196 sharp red
# 121 sharp green
# 167 mild red
# 107 mild green
# 073 cyan

ZSH_THEME_GIT_PROMPT_PREFIX="%F{221}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{221}›%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{196}⚡%b%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{121}✔%f"

rvm_ruby='%F{167}‹$(rvm-prompt i v g s)›%f'
username="%F{073}%n%f"
delimiter="⇒"

PROMPT="${username} %F{107}%3~ $(git_prompt_info) ${delimiter} "
RPROMPT="$rvm_ruby %T"
