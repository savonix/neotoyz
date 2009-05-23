#!/bin/sh
killall loader.rb
rm /tmp/neotoyz.fcgi
export loc_conf="/var/www/dev/phunkybb/config/config.xml"
spawn-fcgi /var/www/dev/neotoyz/loader.rb -s /tmp/neotoyz.fcgi -P /tmp/neotoyz.pid
chown www-data /tmp/neotoyz.fcgi
