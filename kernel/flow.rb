=begin
File:      flow.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end
require 'xml/libxml'

class Flow

    # starts the timer
    def self.start()

        doc = XML::Document.new()
        doc.root = XML::Node.new('_R_')
        root = doc.root
        root << elem3 = XML::Node.new('runtime')
        elem3 << elem4 = XML::Node.new('link_prefix')
        elem3 << elem5 = XML::Node.new('path_prefix')
        elem4 << '/cgi-bin/ruby-test.fcgi?nid='
        elem5 << '/a/dev/phunkybb/'
        return doc

    end

end