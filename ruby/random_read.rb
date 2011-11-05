=begin
random data reader
=end

require 'mongo'

db = Mongo::Connection.new('localhost').db('stressRuby')
collection = db.collection('data')

loop do
  num = Random.rand(1_000_000)
  docs = collection.find( num: num )
  puts "couldn't find document with num = #{num}" if docs.count == 0
end

