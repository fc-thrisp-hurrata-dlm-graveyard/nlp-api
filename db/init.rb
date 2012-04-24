configure do
  DataMapper::Logger.new($stdout, :debug)
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib/models")
  Dir.glob("#{File.dirname(__FILE__)}/lib/models/*.rb").each { |model| require model }
  DataMapper.finalize
  DataMapper.setup(:default, (ENV["DATABASE_URL"] || "sqlite3:///#{File.expand_path(File.dirname(__FILE__)+"/db")}/#{Sinatra::Base.environment}.db"))
  DataMapper.auto_upgrade!
end



