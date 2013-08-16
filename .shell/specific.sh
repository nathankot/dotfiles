### Conditional Settings

export HOST_NAME=`uname -n`

if [ $HOST_NAME = 'server.local' ]; then
  export CURRENT_WORKSTATION='home'
fi;

if [ $HOST_NAME = 'air.local' ]; then
  export CURRENT_WORKSTATION='mobile'
fi;

# This is the Grabone work settings.
if [ `hostname` = 'nathan-H87M-D3H' ]; then
  export CURRENT_WORKSTATION='work'

  PATH="$(brew --prefix nathankot/php/php53)/bin:$PATH"

  alias assets_remount='sudo umount /srv/repslave/grabone/nathank; sudo mount 10.50.0.52:/ssdpool/grabone/nathank /srv/repslave/grabone/nathank'
  alias symfony_refresh='./symfony mu --snapshot && ./symfony cc && assets_remount'
  alias clear_image_cache="sudo rm -rfv /var/www/localcache/grabone/image/*"
  alias ssh="( ssh-add -l > /dev/null || ssh-add ) && ssh"

  function refresh_memcache {
    launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
  }
fi;

###
