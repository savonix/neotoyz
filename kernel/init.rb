# Copyright Savonix Corporation
# Author Albert Lash
require 'xml/libxml'
require 'xml/libxslt'


class Init
    
    # starts the timer
    def self.start()

        @_start = Time.now.to_f
        return 999

    end

    def self.process_gate(gate='index')


    end


    def self.display(gate='index')
        xslt = XML::XSLT.new()
        xslt.xml = "/tmp/config_cache.xml"
        xslt.xsl = "/var/www/dev/phunkybb/apps/phunkybb/templates/xsl/login.xsl"
        output = xslt.serve()
        return output
    end

    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end