#!/usr/bin/ruby1.8
require "fcgi"
require '/var/www/dev/neotoyz/kernel/init'
old_time = Time.now

FCGI.each {|request|
    out = request.out
    out.print "Content-Type: text/html\r\n"
    out.print "\r\n"
    Init.start
    
    duration = Init.stop
    out.print "Started:"
    out.print old_time
    out.print "<br/><br/>Run:"
    out.print Time.now
    out.print "<br/><br/>Request duration:"
    out.print duration
    request.finish
}

