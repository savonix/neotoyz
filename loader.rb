#!/usr/bin/ruby1.8
require 'fcgi'
require '/var/www/dev/neotoyz/kernel/fence'
#require '/var/www/dev/neotoyz/kernel/config'
require '/var/www/dev/neotoyz/kernel/init'
require 'xmlsimple'
require 'xml/libxml'


@@blah   = 1
@@init   = 0
config   = {}
gate_key = ""
sitemap  = ""

FCGI.each_cgi {|cgi|

    if @@init == 0
        @@app_name = ENV['app_name']
        @@loc_conf = ENV['loc_conf']
        if @@loc_conf == nil
            @@loc_conf = cgi.env_table['loc_conf']
        end
        @@app_conf = ENV['app_conf']

        config   = XmlSimple.xml_in(@@loc_conf,'ForceArray'=>false)
        sitemap  = config['build']['sitemap']
        gate_key = config['build']['query']
        fence    = Fence.load_fence(sitemap)
    end

    gate = cgi[gate_key]

    if gate == 'x-dynamic-css'
        puts cgi.header("text/css")
    else
        puts cgi.header
    end

    puts Fence.get_gate(gate)

    Init.start
    duration = Init.stop
    output   = Init.display(gate)

    if gate == 'x-dynamic-css'
        puts output
    elsif gate == 'index'
        @@blah = @@blah + 1
        output = output.gsub("</body>", "")
        output = output.gsub("</html>", "")
        puts output
        puts config['build']['sitemap']
        puts '<br/><br/>Request duration:'
        puts @@blah
        puts @@init
        dur = duration * 1000
        puts dur
        puts '</body></html>'
    end

    if @@init == 0
        @@init = 1
    end
}
