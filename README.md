# Polka

Development configuration for setting up and tracking dotfiles in a development
environment. This is a opinionated setup that uses ansible to configure a local
machine.

##WARNING!##

If you are not comfortable with the idea that polka completely nukes and
rebuilds your dotfiles, walk quickly away, and continue to live a normal,
uninteresting life. If you are not afraid, this isn't your first rodeo, and
you're ready for the best terminal experience of your life, read on…

Polka *will* nuke your current dotfiles, so first make sure to back up any
macros, settings, and configurations you want to keep.

### Dependencies

* OSX 10.10
* Homebrew
* Ansible

###To install:###

1. install homebrew
2. install ansible through pip
3. clone the project, preferably to a folder in your home directory entitled
   ~/src/github.com/tmiller/polka.
4. cd to the directory and run `ansible-playbook polka.ini -i laptop`
