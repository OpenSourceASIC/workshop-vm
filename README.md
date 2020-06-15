# workshop-vm

This repository contains the Vagrantfile and instructions to get up and running with a virtual machine that contains all the tools that will be used in the Open Source ASIC workshop, namely:

  - [icestorm](http://www.clifford.at/icestorm/)
  - [yosys](https://github.com/YosysHQ/yosys)
  - [nextpnr](https://github.com/YosysHQ/nextpnr)
  - [SymbiYosys](https://github.com/YosysHQ/SymbiYosys)
    - [Z3](https://github.com/Z3Prover/z3)
    - [yices2](https://github.com/SRI-CSL/yices2)
  - [graywolf](https://github.com/rubund/graywolf)
  - [qrouter](http://opencircuitdesign.com/qrouter/)
  - [magic](http://opencircuitdesign.com/magic/)
  - [netgen](http://opencircuitdesign.com/netgen/)
  - [qflow](http://opencircuitdesign.com/qflow/)
  - [ngspice](http://ngspice.sourceforge.net/)

You don't need to use this VM, in fact if you're able to get everything running locally it probably would be a more optimal setup. This virtual machine is provided as a reference if you're struggling with setting up the tools, running Windows or prefer to keep things isolated.


## Download pre-built VM image

...not ready yet.


## Build Instructions

  - Make sure you have recent versions of both [Vagrant](https://www.vagrantup.com/downloads.html) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads) installed on your system
  - Clone this repository and `cd` into it
  - Tweak CPU/RAM allocation and network configuration in `Vagrantfile`
  - Issue `vagrant up`, this will download the base VM image (Ubuntu 20.04) and install necessary packages.
  **This will take quite a bit of time as you will be compiling a lot of stuff!**
  - Once init is done, open a terminal in the newly created VM and start hacking!


## Notes

You might have to reboot the VM one more time after initial boot for the Virtualbox client extensions to kick in. In the Virtualbox window select "View -> Auto-resize Guest Display" and resize the window to get more screen real estate for your VM (if this doesn't work, you do need to reboot once more). You can also use the "Seamless" and full-screen modes if you're going to be spending a lot of time in this VM.

Shared clipboard is set to birectional so you can copy/paste to/from the VM. If you want a simple terminal, try Sakura that is pre-installed. Key combos `Ctrl + Shift + C` and `Ctrl + Shift + V` will give you copy/paste abilities in that terminal.

A shared folder is set up within the VM at location `/vagrant`, on the host this will be the directory where the `Vagrantfile` is located. You can use this to copy files to/from the VM.

To further customise VM settings (for example: to set up a USB filter for `iceprog`), use the Virtualbox Manager GUI.

Username/password is `vagrant:vagrant`.

[This Vagrant cheatsheet](https://gist.github.com/wpscholar/a49594e2e2b918f4d0c4) might come in handy if you haven't used Vagrant before.


## Contribute

Take this for a spin, if you spot anything odd let us know by raising an issue or maybe send a PR with your fixes?
