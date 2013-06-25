local make_yellow="%{$fg[yellow]%}"
local make_reset="%{$reset_color%}"

local background_processes="${make_yellow}%(1j.%jz .)${make_reset}"

ZSH_THEME_GIT_PROMPT_PREFIX="${make_yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›${make_reset}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ~"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

if which rbenv &> /dev/null; then
  RPS1='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›${make_reset}'
fi

PROMPT='${background_processes}%{$fg[magenta]%}%m${make_reset} • %2~ $(git_prompt_info) ::$(git_prompt_status) '
