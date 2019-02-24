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

vi /etc/apt/apt.conf.d/20-auto-upgrades, disable automatic updates

System settings, power management, set up suspend on lid close

install libre office, chromium


Set up linear algebra backend, install Armadillo

Something along these lines:


   18  [2018-12-14 23:39:13] sudo apt install cmake libopenblas-dev liblapack-dev
   19  [2018-12-14 23:46:05] sudo apt install libarpack2-dev
   20  [2018-12-14 23:46:22] sudo apt install libarpack++2-dev
   21  [2018-12-14 23:47:26] sudo apt install g++
   22  [2018-12-14 23:48:07] sudo apt install build-essential
   23  [2018-12-14 23:48:49] sudo apt install gfortran
   26  [2018-12-15 00:08:47] tar -xvJf Downloads/armadillo-9.200.6.tar.xz 
   29  [2018-12-15 00:10:28] mv armadillo-9.200.6 /opt/
   30  [2018-12-15 00:12:27] ll /usr/local
   31  [2018-12-15 00:25:18] ll armadillo-9.200.6/
   32  [2018-12-15 00:25:36] less armadillo-9.200.6/README.md 
   33  [2018-12-15 00:26:00] chromium-browser armadillo-9.200.6/index.html &
   34  [2018-12-15 00:28:15] cd armadillo-9.200.6
   35  [2018-12-15 00:28:19] cmake .
   36  [2018-12-15 00:30:33] make
   37  [2018-12-15 00:30:44] sudo make install

Install gdebi-kde, RStudio, steam

Follow https://cran.rstudio.com/bin/linux/ubuntu/README.html , add repo to apt.sources
and do the apt-key: sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9


   
   
   
