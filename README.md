Omri's dotfile repository
=========================

Welcome to my standard public dotfile repository :-)
It currently only has my vim configuration files and a setup script
which installs them on your machine, though you'll probably want to
do that manually.

In order to use the `setup_vim.sh` file all you need is to have git
installed. If you already have a vim configuration (which obviously you do),
it will back it up in `~/vim_backup`. Your old vim configuration will 
not be used.

Manual configuration
--------------------
In order to use Vundle (which is what my `vimrc` file is based on),
you need to install it.
First of all run

    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

Then copy or soft-link the `vimrc` to `~/.vimrc` and `gvimrc` to `~/.gvimrc`.
Afterwards you need to open `vim` and run `:BundleInstall`. If you want, you
can do that from the command line by running

    vim +BundleInstall +qall

and wait for all the bundles to download and install. You can run
`:BundleUpdate` at any time to check all installed bundles.
For more information see [Vundle on GitHub](http://github.com/gmarik/vundle)

Extra setup for some plugins
----------------------------
I use YouCompleteMe and TernJS, both of which require an extra step or two.
First, make sure you have a vim version greater than 7.3.584 (usually you need
to [compile vim from
source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)).

To make YouCompleteMe work, you need to run the following:
```
sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh
```
(see YouCompleteMe instructions for using YCM with C-like languages).

To make TernJS work, run
```
cd ~/.vim/bundle/tern_for_vim
npm install
```

Matplotlib setup
------------------

To use the matplotlib style included here, place a symlink in 
```~/.config/matplotlib/stylelib/``` to it.
Then use 
```
import matplotlib.pyplot as plt
plt.style.use('publication')
```
in your python scripts.

*Have Fun!*
