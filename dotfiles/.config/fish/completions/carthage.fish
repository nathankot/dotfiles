function __fish_prog_needs_subcommand
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 1 -a $cmd[1] = 'carthage' ]
    return 0
  end
  return 1
end

function __fish_prog_using_subcommand
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -c carthage -n '__fish_prog_needs_subcommand' -a "archive bootstrap build checkout copy-frameworks fetch help update version" -f

complete -c carthage -n '__fish_prog_using_subcommand archive' -l output -r
complete -c carthage -n '__fish_prog_using_subcommand archive' -l color -a "auto always never" -x

complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l configuration -x -a "Release Debug"
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l platform -x -a "all Mac OSX iOS watchOS tvOS"
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l verbose
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l no-checkout
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l no-build
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l use-ssh
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l use-submodules
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l no-use-binaries
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l color -a "auto always never" -x
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l project-directory -x -a '(__fish_complete_directories (commandline -ct))'
complete -c carthage -n '__fish_prog_using_subcommand bootstrap' -l derived-data -x -a '(__fish_complete_directories (commandline -ct))'

complete -c carthage -n '__fish_prog_using_subcommand build' -l configuration -x -a "Release Debug"
complete -c carthage -n '__fish_prog_using_subcommand build' -l platform -x -a "all Mac OSX iOS watchOS tvOS"
complete -c carthage -n '__fish_prog_using_subcommand build' -l no-skip-current
complete -c carthage -n '__fish_prog_using_subcommand build' -l color -a "auto always never" -x
complete -c carthage -n '__fish_prog_using_subcommand build' -l verbose
complete -c carthage -n '__fish_prog_using_subcommand build' -l project-directory -x -a '(__fish_complete_directories (commandline -ct))'
complete -c carthage -n '__fish_prog_using_subcommand build' -l derived-data -x -a '(__fish_complete_directories (commandline -ct))'

complete -c carthage -n '__fish_prog_using_subcommand checkout' -l use-ssh
complete -c carthage -n '__fish_prog_using_subcommand checkout' -l use-submodules
complete -c carthage -n '__fish_prog_using_subcommand checkout' -l no-use-binaries
complete -c carthage -n '__fish_prog_using_subcommand checkout' -l color -a "auto always never" -x
complete -c carthage -n '__fish_prog_using_subcommand checkout' -l project-directory -x -a '(__fish_complete_directories (commandline -ct))'

complete -c carthage -n '__fish_prog_using_subcommand fetch' -l color -a "auto always never" -x

complete -c carthage -n '__fish_prog_using_subcommand help' -a "archive bootstrap build checkout copy-frameworks fetch help update version" -f

complete -c carthage -n '__fish_prog_using_subcommand update' -l configuration -x -a "Release Debug"
complete -c carthage -n '__fish_prog_using_subcommand update' -l platform -x -a "all Mac OSX iOS watchOS tvOS"
complete -c carthage -n '__fish_prog_using_subcommand update' -l verbose
complete -c carthage -n '__fish_prog_using_subcommand update' -l no-checkout
complete -c carthage -n '__fish_prog_using_subcommand update' -l no-build
complete -c carthage -n '__fish_prog_using_subcommand update' -l use-ssh
complete -c carthage -n '__fish_prog_using_subcommand update' -l use-submodules
complete -c carthage -n '__fish_prog_using_subcommand update' -l no-use-binaries
complete -c carthage -n '__fish_prog_using_subcommand update' -l color -a "auto always never" -x
complete -c carthage -n '__fish_prog_using_subcommand update' -l project-directory -x -a '(__fish_complete_directories (commandline -ct))'
complete -c carthage -n '__fish_prog_using_subcommand update' -l derived-data -x -a '(__fish_complete_directories (commandline -ct))'
