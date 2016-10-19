# bash-personal

Easy to use bash configurations!

## Installing

To install, clone this repo and run the install script:

```bash
$ cd $HOME
$ git clone https://github.com/boxman0617/bash-personal.git
$ cd bash-personal
$ ./install.sh
```

That will install everything that is needed for you to start.

## What do I have now?

1. Keybindings for history lookup (up/down keys to navigate history)
2. New bash prompt
3. NPM completion
4. Alias Pipeline (fancy for, can create new aliases on the fly)
5. Git branch and dirty states on the bash prompt
6. IP address of current machine on the bash prompt
7. Long History (can keep a longer version of your bash command history)

## GIFs! (Demos)

### History Lookups
![History Lookup GIF](https://raw.githubusercontent.com/boxman0617/bash-personal/master/images/history_lookup.gif "History lookup demo")

## Tutorials

### History Lookups
It's simple, as you start using the terminal, bash will always keep a record of all your commands. 
You can get to it through the `history` command, but it's hard to find stuff and copy & paste and all that jazz.
So now instead of doing all of that, just start typing a command, pause and hit the "up" or "down" arrow keys to
start going through the history using what you typed as a filter of sorts.

### Alias Pipeline
As you start using the terminal more and more, you will notice that there are commands that you just use
over and over again, like getting to a specific directory, it makes sense to make an alias of it.
I sometimes forget, or it is too much of a context switch to open an editor and add in my new alias and refresh
my session so I can use it. So now you can do the following:
```bash
$ addalias gotodev "cd /home/bob/projects/dev"
$ addalias startapp "gotodev && bundle exec rails server"
```