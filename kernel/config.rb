=begin
File:      config.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'
require 'xmlsimple'


class Config

    def initialize(config_file)
        @config = XmlSimple.xml_in(config_file)
    end

end
