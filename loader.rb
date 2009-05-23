#!/usr/bin/ruby1.8
require "fcgi"
require '/var/www/dev/neotoyz/kernel/init'


FCGI.each_cgi {|cgi|


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
        puts "<br/><br/>Request duration:"
        dur = duration * 1000
        puts dur
    end


}
