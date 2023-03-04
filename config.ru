require 'rack/cache'

# Config
root = File.expand_path(File.dirname(__FILE__))
cache = "#{root}/cache"
metastore = "file:#{cache}/rack/meta"
entitystore = "file:#{cache}/rack/body"

# Middlewares used
use Rack::Cache, :verbose => true, :metastore => metastore, :entitystore => entitystore
use Rack::ContentLength
use Rack::ContentType
#use Rack::Lint
use Rack::Static, :urls => [""], :root => @root, :index => "index.html"

# Application
app = proc do |env|
  [ 200, {'Content-Type' => 'text/plain'}, File.open('index.html', File::RDONLY) ]
end

run app
