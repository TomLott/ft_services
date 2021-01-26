/usr/bin/telegraf &
/usr/sbin/influxd & sleep 2

influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER gr_admin WITH PASSWORD '1111'"
influx -execute "GRANT ALL ON grafana TO gr_admin"

tail -f /dev/null