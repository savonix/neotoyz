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


    def self.display(gate,myxsl,app_name)
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

        output = xslt.serve()
        #output = path+myxsl
        if output
            return output
        else
            return false
        end
    end

    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end