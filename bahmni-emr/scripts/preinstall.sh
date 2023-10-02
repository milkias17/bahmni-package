#!/bin/bash
set -x


rm -rf /opt/openmrs
rm -rf /etc/openmrs

rm -rf /etc/init.d/openmrs
rm -rf /var/log/openmrs

rm -f /home/bahmni/.OpenMRS/bahmnicore.properties
rm -f /etc/httpd/conf.d/emr_ssl.conf


#create bahmni user and group if doesn't exist
USERID=bahmni
GROUPID=bahmni
getent group "$GROUPID" >/dev/null || groupadd "$GROUPID"
getent passwd "$USERID" >/dev/null || useradd -g "$GROUPID" "$USERID"

mkdir -p /bahmni_temp/logs
chown -R bahmni:bahmni /bahmni_temp
chmod -R 766 /bahmni_temp

