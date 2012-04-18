require 'bundler/setup'

Bundler.require(:default)

require File.dirname(__FILE__) + "/main.rb"
#require File.dirname(__FILE__) + "/cleaverapi.rb"

map "/" do
  run Cleaver::Main
  #run Cleaver::API
end
