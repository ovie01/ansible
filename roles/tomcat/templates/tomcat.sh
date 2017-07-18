#!/bin/bash

cd /opt/tomcat
echo $?

chgrp -R tomcat /opt/tomcat


chmod -R g+r conf
chmod g+x conf
chown -R tomcat webapps/ work/ temp/ logs/

systemctl daemon-reload
