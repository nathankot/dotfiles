set -x SHELL /usr/local/bin/fish

set fish_color_autosuggestion 262626
set fish_color_command 5f5f87
set fish_color_comment red
set fish_color_cwd 6c6c6c
set fish_color_cwd_root red
set fish_color_error 870000\x1e\x2d\x2dbold
set fish_color_escape 5fafaf
set fish_color_history_current cyan
set fish_color_host \x2do\x1ecyan
set fish_color_match 005f87
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param eeeeee
set fish_color_quote 5f8700
set fish_color_redirection normal
set fish_color_search_match 262626\x1e\x2d\x2dbackground\x3dff00ff
set fish_color_status red
set fish_color_user \x2do\x1egreen
set fish_color_valid_path \x2d\x2dunderline
set fish_greeting Let\x27s\x20go\x2e
set fish_key_bindings fish_default_key_bindings
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

# Paths
source ~/.shell/0.environment.fish
source ~/.shell/1.aliases.fish
if test -f ~/.shell/private.fish
  source ~/.shell/private.fish
end
