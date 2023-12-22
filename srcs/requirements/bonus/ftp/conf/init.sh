#!/bin/bash

useradd -m -s /bin/bash $FTP_USER
echo "$FTP_USER" > /etc/vsftpd.userlist
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null

exec vsftpd