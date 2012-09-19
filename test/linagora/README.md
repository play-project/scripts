# Linagora

Starts and stops Linagora components:

- Distributed Service Bus
- Governance platform

## Requirements

- DSB is installed under $HOME/dsb/
- Tomcat is installed under $HOME/tomcat/
- MongoDB is installed and started

## Configuration

- Tomcat is running on port 7080. Governance services needs to be updated in the tomcat/webapps/* folders to use this port for now.