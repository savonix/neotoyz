=begin
File:      fence.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'

class Fence

    def self.load_fence(fence_file)

        @fence_doc = XML::Reader.file(fence_file)

    end

    def self.get_fence()
        return @fence_doc
    end

end