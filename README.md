NEOTOYZ
=======

Summary
-------
Neotoyz is a web application framework written in Ruby, based upon the design
of Nexista.


Status
------
The code is alpha and incomplete.



Usage
-----
NeoToyz is meant to run as a fastcgi application, so there are two primary points of interest:

# Initial configuration
# Ongoing memory and process management


### Configuration
First thing to be aware of is that NeoToyz applications are configured by an XML 
file, but NeoToyz needs to know where that file is. It can be specified in the FastCGI
loader, the webserver as an environmental variable, or via Ruby logic based upon
other environment variables such as SERVER_NAME or PATH_INFO.


### Ongoing Management



Goals
-----
* Build an XML/XSL FastCGI web publishing toolkit in Ruby.
* Interface with Ragel for.... ?

Requirements
------------
* Ruby
* http://xml-simple.rubyforge.org/
* http://libxml.rubyforge.org/
* Hpricot / Nokogiri


Configuration
-------------
Apache2:
<pre>
<![CDATA[
<Location /cgi-bin/ruby-test.fcgi>
    AuthType Digest
    AuthName "savonix"
    AuthDigestDomain /
    AuthUserFile /var/www/etc/savonix.passwd
    Require valid-user

    SetEnv app_name phunkybb
    SetEnv loc_conf 
</Location>
]]>
</pre>
NGINX:
<pre>
location ~ ^/cgi-bin/ruby-test.fcgi {
    expires 1;
    fastcgi_pass   unix:/tmp/neotoyz.fcgi;
    fastcgi_param  loc_conf         "/var/www/dev/phunkybb/config/config.xml"
    fastcgi_param  DOCUMENT_ROOT     $document_root;
    fastcgi_param  SCRIPT_FILENAME   $document_root$fastcgi_script_name;
    fastcgi_param  SCRIPT_NAME       $fastcgi_script_name;
    fastcgi_param  QUERY_STRING      $query_string;
    fastcgi_param  REQUEST_METHOD    $request_method;
    fastcgi_param  CONTENT_TYPE      $content_type;
    fastcgi_param  CONTENT_LENGTH    $content_length;
}
</pre>

License
-------
GPL v3 or later.



