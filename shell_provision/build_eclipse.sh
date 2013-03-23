#!/usr/bin/env bash

DIR=$1
. ${DIR}/conf/provision.conf
. ${CONF}/eclipse.conf

#check to see if you already have eclipse IDE installed
if [ ! -d $ECLIPSE_DIR ]; then
	echo "Installing Eclipse..."
        
	#check if we already downloaded the Eclipse IDE archive
        if [ ! -f "$ECLIPSE_FILE" ]; then
                wget -c -O$ECLIPSE_FILE "$ECLIPSE_URL"
	else
		tar -xvf $ECLIPSE_FILE -C /opt
		sudo chown -R vagrant $ECLIPSE_DIR
		sudo chgrp -R vagrant $ECLIPSE_DIR
		sudo chmod 777 $ECLIPSE_DIR/configuration

        	#make it available to drag'n'drop to the Unity Launcher
	        mkdir -p $HOME/.local/share/applications
       		cat $DATA/eclipse > $HOME/.local/share/applications/opt_eclipse.desktop
        	chmod +x $HOME/.local/share/applications/opt_eclipse.desktop

		#Installing Git Plugins on Eclipse
		$ECLIPSE_DIR/eclipse -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/releases/juno -installIUs org.eclipse.egit.feature.group
	
		$ECLIPSE_DIR/eclipse -application org.eclipse.equinox.p2.director -noSplash -repository http://download.eclipse.org/releases/juno -installIUs org.eclipse.jgit.feature.group
	fi

	sudo apt-get install -y git
        echo "Installing Eclipse... Finish."
fi
