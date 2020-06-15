#!/usr/bin/env bash

echo "### running root init"

# Grab necessary packages
apt-add-repository multiverse && apt-get update
apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 \
                   build-essential cmake pkg-config clang bison flex gawk git mercurial  \
                   m4 tcsh xdot python python3 qt5-default gperf graphviz gtkwave sakura \
                   python3-dev libreadline-dev tcl-dev libffi-dev libftdi-dev libboost-all-dev libeigen3-dev \
                   libgsl-dev libx11-dev tcl-dev tk-dev libcairo2-dev libncurses-dev libxaw7-dev libgmp-dev
apt-get upgrade -y


# Permit anyone to start X
sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config

# Enable gdm3 autologin
sed -i 's/#  AutomaticLoginEnable/AutomaticLoginEnable/' /etc/gdm3/custom.conf 
sed -i 's/#  AutomaticLogin = user1/AutomaticLogin = vagrant/' /etc/gdm3/custom.conf 

echo "### root init done"
