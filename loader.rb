#!/usr/bin/ruby1.8
require "fcgi"
require '/var/www/dev/neotoyz/kernel/init'
old_time = Time.now

FCGI.each_cgi {|cgi|


    gate = cgi['nid'][0]

    if gate == 'dynamic-css'
        puts cgi.header("text/css")
    else
        puts cgi.header
    end

    Init.start
    duration = Init.stop
    puts Init.display(gate)

    if gate == 'dynamic-css'
    else
        puts "Started:"
        puts old_time
        puts "<br/><br/>Run:"
        puts Time.now
        puts "<br/><br/>Request duration:"
        dur = duration * 1000
        puts dur
    end


}
