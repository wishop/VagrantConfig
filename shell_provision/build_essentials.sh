#!/usr/bin/env bash

#########################################
#         Install OS Essentials         #
#########################################

if [ $2 == "Y" ]; then 
	# Ubuntu updates/install actions
	sudo apt-get update
	#sudo apt-get upgrade -y 
	
	# Ubuntu essentials
	sudo apt-get install -y ubuntu-desktop
	sudo apt-get install -y vim
	sudo apt-get install -y tree
	
	# sudo apt-get install -y openssh-server openssh-client
fi