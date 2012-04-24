class Dcollection
  include DataMapper::Resource
  include Cleaver::Tools

  property :id,         Serial
  property :tag,        String
  property :stop_words, Text
  #property :created_at, DateTime
  #belongs_to :dset
  has n, :documents

  def documents
    d = []
    self.documents.each do |doc|
       d << doc.raw
    end
    d
  end
 
  def bag_of_words
    TfIdf.new(self.documents)
  end

  def tf
    self.bag_of_words.tf
  end

  def idf
    self.bag_of_words.idf
  end

  def tfidf
    self.bag_of_words.tf_idf
  end

  def return_stop_words
    cleaver_tokenize(self.stop_words)
  end
  
  def iter_doc(mode)
    newdc = []
    self.documents.each do |d|
      newdc << mode.call(d)
    end
    newdc
  end

  def tokenize
    iter_doc(cleaver_tokenize)
  end
 
  def sentenceize
    iter_doc(cleaver_sentenceize)
  end

  def stem
    iter_doc(stem)
  end
  
  def unique_stem
    iter_doc(unique_stem)
  end

  def posize
    iter_doc(cleaver_pos)
  end

end
