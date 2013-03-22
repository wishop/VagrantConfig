#!/usr/bin/env bash

DIR=$1
DATA="$DIR/data"
. ${DIR}/conf/eclipse.conf

#check to see if you already have eclipse IDE installed
if [ ! -d "/opt/eclipse" ]; then
	echo "Installing Eclipse..."
        #check if we already downloaded the Eclipse IDE archive
        if [! -f "$ECLIPSE_FILE"]; then
                wget -c -O$ECLIPSE_FILE $ECLIPSE_URL
        fi
        tar -xvf $ECLIPSE_FILE -C /opt

        #make it available to drag'n'drop to the Unity Launcher
        mkdir -p /home/vagrant/.local/share/applications
        cat $DATA/eclipse > /home/vagrant/.local/share/applications/opt_eclipse.desktop
        chmod +x /home/vagrant/.local/share/applications/opt_eclipse.desktop
        echo "Installing Eclipse... Finish."
fi
