# Copyright Savonix Corporation
# Author Albert Lash
require 'dbi'

begin
  # connect to the MySQL server
  dbh = DBI.connect("DBI:Mysql:"+$dbconfig['database']+":"+$dbconfig['hostname'], $dbconfig["username"], $dbconfig['password'])
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code: #{e.err}"
  puts "Error message: #{e.errstr}"
end

sth = dbh.prepare(sql)

begin
  sth.execute()
  sth.fetch do |row|

  end
rescue DBI::DatabaseError => e
  puts "An error occurred"
  puts "Error code: #{e.err}"
  puts "Error message: #{e.errstr}"
  dbh.disconnect if dbh
end

