#!/usr/bin/ruby1.8
require "fcgi"
require '/var/www/dev/neotoyz/kernel/init'
old_time = Time.now

FCGI.each_cgi {|cgi|

    puts cgi.header
    Init.start

    gate = cgi['nid'][0]
    duration = Init.stop
    puts Init.display(gate)
    puts "Started:"
    puts old_time
    puts "<br/><br/>Run:"
    puts Time.now
    puts "<br/><br/>Request duration:"
    puts duration

}
