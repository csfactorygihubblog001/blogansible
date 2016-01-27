#echo JAVA_OPTS=${JAVA_OPTS}
#JAVA_OPTS=" --Xms 512MG"
#JAVA_OPTS=" ${JAVA_OPTS} --Xmx 512MG"
#echo "JAVA_OPTS=${JAVA_OPTS}"
#export $JAVA_OPTS
#JAVA_OPTS="-Djava.security.egd=file:/dev/./urandomi --Xms=512m --Xmx=512m "
#JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Xmx512m -Xms512m "
#JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom  -XX:PermSize=128m -XX:MaxPermSize=128m -Xms512m -Xmx512m -XX:NewRatio=2 -XX:SurvivorRatio=8 "
export JAVA_HOME=/usr/java/default
export CATALINA_HOME=/opt/tomcat
export CATALINA_BASE=/opt/tomcat
export JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -XX:PermSize=128m -XX:MaxPermSize=128m  -Xms512m -Xmx512m  -XX:NewRatio=2  -XX:SurvivorRatio=8 -verbose:gc -Xloggc:/opt/tomcat/logs/gc.log -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=11 -XX:GCLogFileSize=10m"
echo JAVA_OPTS=>${JAVA_OPTS}
