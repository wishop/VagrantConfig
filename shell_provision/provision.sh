#!/usr/bin/env bash

# Ubuntu updates/install actions
sudo apt-get update
sudo apt-get install -y ubuntu-desktop
#sudo apt-get install -y vim
#sudo apt-get install -y apache2
#sudo apt-get install -y maven
#sudo apt-get install -y postgresql

#install Eclipse and the Git plugin
if [ ! -d "/opt/eclipse" ]; then
	#eclipse does not exist. Lets install it
	sudo wget -c -O/opt/eclipse-SDK-4.2.2-linux-gtk-x86_64.tar "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.2.2-201302041200/eclipse-SDK-4.2.2-linux-gtk-x86_64.tar.gz&r=1"
	sudo tar -xvf /opt/eclipse-SDK-4.2.2-linux-gtk-x86_64.tar
	sudo chgrp -R vagrant /opt/eclipse
	sudo chown -R vagrant /opt/eclipse
	
	#make it available to drag'n'drop on the Unity Launcher
	mkdir -p ~/.local/share/applications
	more eclipse_setup >  ~/.local/share/applications/opt_eclipse.desktop
	chmod +x ~/.local/share/applications/opt_eclipse.desktop
fi

# to keep things pristine
sudo apt-get -y autoremove
sudo apt-get clean
