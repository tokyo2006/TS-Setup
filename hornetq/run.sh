#!/bin/bash
#------------------------------------------------
# Simple shell-script to run HornetQ standalone
# Edited from the packaged run.sh to allow JAVA_OPTIONS to be injected and customized.
#------------------------------------------------

cd /opt/hornetq-2.4.0.Final/bin

export HORNETQ_HOME=..
mkdir -p ../logs

# By default, the server is started in the non-clustered standalone configuration

if [ a"$1" = a ]; then CONFIG_DIR=$HORNETQ_HOME/config/stand-alone/non-clustered; else CONFIG_DIR="$1"; fi
if [ a"$2" = a ]; then FILENAME=hornetq-beans.xml; else FILENAME="$2"; fi

if [ ! -d $CONFIG_DIR ]; then
    echo script needs to be run from the HORNETQ_HOME/bin directory >&2
    exit 1
fi

RESOLVED_CONFIG_DIR=`cd "$CONFIG_DIR"; pwd`
export CLASSPATH=$RESOLVED_CONFIG_DIR:$HORNETQ_HOME/schemas/

# Use the following line to run with different ports
#export CLUSTER_PROPS="-Djnp.port=1099 -Djnp.rmiPort=1098 -Djnp.host=localhost -Dhornetq.remoting.netty.host=localhost -Dhornetq.remoting.netty.port=5445"

JAVA_OPTIONS="${JAVA_OPTIONS:--Xms256m -Xmx256m}"
export JVM_ARGS="$CLUSTER_PROPS ${JAVA_OPTIONS} -XX:+UseParallelGC -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -Dhornetq.config.dir=$RESOLVED_CONFIG_DIR -Djava.util.logging.manager=org.jboss.logmanager.LogManager -Dlogging.configuration=file://$RESOLVED_CONFIG_DIR/logging.properties -Djava.library.path=./lib/linux-i686:./lib/linux-x86_64"

for i in `ls $HORNETQ_HOME/lib/*.jar`; do
        CLASSPATH=$i:$CLASSPATH
done

echo "***********************************************************************************"
echo "java $JVM_ARGS -classpath $CLASSPATH org.hornetq.integration.bootstrap.HornetQBootstrapServer $FILENAME"
echo "***********************************************************************************"
java $JVM_ARGS -classpath $CLASSPATH -Dcom.sun.management.jmxremote org.hornetq.integration.bootstrap.HornetQBootstrapServer $FILENAME
