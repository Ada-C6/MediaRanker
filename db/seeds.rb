# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

40.times do
  m = Movie.new
  m.name = Faker::Book.title # Random book title but I'll use it here for random movie titles
  m.director = Faker::Name.name
  m.description = Faker::Hipster.sentence
  m.ranking = 0

  m.save
end

40.times do
  b = Book.new
  b.name = Faker::Book.title # Random book title
  b.author = Faker::Book.author # Random author name
  b.description = Faker::Book.genre # Random book genre
  b.ranking = 0

  b.save
end

40.times do
  a = Album.new
  a.name = Faker::Hipster.word
  a.artist = Faker::Name.name
  a.description = Faker::Lorem.sentence
  a.ranking = 0

  a.save
end
