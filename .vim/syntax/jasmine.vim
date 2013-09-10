if exists("b:current_syntax")
  finish
endif

if &ft =~ "coffee"
  runtime! syntax/coffee.vim
else
  runtime! syntax/javascript.vim
endif

syn case match
syn keyword specFunctions afterEach beforeEach describe it expect addMatchers spyOn not context Given When Then And
syn keyword specDisabled xit xdescribe
syn keyword specAsync runs waits waitsFor
syn match specMatcher "to[A-Za-z0-9_]*"

let b:current_syntax = "jasmine"
