#!/usr/bin/env bash

#########################################
#   Install PostgresSQL, PSQL Admin     #
#########################################

DIR=$1
. ${DIR}/conf/provision.conf
. ${CONF}/provision.conf

if [ ! -d $POSTGRES_DIR ]; then
	echo "Installing postgreSQL..."

	sudo apt-get install -y postgresql pgadmin3
	sudo -u postgres psql -f ${SQL}/postgres.sql

	echo "Installing postgreSQL... Finish."
	
fi



