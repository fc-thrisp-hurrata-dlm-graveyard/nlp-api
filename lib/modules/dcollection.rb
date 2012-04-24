module Cleaver 
  class Dcollection < Sinatra::Base
    include Cleaver::Tools
    helpers Sinatra::JSON
   
    #configure :production do
	  #
    #end

    # /cc
    get '/', :provides => 'json' do
      json :cleaver_dcollection => 'collection of documents operations: create, add to/subtract from, and modify collections'
    end

    # provide a document, if no collection one is created and document is added 
    # otherwise adds document to a collection
    # :dcid   - document collection tag
    # :doctag - document tag
    # :raw    - the raw document
    # Same,
    # new       POST:/cc/isthiscollectiontaken {:doctag => 'my_tag', :raw => 'My document herp derp'}
    # existing  POST:/cc/isthiscollectiontaken {:doctag => 'my_tag', :raw => 'My document herp derp'}
    post '/:dcid', :provides => 'json' do
      dc = Dcollection.first(:tag => params[:dcid])
      if dc
        new_d = dc.documents.create(:tag => params[:doctag], :raw => params[:doc])
        json :new_document => new_d if new_d
      else
        new_c = Dcollection.create(:tag => params[:dcid])
        new_d = new_c.documents.create(:tag => params[:doctag], :raw => params[:doc])
        json :new_collection => "#{new_c.tag} created with #{new_d.tag}" if new_c
      end
    end

    # returns a set of documents in a collection
    # params mode=
    # /cc/isthiscollectiontaken?mode=(raw,tokenize,sentenceize,stem,unique_stem,pos) default raw
    get '/:dcid', :provides => 'json' do
      dcollection = Dcollection.first(:tag => params[:dcid])
      if params[:mode]
        mode = params[:mode].to_sym
      else
        mode = :raw
      end
      dcollection_out = dcollection.send(mode)
      json mode => dcollection_out
    end

    # returns a document from a collection
    # params mode=
    # /cc/isthiscollectiontaken/document/my_tag?mode=(raw,tokenize,sentenceize,stem,unique_stem,pos) default raw
    get '/:dcid/document/:doctag', :provides => 'json' do
      doc = Document.first(:tag => params[:doctag])
      if params[:mode]
        mode = params[:mode].to_sym
      else
        mode = :raw
      end
      doc_out = doc.send(mode)
      json mode => doc_out
    end

  end
end
