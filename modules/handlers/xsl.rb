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
    xslt.parameters = {
        'link_prefix' => '/cgi-bin/ruby-test.fcgi?nid=',
        'path_prefix' => '/a/dev/pbooks/'
    }

    xslt.xml = Flow.start().to_s
    xslt.xsl = path+myxsl

    return xslt.serve()

}
