module Cleaver
  module Tools
    require 'jruby-opennlp'

    SENTENCE = OpenNLP::SentenceDetector.new(OpenNLP::SentenceDetector::Model.new("./lib/en-sent.bin"))
    TOKEN = OpenNLP::Tokenizer.new(OpenNLP::Tokenizer::Model.new("./lib/en-token.bin"))
    #POS_MAX = OpenNLP::Pos::Model.new("./lib/en-pos-maxent.bin")
    #POS_PERP = OpenNLP::Pos::Model.new("./lib/en-pos-perceptron.bin")
    #LOCATION = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-location.bin") 
    #DATE = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-date.bin")
    #TIME = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-time.bin")
    #PERSON = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-person.bin")
    #ORG = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-organization.bin")
    #MONEY = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-money.bin")
    #PERCENTAGE = OpenNLP::NamedEntityDetector::Model.new("./lib/en-ner-percentage.bin")

    def cleaver_tokenize(document)
      TOKEN.tokenize(document)
    end
  
    def cleaver_sentence(document)
      SENTENCE.detect(document)
    end
 
    #def cleaver_location
    #end

    #def cleaver_date
    #end

    #def cleaver_time
    #end

    #def cleaver_person
    #end

    #def cleaver_organization
    #end

    #def cleaver_money
    #end

    #def cleaver_percentage
    #end

  end 
end
