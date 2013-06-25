local make_yellow="%{$fg[yellow]%}"
local make_reset="%{$reset_color%}"

local background_processes="${make_yellow}%(1j.%jz .)${make_reset}"

ZSH_THEME_GIT_PROMPT_PREFIX="${make_yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›${reset_color}"

if which rbenv &> /dev/null; then
  RPS1='$(git_prompt_info)%{$fg[red]%} ‹`rbenv local | sed -e "s/ (set.*$//"`›%{$reset_color%}'
else
  RPS1='$(git_prompt_info)'
fi

PROMPT='${background_processes}%{$fg[magenta]%}%m%{$reset_color%} %2~ %B» %b '
