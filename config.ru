require 'bundler/setup'
Bundler.require(:default)
root = ::File.dirname(__FILE__)
require ::File.join( root, 'app.rb' )

map "/" do
  run Cleaver::Front
end

map "/c" do
  run Cleaver::Base
end

map "/cc" do   
  run Cleaver::Dcollection
end

#map "/cs" do
#  run Cleaver::Dset
#end

#map "/resque" do
#  run Resque::Server.new
#end
