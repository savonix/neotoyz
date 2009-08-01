=begin
File:      header.action.rb
Copyright: Savonix Corporation
Author:    Albert Lash
License:   GPL v3 or later
=end

def header_action(header_key,header_value)

    puts cgi.header(header_key => header_value)

end
