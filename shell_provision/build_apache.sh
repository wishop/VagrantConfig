#!/usr/bin/env bash

#################################################################################
#                                  Install Apache2                              #
# - http://www.jboss.org/mod_cluster/downloads/                                 #
# - http://docs.jboss.org/mod_cluster/1.2.0/html/Intro.html                     #
#################################################################################

DIR=$1
. ${DIR}/conf/apache.conf

if [ ! -d $APACHE_DIR ]; then
	echo "Installing Apache 2..."

	sudo apt-get install -y apache2
	
	# configure apache2
	sudo cp -f $APACHE/*.so $APACHE_MODULES_DIR
	sudo cp -f $APACHE/jboss.conf $APACHE_MODS_AVAILABLE

	# configure aliases
	sudo cat $APACHE/apache_aliases > ${HOME}/.bash_aliases
	sudo . $HOME/.bashrc.sh
	sudo stopW;startW
	
	echo "Installing Apache 2... Finish."
	
fi



