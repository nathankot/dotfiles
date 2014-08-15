# Installation

Clone this repository to your `~/.dotfiles` folder:

```sh
git clone https://github.com/nathankot/dotfiles.git ~/.dotfiles
```

Now you have two options, you can either install _only_ the dotfiles
(configurations for vim, tmux etc). Or you can install both the dotfiles, and
have [boxen](boxen/boxen) install binaries, apps, and configure your osx machine
for you.

## I just want dotfiles

```sh
cd ~/.dotfiles
bash sync.sh
```

## I want dotfiles, and I want boxen to setup my machine

It's recommended that you make a fork of [these boxen
configs](nathankot/our-boxen). If you don't know what boxen is yet, don't worry
- you can read up on it later.

This will rsync the dotfiles into `~/`, put boxen into `/opt/boxen/repo`
and run boxen:

```sh
cd ~/.dotfiles
env BOXEN_REPO=https://github.com/{your-github-name}/our-boxen.git bash install.sh
```
