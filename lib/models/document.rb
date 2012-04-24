class Document
  include DataMapper::Resource
  include Cleaver::Tools

  property :id,         Serial
  property :tag,        String
  property :raw,        Text
  #property :created_at, DateTime
  belongs_to :dcollection

  def tokenize
    cleaver_tokenize(self.raw)
  end
 
  def sentenceize
    cleaver_sentence(self.raw)
  end

  def stem
    ntd = []
    td = cleaver_tokenize(self.raw)
    td.each do |t|
      ntd << Stemmer::stem_word(t)
    end
    ntd
  end
  
  def unique_stem
    ntd = self.stem
    ntd = ntd.uniq
  end

  def posize
    cleaver_pos(self.raw)
  end

end
