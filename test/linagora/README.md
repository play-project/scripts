# Linagora

Starts and stops Linagora components:

- Distributed Service Bus
- Governance platform

## Requirements

- DSB is installed under $HOME/dsb/
- Tomcat is installed under $HOME/tomcat/
- MongoDB is installed and started

The required governance services are:

- pubsubbootstrap
- serviceregistry
- metadata
- 

## Configuration

- Tomcat is running on port 7080. Governance services needs to be updated in the tomcat/webapps/* folders to use this port for now.
- DSB is used to proxify services so they are available at http://localhost:8084