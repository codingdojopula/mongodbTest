=begin
batch insert MongoDB test
insert a number of records into a new dabatase/collection
use batch insert method
doesn't use any indexing

results:
  equipment:
    Ubuntu 11.10
    Mongo 2.0
    HP 8540 P notebook
    Intel i5 M450 @ 2.53GHz x 4

  for 1.000.000 records, 1.000 x 1.000 or 100 x 10.000 batches
  ~ 1.5min
  ~ 1.5 GB HD space
  ~ 11.500 records/sec

  for 1.000.000 records, 10.000 x 100 batches
  ~ 1min
  ~ 1.5 GB HD space
  ~ 16.500 records/sec
=end

require 'mongo'

db = Mongo::Connection.new('localhost').db('stressRuby')
collection = db.collection('data')
collection.remove({})

content = "My money's in that office, right? If she start giving me some bullshit about it ain't there, and we got to go someplace else and get it, I'm gonna shoot you in the head then and there. Then I'm gonna shoot that bitch in the kneecaps, find out where my goddamn money is. She gonna tell me too. Hey, look at me when I'm talking to you, motherfucker. You listen: we go in there, and that nigga Winston or anybody else is in there, you the first motherfucker to get shot. You understand?"

10_000.times do |batch|
  docs = []
  100.times do |i|
    docs << { batch: batch, num: i, title: "Stress document #{i}, batch #{batch}", description: content, coordinates: { lat: Random.rand(180), lng: Random.rand(180) } }
  end
  collection.insert(docs)
end

