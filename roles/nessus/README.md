# Please note i downloaded nessus unto a AWS bucket and used for this install, so in case this install does not work after sometime, just note have deleted the bucket to avoid charges. Use this url to download to a location and install from that location as it tends to not download properly from this location when downloading on command line
http://www.tenable.com/products/nessus/select-your-operating-system

#After running the playbook against target machine, you access the web url
https://target_ip:8834

#Logfile path
/opt/nessus/var/nessus/logs

#File backups
/opt/nessus/var/nessus/backups
