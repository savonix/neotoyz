=begin
File:      fence.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

require 'xml/libxml'

class Fence

    def self.load_fence(fence_file)

        file = File.new(fence_file, "r")
        while (line = file.gets)

        end
        file.close
    end
end