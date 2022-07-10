# misc
abbr --add l ls

# git
alias git hub
abbr --add g git
abbr --add gb git branch --sort=committerdate
abbr --add gs git status
abbr --add gd git diff
abbr --add gdc git diff --cached
abbr --add gc git commit
abbr --add gcr cherry_request
abbr --add gcm git commit -m
abbr --add gi git issue
abbr --add gl git log
abbr --add gca git commit -am
abbr --add gco git checkout
abbr --add ga git add
abbr --add gaa git add -A
abbr --add gp git push
abbr --add gpf git push --force-with-lease
abbr --add gpr git pull --rebase

# kubectl
abbr --add k kubectl

if command -v tmuxinator > /dev/null
  abbr --add mux tmuxinator
end

function legedit
  emacs ~/Google\ Drive/Documents/Accounting/current.ledger
end

function pfd -d "Return the path of the frontmost Finder window"
  osascript 2>/dev/null -e '
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell'
end

function cdf -d "cd to the current Finder directory"
  cd (pfd)
end
