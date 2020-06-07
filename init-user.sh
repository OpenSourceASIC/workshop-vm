#!/usr/bin/env bash

echo "### running user init"

# Grab Github SSH keys and add them to known_hosts
if [[ ! -e .ssh/known_hosts ]]; then
  touch .ssh/known_hosts
fi
ssh-keyscan -t rsa github.com >> .ssh/known_hosts && chmod 600 .ssh/known_hosts

# Let's grab the tools
# XXX: replace git master with tags or actual releases for a "known working" setup?
mkdir ~/tools

echo "### Building tools, this will take a while..."
echo "### Stretch your legs or grab another coffee?"

echo "### Setting up IceStorm -- http://www.clifford.at/icestorm/"
git clone https://github.com/cliffordwolf/icestorm.git ~/tools/icestorm
cd ~/tools/icestorm
make -j$(nproc)
sudo make install

echo "### Setting up yosys -- https://github.com/YosysHQ/yosys"
git clone https://github.com/YosysHQ/yosys.git ~/tools/yosys
cd ~/tools/yosys
make config-clang
make
sudo make install

echo "### Setting up SymbiYosys -- https://github.com/YosysHQ/SymbiYosys"
git clone https://github.com/YosysHQ/SymbiYosys.git ~/tools/SymbiYosys
cd ~/tools/SymbiYosys
sudo make install

echo "### Setting up Z3 (for SymbiYosys) -- https://github.com/Z3Prover/z3"
git clone https://github.com/Z3Prover/z3.git ~/tools/z3
cd ~/tools/z3
python scripts/mk_make.py
cd build
make -j$(nproc)
sudo make install

echo "### Setting up yices2 (for SymbiYosys) -- https://github.com/SRI-CSL/yices2"
git clone https://github.com/SRI-CSL/yices2.git yices2
cd yices2
autoconf
./configure
make -j$(nproc)
sudo make install

# XXX: Do we need anything else for SymbiYosys?

echo "### Setting up graywolf -- https://github.com/rubund/graywolf"
git clone https://github.com/rubund/graywolf.git ~/tools/graywolf
cd ~/tools/graywolf
mkdir build
cd build
cmake ..
make
sudo make install

echo "### Setting up qrouter -- http://opencircuitdesign.com/qrouter/"
wget http://opencircuitdesign.com/qrouter/archive/qrouter-1.4.83.tgz -q -P ~/tools
cd ~/tools
tar xaf qrouter-1.4.83.tgz
cd qrouter-1.4.83
./configure
make
sudo make install

echo "### Setting up magic -- http://opencircuitdesign.com/magic/"
wget http://opencircuitdesign.com/magic/archive/magic-8.3.22.tgz -q -P ~/tools
cd ~/tools
tar xaf magic-8.3.22.tgz
cd magic-8.3.22
./configure
make
sudo make install 

echo "### Setting up netgen -- http://opencircuitdesign.com/netgen/"
wget http://opencircuitdesign.com/netgen/archive/netgen-1.5.147.tgz -q -P ~/tools
cd ~/tools
tar xaf netgen-1.5.147.tgz
cd netgen-1.5.147
./configure
make
sudo make install 

echo "### Setting up qflow -- https://github.com/RTimothyEdwards/qflow.git"
git clone https://github.com/RTimothyEdwards/qflow.git ~/tools/qflow
cd ~/tools/qflow
./configure
make
sudo make install 

echo "### Setting up ngspice -- http://ngspice.sourceforge.net/"
wget https://iweb.dl.sourceforge.net/project/ngspice/ng-spice-rework/32/ngspice-32.tar.gz -q -P ~/tools/
cd ~/tools
tar xaf ngspice-32.tar.gz
cd ngspice-32
./configure
make
sudo make install 

# XXX: add shortcuts to "favorites" panel as desktop is not a thing anymore, apparently. ugh.
gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'sakura.desktop']"

# XXX: clone template repo?

# If this is the first time we are running this, reboot.
if [[ ! -e "/home/vagrant/.init_done" ]]; then
    echo "### init complete, restarting..."
	touch /home/vagrant/.init_done
	sudo reboot
fi

echo "### user init done"
