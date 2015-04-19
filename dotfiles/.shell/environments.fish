# Github

set -x GITHUB_USER $USER
# My home folder is diff to my github user
if test $USER = 'nathan'; set -x GITHUB_USER nathankot; end
set -x BOXEN_GITHUB_LOGIN $GITHUB_USER
