ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%} ‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%}› "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡⚡⚡%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"

# make some aliases for the colours: (coud use normal escap.seq's too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$PR_RED%}‹$(rvm-prompt i v g s)›%{$PR_NO_COLOR%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$PR_RED%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$PR_NO_COLOR%}'
  fi
fi

local username="%{$fg[cyan]%}%n%{$reset_color%}"

PROMPT='${username} %{$PR_GREEN%}%3~$(git_prompt_info)%{$PR_WHITE%}⇒%{$reset_color%} '
RPROMPT="${rvm_ruby} %T"
