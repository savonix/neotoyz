=begin
File:      init.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'
require 'xml/libxslt'

require '/var/www/dev/neotoyz/kernel/flow'

class Init
    
    # starts the timer
    def self.start()

        @_start = Time.now.to_f
        return 999

    end

    def self.process_gate(gate='index')


    end


    def self.display(gate)
        xslt = XML::XSLT.new()
        xslt.parameters = { "link_prefix" => "/cgi-bin/ruby-test.fcgi?nid=",
        "path_prefix" => "/a/dev/phunkybb/" }

        if gate == 'dynamic-css'
            xslt.xml = "/var/www/dev/phunkybb/apps/phunkybb/data/xml/beach_ball.xml"
            xslt.xsl = "/var/www/dev/phunkybb/apps/phunkybb/templates/css/dynamic.css.xsl"
        else
            xslt.xml = Flow.start().to_s
            xslt.xsl = "/var/www/dev/phunkybb/apps/phunkybb/templates/xsl/login.xsl"
        end

        output = xslt.serve()
        return output
    end

    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end