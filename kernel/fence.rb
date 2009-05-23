=begin
File:      fence.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'

class Fence

    def self.load_fence(fence_file)

        parser = XML::Parser.file(fence_file)

    end

    def self.get_fence()
        return 1
    end

end