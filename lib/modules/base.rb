module Cleaver 
  class Base < Sinatra::Base
    include Cleaver::Tools
    helpers Sinatra::JSON

    #configure :production do
	  #
    #end

    # /c
    get '/', :provides => 'json' do
      json :cleaver => 'basic api tools for nlp' 
    end

    # /c/document/tokens
    # returns a tokenized document
    post '/document/tokens', :provides => 'json' do
      td = cleaver_tokenize(params[:document])
      td = td.uniq if params[:unique]
      json :document => td
    end

    # /c/document/stem
    # returns a tokenized and stemmed document 
    post '/document/stem', :provides => 'json' do
      ntd = []
      td = cleaver_tokenize(params[:document])
      td.each do |t|
        ntd << Stemmer::stem_word(t)
      end
      ntd = ntd.uniq if params[:unique]
      json :document => ntd
    end 

    # /c/document/sentences
    # returns an array of sentences from a document
    post '/document/sentences' do
      ss = cleaver_sentence(params[:document])
      json :document => ss
    end

    # /c/document/pos
    # extract parts of speech in a document, returns new tagged document
    post '/document/pos' do
      dpos = cleaver_pos(params[:document])
      json :document => dpos
    end

    # /c/document/entities
    # extract some basic entities from the document
    post '/document/entities' do
      document = params[:document]
      dperson = cleaver_person(document)
      dorganization = cleaver_organization(document)
      dplace = cleaver_location(document)
      returned = {person:dperson, organization:dorganization, place:dplace}
      json :document => returned
    end

  end


end

