#!/bin/bash
. /etc/rc.d/init.d/functions

prog=$"Selenium"

# Selenium RC
JAVA_HOME=/usr/java/default
JAVA_EXEC=${JAVA_HOME}/bin/java
pidf=/var/run/selenium.pid
OPT=""
JAVA_OPTS=" -Djava.net.preferIPv4Stack=true "

start_hub() {
	OPT="-role hub -port 5555"
	start
}
start_node() {
	OPT="-role node"
	start
}
start() {
    if [ -e $pidf ];
    then
        action $"Starting $prog: " /bin/false
        echo "already selenium"
    else
        action $"Starting $prog: " /bin/true
        $JAVA_EXEC ${JAVA_OPS} -jar /opt/selenium/selenium-server-standalone-2.48.2.jar $OPT > /var/log/selenium/selenium.log 2> /var/log/selenium/error.log &
        echo $! > $pidf
    fi
}

stop() {
    if [ -e $pidf ];
    then
        action $"Stopping $prog: " /bin/true
        pid=`cat $pidf`
        test ! -z $pid && kill $pid && rm -f $pidf
    else
        action $"Stopping $prog: " /bin/false
        echo "$prog は起動してないみたい。"
    fi
}
case "$1" in
    start_hub)
        start_hub
        ;;
    start_node)
        start_node
        ;;
    restart)
        stop
        sleep 3
        start_hub
        ;;
    start)
        start
        ;;
    stop)
        stop
        ;;
    *)
        echo $"Usage: $0 {start_hub|start_node|start|stop}"
        exit 1
esac
exit 0