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

class Init

    @@fence = 0

    # starts the timer
    def self.start(cgi)

        #loc_conf = cgi.env_table['loc_conf']
        loc_conf = "/var/www/dev/established-sites/config/config_noent.xml"

        begin
            config   = XmlSimple.xml_in(loc_conf,'ForceArray'=>false)
            sitemap  = config['build']['sitemap']
            gate_key = config['build']['query']
            @myfence    = Fence.load_fence(sitemap)
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
            puts gate
        rescue StandardError
            puts "Error 3"
        end
        path = '/var/www/dev/'+app_name+'/apps/'+app_name+'/'
        xslt = XML::XSLT.new()
        xslt.parameters = { 'link_prefix' => '/cgi-bin/ruby_pbooks.fcgi?nid=',
        'path_prefix' => '/a/dev/'+app_name+'/' }

        begin
            # Fence.get_gate(gate)
            if gate == 'x-dynamic-css'
                xslt.xml = Flow.start(app_name).to_s
                xslt.xsl = path+'templates/css/dynamic.css.xsl'
            else
                xslt.xml = Flow.start(app_name).to_s
                xslt.xsl = path+myxsl
            end
        rescue StandardError
            return "Error running script"
        end
        puts cgi.header
        puts xslt.serve()
    end

    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end