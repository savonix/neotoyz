=begin
File:      fence.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'
require 'rubygems'
require 'nokogiri'

class Fence

    def self.load_fence(fence_file)

        #@fence_doc = XML::Reader.file(fence_file)
        @fence_doc = Nokogiri::HTML(open(fence_file))
    end

    def self.get_fence()
        return @fence_doc
    end

    def self.get_xsl(my_gate)
        myxpath = "//gate[@name=\""+my_gate+"\"]/xsl/@src"
        return @fence_doc.xpath(myxpath).to_s
    end

    def self.get_gate(my_gate)
        myxpath = "//gate[@name=\""+my_gate+"\"]/xsl/@src"
        return @fence_doc.xpath(myxpath).to_s
    end

    def self.test()
        return @fence_doc.xpath('//gate[@name="register"]')
    end

end