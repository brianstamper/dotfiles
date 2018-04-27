dotfiles
========

Common Linux config files, primarily for Bash and Vim. These have been configured for my needs; you are free to use them, but at your own risk.

Usual build steps for Kubuntu:

do wireless config during install
post install, do this otherwise freezes occur: 

    sudo apt install nvidia-384
    shutdown -r now

then the rest

    sudo apt-get update
    sudo apt install vim
    alias vi='vim'
    sudo apt install git
    git clone https://github.com/brianstamper/dotfiles.git
    dotfiles/setup.sh


