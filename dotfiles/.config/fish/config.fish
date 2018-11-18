set -x SHELL /usr/local/bin/fish

set fish_color_autosuggestion normal
set fish_color_command cyan
set fish_color_comment brblack
set fish_color_cwd brblack
set fish_color_cwd_root red
set fish_color_error red
set fish_color_escape normal
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param normal
set fish_color_quote brmagenta
set fish_color_redirection green
set fish_color_search_match cyan
set fish_color_status red
set fish_color_user green

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
