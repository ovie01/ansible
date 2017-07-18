Hit the gui on
http://server_ip:8080

Created 4 config files context.xml(2), tomcat-users.xml and tomcat.service.

tomcat.service.  >> You can tweak memory size, variables and machine info here.

context.xml  >> There are two files here, one for manager  and the other for host-manager, I commented  out the following so one can have access to Manage app and Host Manager on tomcat, as access does not come by default on latest tomcat version.
 <!--<Valve className="org.apache.catalina.valves.RemoteAddrValve"
         allow="127\.\d+\.\d+\.\d+|::1|0:0:0:0:0:0:0:1" />-->

tomcat-users.xml  >> I created a user and password to give access to gui. So you can edit username and password.
