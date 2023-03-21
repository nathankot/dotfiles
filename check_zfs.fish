#!/usr/bin/env fish
if nc -z z.local 22
  if ssh root@z.local zpool status | grep state: | grep -v ONLINE
    osascript -e 'display notification "ZFS pool on Z in bad state" with title "Z.local"'
  end
end
