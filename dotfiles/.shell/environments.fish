set fish_greeting "Let's go."
set -x FISH_CLIPBOARD_CMD pbcopy
set -x TERM screen-256color
set -x EDITOR "emacsclient -t"
set -x ALTERNATIVE_EDITOR emacs # fallback to vanilla
set -x GITHUB_USER $USER
# My home folder is diff to my github user
if test $USER = 'nathan'; set -x GITHUB_USER nathankot; end
set -x BOXEN_GITHUB_LOGIN $GITHUB_USER
