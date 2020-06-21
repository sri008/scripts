#!/bin/sh

JOB=$1
jenkinsStart () {
     # Start the jenkins service and check if the process was successful or not
     sudo systemctl start  jenkins
     if [ "$?" -eq "0" ]
     then
     echo "Jenkins Service Start - Success"
     else
     echo "Jenkins Service Start - failed"
     fi
}
jenkinsStop () {
     # Stop the jenkins service and check if process was successful or not
     echo"================================"
     sudo systemctl stop jenkins
     if [ "$?" -eq "0" ]
     then
     echo "Jenkins Service Stopped - Success"
     else
     echo "Jenkins Service Stopped - failed"
     fi
}
jenkinsStatus () {
     sudo systemctl status jenkins | grep "Active" | awk '{print "Jenkins Service status ", $2}'
}

sonarStart () {
     echo"================================"
     sh /opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh start
}
sonarStop () {
     sh /opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh stop
}
sonarStatus () {
     sh /opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh status
}

nexusStart () {
     echo"================================"
     sudo service nexus start
}
nexusStatus () {
     sudo service nexus status
}
nexusStop () {
     sudo service nexus stop
}

mysqlStart () {
     sudo systemctl start mysqld
     if [ "$?" -eq "0" ]
     then
     echo "Mysql Service Started - Success"
     else
     echo "Mysql Service Started - failed"
     fi

}
mysqlStatus() {
     sudo systemctl status mysqld | grep "Active" | awk '{print "Mysql service status " $2}'
}
mysqlStop() {
     sudo systemctl stop mysqld
     if [ "$?" -eq "0" ]
     then
     echo "Mysql Service Stopped - Success"
     else
     echo "Mysql Service Stopped - failed"
     fi

}

case "$JOB" in
     "start")
     #jenkinsStart
     #nexusStart
     #sonarStart
     mysqlStart
     ;;
     "status")
     #nexusStatus
     #jenkinsStatus
     #sonarStatus
     mysqlStatus
     ;;
     "stop")
     #nexusStop
     #jenkinsStop
     #sonarStop
     mysqlStop
     ;;
esac
