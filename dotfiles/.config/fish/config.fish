set -x SHELL /usr/local/bin/fish

# Paths
source ~/.shell/0.environment.fish
source ~/.shell/1.aliases.fish
source ~/.shell/2.functions.fish
if test -f ~/.shell/private.fish
  source ~/.shell/private.fish
end
