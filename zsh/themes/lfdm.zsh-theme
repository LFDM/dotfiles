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

ZSH_THEME_GIT_PROMPT_STASHED="%B%F{cyan}✭%b%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%B%F{white}!%b%f"
ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{221}⬆%b%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{221}⬇%b%f"

ZSH_THEME_RVM_PROMPT_PREFIX="%F{167}‹"
ZSH_THEME_RVM_PROMPT_SUFFIX="›%f"

username="%F{073}%n%f"
short_path="%F{107}%3~%f"

cmd_mode="%B%F{226}‹cmd›%b%f"
ins_mode=""

ins_delim="⇒"
cmd_delim="%B%F{226}C%b%f"

add-zsh-hook precmd git_prompt_complete

function git_left_prompt() {
  printf '%s%s%s%s'\
    $ZSH_THEME_GIT_PROMPT_PREFIX \
    $ZSH_THEME_GIT_PROMPT_COMPLETE[branch] \
    $ZSH_THEME_GIT_PROMPT_COMPLETE[dirty] \
    $ZSH_THEME_GIT_PROMPT_SUFFIX
}

function git_right_prompt {
  printf '%s%s%s' \
    $ZSH_THEME_GIT_PROMPT_COMPLETE[ahead] \
    $ZSH_THEME_GIT_PROMPT_COMPLETE[change] \
    $ZSH_THEME_GIT_PROMPT_COMPLETE[stash]
}

function mode_switch {
  echo "${${KEYMAP/vicmd/$1}/(main|viins)/$2}"
}

function zle-keymap-select {
  vi_mode=$(mode_switch $cmd_mode $ins_mode)
  delimiter=$(mode_switch $cmd_delim $ins_delim)
  zle reset-prompt
}

function zle-line-finish {
  # needed to reset when hitting return from cmd mode
  vi_mode=$ins_mode
  delimiter=$ins_delim
  # reset so that we don't have mode identifiers hanging around
  # in past command lines
  zle reset-prompt
}

zle -N zle-keymap-select
zle -N zle-line-finish

# Beware, single-quotes are imperative here (resolution of variable at a
# different time!) As vi_mode is dynamic it cannot be inside of double-quotes.
PROMPT='${username} ${short_path} $(git_left_prompt) ${delimiter} '
RPROMPT='${vi_mode} $(git_right_prompt) $(rvm_prompt_info) %T'
