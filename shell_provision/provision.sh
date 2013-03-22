#!/usr/bin/env bash

# Ubuntu updates/install actions
#sudo apt-get update
#sudo apt-get upgrade
#sudo apt-get install -y ubuntu-desktop
#sudo apt-get install -y vim
#sudo apt-get install -y apache2
#sudo apt-get install -y maven
#sudo apt-get install -y postgresql

#install Eclipse and the Git plugin
ECLIPSE_FILE="eclipse-SDK-4.2.2-linux-gtk-x86_64.tar"

echo $ECLIPSE_SETUP
#check to see if you already have eclipse IDE installed
if [ ! -d "/opt/eclipse" ]; then
	#check if we already downloaded the Eclipse IDE archive
	if [! -f "/opt/$ECLIPSE_FILE"]; then
		echo "Downloading Eclipse..."
		sudo wget -c -O/opt/$ECLIPSE_FILE "http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-4.2.2-201302041200/eclipse-SDK-4.2.2-linux-gtk-x86_64.tar.gz&r=1"
		echo "Downloading Eclipse... Finish."
	fi
	echo "Installing Eclipse..."
	sudo tar -xvf /opt/$ECLIPSE_FILE -C /opt
	sudo chgrp -R vagrant /opt/eclipse
	sudo chown -R vagrant /opt/eclipse
	echo "Installing Eclipse... Finish."
	
	echo "Configuring Eclipse..."
	#make it available to drag'n'drop to the Unity Launcher
	sudo mkdir -p /home/vagrant/.local/share/applications
	#more ./shell_provision/eclipse_setup >  ~/.local/share/applications/opt_eclipse.desktop
	sudo cat /opt/vagrant/shell_provision/eclipse_setup > /home/vagrant/.local/share/applications/opt_eclipse.desktop
	sudo chmod +x /home/vagrant/.local/share/applications/opt_eclipse.desktop
	sudo chown -R vagrant /home/vagrant/.local/share/applications
	sudo chgrp -R vagrant /home/vagrant/.local/share/applications
	echo "Configuring Eclipse... Finish."
fi

# to keep things pristine
sudo apt-get -y autoremove
sudo apt-get clean
