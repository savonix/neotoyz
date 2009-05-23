=begin
File:      config.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'
require 'xmlsimple'
require 'singleton'


class Config
    include Singleton

    def initialize(config_file)
        @config = XmlSimple.xml_in(config_file,{'KeyAttr' => 'mode'})
    end

end
