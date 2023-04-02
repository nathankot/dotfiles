#!/usr/bin/env fish
if nc -z z.local 22
  if ssh root@z.local zpool status | grep state: | grep -v ONLINE
    osascript -e 'display notification "ZFS pool on Z in bad state" with title "Z.local"'
  end

  if not ssh root@z.local /root/check_smart_status.bash
    osascript -e 'display notification "One of the drives in the ZFS pool are unhealthy" with title "Z.local"'
  end
end
