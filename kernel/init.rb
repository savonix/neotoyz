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
    
    def self.process_gate()
        
    end
    
    def self.stop()
        _stop = Time.now.to_f
        return _stop - @_start
    end

end