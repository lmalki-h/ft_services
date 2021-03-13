sed -i "s/INFLUXDBUSER/$INFLUXDBUSER/" /create_admin
sed -i "s/INFLUXDBPASSWORD/$INFLUXDBPASSWORD/" /create_admin
influxd run --config /etc/influxdb.conf &
sleep 3
influx < /create_admin
tail -f /dev/null
