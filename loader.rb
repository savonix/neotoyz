#!/usr/bin/ruby1.8
require 'fcgi'
require '/var/www/dev/neotoyz/kernel/fence'
require '/var/www/dev/neotoyz/kernel/config'
require '/var/www/dev/neotoyz/kernel/init'


@@blah = 1
@@init = 0

FCGI.each_cgi {|cgi|

    if @@init == 0
        @@app_name = cgi['app_name']
        @@loc_conf = cgi['loc_conf']
        @@app_conf = cgi['app_conf']
        @@init = 1
    end

    gate = cgi['nid']

    if gate == 'x-dynamic-css'
        puts cgi.header("text/css")
    else
        puts cgi.header
    end

    Init.start
    duration = Init.stop
    puts Init.display(gate)

    if gate == 'x-dynamic-css'
    elsif gate == 'index'
        @@blah = @@blah + 1
        puts '<br/><br/>Request duration:'
        puts @@blah
        dur = duration * 1000
        puts dur
    end


}
