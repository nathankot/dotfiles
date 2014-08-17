if exists("b:current_syntax")
  finish
endif

if &ft =~ "coffee"
  runtime! syntax/coffee.vim
else
  runtime! syntax/javascript.vim
endif

syn case match
syn keyword specControls afterEach beforeEach describe it context Given When Then And
syn keyword specFunctions expect addMatchers spyOn not
syn keyword specDisabled xit xdescribe
syn keyword specAsync runs waits waitsFor
syn match specMatcher "to[A-Za-z0-9_]*"

hi link specControls      Normal

let b:current_syntax = "jasmine"
