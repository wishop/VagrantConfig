#!/usr/bin/env bash

##################################################
#                Install JBoss AS                #
##################################################

DIR=$1
. $DIR/conf/jboss.conf

if [ ! -d $JBOSS_DIR ]; then
	echo "Installing JBoss AS..."

	# check if we already downloaded the JBoss AS archive
	if [ ! -f $JBOSS_FILE ]; then
		wget -c -O$JBOSS_FILE "$JBOSS_URL"
	fi
	
	if [ -f $JBOSS_FILE ]; then
		
		sudo mkdir $JBOSS_DIR
		sudo tar -zxvf $JBOSS_FILE -C $JBOSS_DIR --strip-components=1
		sudo chown -R vagrant $JBOSS_DIR
		sudo chgrp -R vagrant $JBOSS_DIR
		
		# configuring JBoss
		
	fi
	
	echo "Installing JBoss AS... Finish."
fi
