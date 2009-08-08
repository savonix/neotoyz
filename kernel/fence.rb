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

    def initialize(fence_file)

        @fence_doc = Nokogiri::HTML(open(fence_file))

    end

    def get_fence()
        return @fence_doc
    end

    def get_xsl(my_gate)
        myxpath = "//gate[@name=\""+my_gate+"\"]/xsl/@src"
        return @fence_doc.xpath(myxpath).to_s
    end

    def get_gate(my_gate)
        myxpath = "//gate[@name=\""+my_gate+"\"]/xsl/@src"
        return @fence_doc.xpath(myxpath).to_s
    end


end