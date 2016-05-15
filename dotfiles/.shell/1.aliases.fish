abbr --add l ls
abbr --add g git
abbr --add gs git status
abbr --add gd git diff
abbr --add gdc git diff --cached
abbr --add gc git commit -m
abbr --add gi git issues
abbr --add gl git log
abbr --add gca git commit -am
abbr --add gco git checkout
abbr --add ga git add
abbr --add gaa git add -A
abbr --add gp git push

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
  emacsclient -a "" -t ~/Documents/Personal/Accounts/current.ledger
end

alias git hub
