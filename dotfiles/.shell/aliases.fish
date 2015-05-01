set fish_user_abbreviations $fish_user_abbreviations 'mux=tmuxinator'
set fish_user_abbreviations $fish_user_abbreviations 'l=ls'
set fish_user_abbreviations $fish_user_abbreviations 'emacs=emacsclient -t'

set fish_user_abbreviations $fish_user_abbreviations 'g=git'
set fish_user_abbreviations $fish_user_abbreviations 'gs=git status'
set fish_user_abbreviations $fish_user_abbreviations 'gd=git diff'
set fish_user_abbreviations $fish_user_abbreviations 'gdc=git diff --cached'
set fish_user_abbreviations $fish_user_abbreviations 'gc=git commit -m'
set fish_user_abbreviations $fish_user_abbreviations 'gi=git issues'
set fish_user_abbreviations $fish_user_abbreviations 'gl=git log'
set fish_user_abbreviations $fish_user_abbreviations 'gca=git commit -am'
set fish_user_abbreviations $fish_user_abbreviations 'gco=git checkout'
set fish_user_abbreviations $fish_user_abbreviations 'ga=git add'
set fish_user_abbreviations $fish_user_abbreviations 'gaa=git add -A'
set fish_user_abbreviations $fish_user_abbreviations 'gp=git push'
set fish_user_abbreviations $fish_user_abbreviations 'gim=git issues milestone'

set fish_user_abbreviations $fish_user_abbreviations 'ts=timetrap sheet'
set fish_user_abbreviations $fish_user_abbreviations 'ti=timetrap in'
set fish_user_abbreviations $fish_user_abbreviations 'to=timetrap out'
set fish_user_abbreviations $fish_user_abbreviations 'td=timetrap display'
set fish_user_abbreviations $fish_user_abbreviations 'tn=timetrap now'

function legedit
  emacsclient -t ~/Documents/Personal/Accounts/current.ledger
end

alias git="hub"
