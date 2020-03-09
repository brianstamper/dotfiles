dotfiles
========

Common Linux config files, primarily for Bash and Vim. These have been configured for my needs; you are free to use them, but at your own risk.

Usual build steps for Kubuntu:

do wireless config during install, without PIM, with third party
post install, do this otherwise freezes occur:
(see https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux)

    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    ubuntu-drivers devices
    sudo ubuntu-drivers autoinstall
    shutdown -r now

currently this gives me nvidia-415 for my GeForce 750ti

then the rest

    sudo apt update
    sudo apt install vim
    alias vi='vim'
    sudo apt install git
    git config --global user.email "..."
    git config --global user.name "Brian Stamper"
    git clone https://github.com/brianstamper/dotfiles.git
    dotfiles/setup.sh
    
    git config --global credential.helper 'cache --timeout=1000000000'

Instead of/in addition to  credential.helper?
    ssh-keygen -t rsa -C "..."
    cat .ssh/id_rsa.pub 

And go to Settings on Github to add that key, then test it with

    ssh -T git@github.com


disable automatic updates, change both 1s to 0
    vi /etc/apt/apt.conf.d/20auto-upgrades

Do system settings, power management, set up suspend on lid close

Some basics

    sudo apt install libreoffice chromium-browser acpi


Set up linear algebra backend, install Armadillo

    sudo apt install cmake
    sudo apt install libopenblas-dev
    sudo apt install liblapack-dev
    sudo apt install libarpack2-dev
    sudo apt install libsuperlu-dev

download Armadillo from http://arma.sourceforge.net/download.html

move the tar to ~/ and do tar -xf ..

cd to that dir and follow build instructions in README.md

Go to https://cran.r-project.org/bin/linux/ubuntu/README.html

and follow instructions there, but do this before doing sudo apt update:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9


check sessionInfo() to see if OpenBLAS is being used
https://stackoverflow.com/a/59293874/2768944

https://rstudio.com/products/rstudio/download/#download

    sudo dpkg -i rstudio-1.2.5033-amd64.deb
    sudo apt install -f       because the above line had dependency errors
    sudo dpkg -i rstudio-1.2.5033-amd64.deb

OR, build my custom version using docker

    # install Docker https://docs.docker.com/install/linux/docker-ce/ubuntu/
    sudo apt-get install     apt-transport-https     ca-certificates     curl     gnupg-agent     software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt install docker-ce docker-ce-cli containerd.io
    mkdir projects
    cd projects/
    git clone git@github.com:brianstamper/rstudio.git
    cd rstudio/docker/
    sudo ./docker-compile.sh bionic-amd64 desktop
    cd package/
    sudo dpkg -i rstudio-99.9.9-amd64.deb 
   
   
