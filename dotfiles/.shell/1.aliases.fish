# misc
abbr --add l ls

# git
alias git hub
abbr --add g git
abbr --add gs git status
abbr --add gd git diff
abbr --add gdc git diff --cached
abbr --add gc git commit
abbr --add gcm git commit -m
abbr --add gi git issues
abbr --add gl git log
abbr --add gca git commit -am
abbr --add gco git checkout
abbr --add ga git add
abbr --add gaa git add -A
abbr --add gp git push
abbr --add gpr git pull --rebase

# make
abbr --add mt make test

if command -v tmuxinator > /dev/null
  abbr --add mux tmuxinator
end

if command -v timetrap > /dev/null
  abbr --add ts timetrap sheet
  abbr --add ti timetrap in
  abbr --add to timetrap out
  abbr --add td timetrap display
  abbr --add tn timetrap now
end

function legedit
  emacs ~/Documents/Personal/Accounts/current.ledger
end
