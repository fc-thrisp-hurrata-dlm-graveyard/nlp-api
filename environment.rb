require File.dirname(__FILE__) + "/lib/cleaver_tools.rb"
require 'sinatra/base'
require 'sinatra/json'
require 'data_mapper'

configure do
  set :root, File.dirname(__FILE__)
  require_relative 'db/init'
end
