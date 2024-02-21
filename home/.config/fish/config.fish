fish_config theme choose "Solarized Light"

# Paths
source ~/.shell/0.environment.fish
source ~/.shell/1.aliases.fish
if test -f ~/.shell/private.fish
  source ~/.shell/private.fish
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end
