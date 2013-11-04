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

*Have Fun!*

Test the push to bitbucket.
