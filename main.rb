require File.dirname(__FILE__) + "/lib/cleaver_tools.rb"
require 'sinatra/base'
require 'sinatra/json'

module Cleaver 
  class Main < Sinatra::Base
    include Cleaver::Tools
    helpers Sinatra::JSON
    #helpers Cleaver::Helpers
   
    #configure :development do
	#enable  :sessions, :clean_trace, :inline_templates
	#disable :logging, :dump_errors
	#set :static, true
	#set :public_folder, 'public'
    #end

    #enable :static, :session
    set :root, File.dirname(__FILE__)
    #set :custom_option, 'hello'
        
    #set :slim, { :format => :html5 }
    
    #set :views, "/path/to/views"
    #set :public, "/path/to/static/files"
  
    get '/', :provides => 'json' do
      json :cleaver => 'basic api tools for nlp' 
    end

    # tokenize a document
    get '/tokens', :provides => 'json' do
      td = cleaver_tokenize(params[:document])
      json :document => td
    end

    # extract sentences from a document
    post '/sentences' do
      ss = cleaver_sentence(params[:document])
      json :document => ss
    end

    # extract parts of speech
    #post '/pos' do
    #end

  end
end

