#!/bin/bash

# We just start the kafka service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a server.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in ${KAFKA_HOME}/config/server.properties
# where kafka will be able to read from.

consul-template -consul-addr=$CONSUL_URL -template="/templates/server.ctmpl:${KAFKA_HOME}/config/server.properties:/etc/scripts/restart-kafka.sh"