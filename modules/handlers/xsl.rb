=begin
File:      xsl.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end
require 'xml/libxml'
require 'xml/libxslt'



def self.process(xsl_file=nil) {
        xslt = XML::XSLT.new()

}