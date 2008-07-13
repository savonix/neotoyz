#!/usr/bin/ruby1.8
require "fcgi"

old_time = Time.now.to_s

FCGI.each {|request|
    out = request.out
    out.print "Content-Type: text/html\r\n"
    out.print "\r\n"
    out.print "Started:"
    out.print old_time
    out.print "<br/><br/>Run:"
    out.print Time.now.to_s
    request.finish
}

