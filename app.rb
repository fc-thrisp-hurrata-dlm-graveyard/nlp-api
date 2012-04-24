require 'sinatra'
require 'data_mapper'
require File.join(File.dirname(__FILE__), 'environment')
require File.join( File.dirname(__FILE__), '/lib/modules/base.rb' )
require File.join( File.dirname(__FILE__), '/lib/modules/dcollection.rb' )
module Cleaver
  class Front < Sinatra::Base
    get "/" do
      #say hi
    end
  end
end
