Hit web interface for the url below
http://ip-addre:3000

LOGFILES
sudo tail -f /var/log/sensu/sensu-server.log
sudo tail -f /var/log/sensu/sensu-api.log
sudo tail -f /var/log/sensu/sensu-client.log

I wrote 2 files on template, uchiwa.json is where the machine to be monitored is enetered, so on test2, just edit the ip to the ip you want to monitor. But please note you have to run same installation on clients to be monitored but you then edit this file only on the master.

sens.sh is what i used for installation
