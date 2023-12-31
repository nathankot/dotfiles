My dotfiles.

### Setup

Clone this repo + submodules.

```
$ git clone https://github.com/nathankot/dotfiles.git
$ git submodule update --init --recursive
```

Install homebrew, and setup python venv, deps for ansible:

```
$ cd /path/to/dotfiles
$ python3 -m venv env
$ pip3 install -r ./requirements.txt
```

Run the install script and follow instructions. Options are `admin` for the
admin of a host or `user`.

```
$ ./install [admin|user]
```

Lastly there may be some private config that needs to be set up.

Private config files:

```
~/.gitconfig.private
~/.shell/private.fish
```

Import GPG secret keys.
