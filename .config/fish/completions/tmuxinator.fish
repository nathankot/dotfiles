function __fish_tmuxinator_projects
  tmuxinator list | tr "\\n" " "
end

function __fish_tmuxinator_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

complete -f -c tmuxinator -n '__fish_tmuxinator_using_command start' -a '(__fish_tmuxinator_projects)' -d 'Project'
