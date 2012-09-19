#!/bin/bash
# Linagora platform scripts : DSB + Governance

# Cleaning stuff
#rm -fr $HOME/workspace/mongodb/
#mkdir -p $HOME/workspace/mongodb/logs/
#touch $HOME/workspace/mongodb/logs/mongodb.log
#mkdir -p $HOME/workspace/mongodb/data/

# echo "[]Starting the mongo server..."
# NOTE : Done at INRIA level
#$HOME/bin/mongodb/bin/mongod --fork --dbpath $HOME/workspace/mongodb/data --logpath $HOME/workspace/mongodb/logs/mongodb.log --logappend
#echo "mongo server started"

# Start tomcat
echo "[GOV] Starting Tomcat"
$HOME/tomcat/bin/startup.sh

# Wait that the tomcat services are up...
sleep 60

# Init tomcat service
echo "[GOV] Intialize web services"

echo "[GOV] Clear the service registry"
curl http://localhost:7080/registry/rest/registry/clear

echo "[GOV] Intialize the service registry"
curl http://localhost:7080/registry/rest/registry/load?url=https://raw.github.com/play-project/play-configfiles/master/platformservices/registry/inria.properties

echo "[GOV] Initialize metadata"
curl http://localhost:7080/metadata/rest/metadata/clear
curl http://localhost:7080/metadata/rest/metadata/load?url=https://raw.github.com/play-project/play-configfiles/master/platformservices/governancemetadata/metadata.rdf.json

# Start the DSB
echo "[DSB] Starting the DSB..."

cp $HOME/dsb/conf/topology.xml.BAK $HOME/dsb/conf/topology.xml
cd $HOME/dsb/bin; ./startup.sh -D

echo "[DSB] Waiting that the DSB is started..."
sleep 60

# Create subscriptions
echo "[GOV] Deleting subscriptions between DSB and EC"
curl http://localhost:7080/pubsubbootstrap/rest/registry/clear

echo "[GOV] Creating subscriptions between DSB and EC"
curl http://localhost:7080/pubsubbootstrap/rest/init/all

sleep 30

echo "Done"