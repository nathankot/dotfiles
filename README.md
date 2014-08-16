# Installation

Clone this repository to your `~/.dotfiles` folder:

```sh
git clone https://github.com/nathankot/dotfiles.git ~/.dotfiles
```

Now you have two options, you can either install _only_ the dotfiles
(configurations for vim, tmux etc). Or you can install both the dotfiles, and
have [boxen](https://github.com/boxen/boxen) install binaries, apps, and configure your osx machine
for you.

## I just want dotfiles

```sh
cd ~/.dotfiles
bash sync.sh
```

## I want dotfiles, and I want boxen to setup my machine

It's recommended that you make a fork of [these boxen
configs](https://github.com/nathankot/our-boxen). If you don't know what boxen is yet, don't worry -
you can read up on it later.

If you've made a fork ensure that you edit `/config/boxen.rb` in your our-boxen fork accordingly.

This will rsync the dotfiles into `~/`, put boxen into `/opt/boxen/repo`
and run boxen:

```sh
cd ~/.dotfiles
env BOXEN_REPO=https://github.com/{your-github-name}/our-boxen.git bash install.sh
```

Make your own boxen user configuration in `/opt/boen/repo/modules/people/manifests/$YOURGITHUBUSERNAME.pp`. You can
comment out anything that you don't want:

```pp
class people::{YOURGITHUBUSERNAME} {

  $home = "/Users/${::boxen_user}"

  include fish

  # Folder Structure
  include global::folders

  # Apps
  include global::people::common::apps

  # OSX Settings
  include global::people::common::osx

  # Binaries
  include global::people::common::bins

  # Heroku
  include global::people::common::heroku

  # Npm
  include global::people::common::node

  # Ruby
  include global::people::common::ruby

  # Python
  include global::people::common::python

}
```

Run boxen again to update with your latest config:

```sh
boxen
```

Install vim plugins:

```sh
/opt/boxen/homebrew/bin/vim --noplugin -u ~/.vim/plugins.vim +PlugInstall +qall
```

Build vim plugins that need it:

```sh
cd ~/.vim/plugged/vimproc.vim && make && cd -
cd ~/.vim/plugged/tern_for_vim && npm install && cd -
```
