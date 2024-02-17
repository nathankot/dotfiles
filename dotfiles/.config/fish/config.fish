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
