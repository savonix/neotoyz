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
    @@app_conf = ENV['app_conf']
    if @@loc_conf == nil
      @@loc_conf = cgi.env_table['loc_conf']
      @@app_name = cgi.env_table['app_name']
    end

    begin
      config   = XmlSimple.xml_in(@@loc_conf,'ForceArray'=>false)
      sitemap  = config['build']['sitemap']
      gate_key = config['build']['query']
      myfence  = Fence.new(sitemap)
    rescue StandardError
      puts cgi.header("text/plain")
      puts "Config error"
      puts config
    end
  end

  begin
    gate = cgi[gate_key]
  rescue StandardError
    puts cgi.header("text/plain")
    puts "Error 2"
  end


  if gate == 'x-dynamic-css'
    puts cgi.header("text/css")
  else
    if @@app_name == 'pbooks'
      puts cgi.header("application/xhtml+xml")
    else
      puts cgi.header("text/plain")
    end
  end

  begin
    Init.start(cgi)
    duration = 0 #Init.stop
    output   = Init.display(gate,@@app_name)
  rescue StandardError => e
    puts e
    puts myxsl
    puts "Error 123"
  end

  if gate == 'x-dynamic-css'
    puts output
  else
    begin
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
    rescue
      puts 'error'
    end
  end

  if @@init == 0
    @@init = 1
  end
}
