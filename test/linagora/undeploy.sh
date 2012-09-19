#!/bin/bash
# Linagora platform scripts : DSB + Governance undeploy

# Clear data
echo "[GOV] Clear subscriptions between DSB and EC"
curl http://localhost:7080/pubsubbootstrap/rest/registry/clear
echo "[GOV] Clear the service registry"
curl http://localhost:7080/registry/rest/registry/clear
echo "[GOV] Clear metadata"
curl http://localhost:7080/metadata/rest/metadata/clear

# Stop tomcat
echo "[GOV] Stopping Tomcat Web services"
$HOME/tomcat/bin/shutdown.sh

# Stop the DSB
echo "[DSB] Killing the DSB..."
$HOME/dsb/bin/kill.sh
rm $HOME/dsb/repository/*.xml

echo "Waiting..."
sleep 10

echo "Done"