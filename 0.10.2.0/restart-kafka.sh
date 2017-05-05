#!/bin/bash
KAFKA_HOME=${KAFKA_HOME:-"/opt/kafka"}

${KAFKA_HOME}/bin/kafka-server-stop.sh

# Run kafka in background and direct logs to stdout and stderr
${KAFKA_HOME}/bin/kafka-server-start.sh ${KAFKA_HOME}/config/server.properties 2>&1 &