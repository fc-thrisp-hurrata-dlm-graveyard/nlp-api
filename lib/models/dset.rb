class Dset
  include DataMapper::Resource
  include Cleaver::Tools

  property :id,         Serial
  property :tag,        String
  property :stop_words,  Text
  #property :created_at, DateTime
  #has n, :dcollections

end
