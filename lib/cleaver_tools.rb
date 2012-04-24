module Cleaver
  module Tools
    require 'jruby-opennlp'

    SENTENCE = OpenNLP::SentenceDetector.new(OpenNLP::SentenceDetector::Model.new("./lib/training_sets/en-sent.bin"))
    TOKEN = OpenNLP::Tokenizer.new(OpenNLP::Tokenizer::Model.new("./lib/training_sets/en-token.bin"))
    POS_MAX = OpenNLP::POSTagger.new(OpenNLP::POSTagger::Model.new("./lib/training_sets/en-pos-maxent.bin"))
    POS_PERP = OpenNLP::POSTagger.new(OpenNLP::POSTagger::Model.new("./lib/training_sets/en-pos-perceptron.bin"))
    LOCATION = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-location.bin")) 
    DATE = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-date.bin"))
    TIME = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-time.bin"))
    PERSON = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-person.bin"))
    ORG = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-organization.bin"))
    MONEY = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-money.bin"))
    PERCENTAGE = OpenNLP::NamedEntityDetector.new(OpenNLP::NamedEntityDetector::Model.new("./lib/training_sets/en-ner-percentage.bin"))
 
    def cleaver_tokenize(document) 
      TOKEN.tokenize(document)
    end
  
    def cleaver_sentence(document)
      SENTENCE.detect(document)
    end
 
    def cleaver_pos(document, kind=:maxent)
      case kind
      when :maxent
        POS_MAX.tag(document)
      when :perceptron
        POS_PERP.tag(document)
      end
    end

    def cleaver_location(document)
      LOCATION.detect(TOKEN.tokenize(document))
    end

    def cleaver_date(document)
      DATE.detect(TOKEN.tokenize(document))
    end

    def cleaver_time(document)
      TIME.detect(TOKEN.tokenize(document))
    end

    def cleaver_person(document)
      PERSON.detect(TOKEN.tokenize(document))
    end

    def cleaver_organization(document)
      ORG.detect(TOKEN.tokenize(document))
    end

    def cleaver_money(document)
      MONEY.detect(TOKEN.tokenize(document))
    end

    def cleaver_percentage(document)
      PERCENTAGE.detect(TOKEN.tokenize(document))
    end

  end 
end
