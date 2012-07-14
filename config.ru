
require 'toto'
require File.expand_path('../helper', __FILE__)

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/img', '/font', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,    "Achmad Mahardi"                          # blog author
  set :title,     "Achmad Mahardi: blog"                    # site title
  set :root,      "index"                                   # page to load on /
  set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                   # disqus id, or false
  set :summary,   :max => 1000, :delim => /%/                # length of article summary and delimiter
  # set :ext,       'txt'                                   # file extension for articles
  # set :cache,      28800                                  # cache duration, in seconds

  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
end

run toto


