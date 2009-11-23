=begin
File:      init.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'
require 'xml/libxslt'
require 'xmlsimple'
require '/var/www/dev/neotoyz/kernel/flow'
require '/var/www/dev/neotoyz/kernel/fence'
require '/var/www/dev/neotoyz/modules/handlers/xsl'

class Init

    @myfence = 0

    # starts the timer
    def self.start(cgi)

        @cgi = cgi
        loc_conf = cgi.env_table['loc_conf']
        #loc_conf = "/var/www/dev/established-sites/config/config_noent.xml"

        begin
            config   = XmlSimple.xml_in(loc_conf,'ForceArray'=>false)
            sitemap  = config['build']['sitemap']
            gate_key = config['build']['query']
            @myfence    = Fence.new(sitemap)
        rescue  => detail
            puts cgi.header
            puts "Configuration error"
            puts detail.backtrace.join("\n")
            exit
        end

    end

    def self.process_gate(gate='index')


    end


    def self.display(gate,app_name)

        begin
            myxsl = @myfence.get_gate(gate)
        rescue => e
            puts @myfence
            puts gate
            puts "Error 3"
            puts e.backtrace.join("\n")
            puts e.message
        end

        path = '/var/www/dev/'+app_name+'/apps/'+app_name+'/'
        xslt = XML::XSLT.new()
        xslt.parameters = {
            'link_prefix' => '/cgi-bin/ruby_pbooks.fcgi?nid=',
            'path_prefix' => '/a/dev/'+app_name+'/'
        }

        begin
            myflow = Flow.new(app_name)
            myxml = myflow.get_flow.to_s
            xslt.xml = myxml
            xslt.xsl = path+myxsl
        rescue StandardError => e
            puts e.message
            return "XSL or Flow error"
        end
        begin
            puts @cgi.header
            puts xslt.serve
        rescue StandardError => e
            puts e.message
        end
    end

    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end