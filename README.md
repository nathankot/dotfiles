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
class people::your_github_username {

  $home = "/Users/${::boxen_user}"

  include fish

  # Apps
  include common::applications

  # App Config
  include common::config::iterm
  include common::config::karabiner

  # Login items
  include common::login_items

  # OSX Settings
  include common::osx

  # Utilities
  include common::utilities

  # Heroku
  include common::heroku

  # Npm
  include common::node

  # Ruby
  include common::ruby

  # Python
  include common::python
}
```

Run boxen again to update with your latest config:

```sh
boxen
```

## Vim

Below is a annotated list of the most common key binds I use in Vim, many of which are Vim defaults.

#### Navigation


#### Search/Code Navigation

* `ctrl + t` - Search ctags
* `g ctrl + ]` - Jump to first tag match, select if multiple matches
* `g + ]` - Select from matches, and jump to tag
* `ctrl + O` - Jump back
* `Spacebar` - Search (alias of `/`)
* `Shift + Spacebar` - Backwards search (alias of `?`)

#### File Navigation

#### Better keystrokes for common editing commands

#### Tabs, Windows, Splits

#### Utility

#### PHP


Install vim plugins:

```sh
vim --noplugin +PlugInstall
```
