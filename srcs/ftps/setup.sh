echo -e "$FTPSPASSWORD\n$FTPSPASSWORD" | adduser $FTPSUSER
mkdir -p /home/$FTPSUSER/ftp
chown nobody:nogroup /home/$FTPSUSER/ftp
chmod a-w /home/$FTPSUSER/ftp
mkdir -p /home/$FTPSUSER/ftp/files
chown $FTPSUSER:$FTPSUSER /home/$FTPSUSER/ftp/files
echo "Eat a cookie" > /home/$FTPSUSER/ftp/files/cookie
sed -i "s/CLUSTERIP/$CLUSTERIP/g" /etc/vsftpd/vsftpd.conf
touch /etc/vsftpd.chroot_list
vsftpd /etc/vsftpd/vsftpd.conf &
tail -f /dev/null
