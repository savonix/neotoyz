=begin
File:      config.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'

class Config

    def self.load_config(config_file)

        file = File.new(config_file, "r")
        while (line = file.gets)

        end
        file.close
    end
end
