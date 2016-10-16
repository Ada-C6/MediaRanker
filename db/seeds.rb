# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
11.times do
  Book.create(
  name: Faker::Book.title,
  author: Faker::Book.author,
  description: Faker::Company.bs,
  upvotes: rand(50)
  )
end

11.times do
  Movie.create(
  name: Faker::Book.title,
  director: Faker::Superhero.name,
  description: Faker::StarWars.quote,
  upvotes: rand(50)
  )
end

11.times do
  Album.create(
  name: Faker::Book.title,
  artist: Faker::Book.author,
  description: Faker::Hipster.sentence,
  upvotes: rand(50)
  )
end
