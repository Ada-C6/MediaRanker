# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  Album.create(name: Faker::Hipster.sentence(3, false, 1).split.map(&:capitalize).join(' ').gsub(/\./, ""), # Hipster sentence with each word capitalized, period stripped from end of sentence
  artist: Faker::Superhero.name,
  description: "#{Faker::Hacker.adjective.capitalize} #{Faker::Music.instrument.downcase} #{Faker::Hipster.sentence(7, true, 3).downcase}",
  ranking: rand(1..100))
end

10.times do |i|
  Movie.create(name: "#{Faker::Name.first_name} #{Faker::Hacker.ingverb.capitalize} #{Faker::Space.star}",
  director: "#{Faker::Pokemon.name} #{Faker::Name.last_name}",
  description: "#{Faker::Company.catch_phrase}. #{Faker::Hipster.sentence(7, false, 6)} #{Faker::Hacker.say_something_smart}",
  ranking: rand(1..100))
end

10.times do |i|
  Book.create(name: "#{Faker::Book.genre.split.map(&:capitalize).join(' ')} #{Faker::Superhero.power} #{Faker::Music.instrument}", # Capitalized any words in book genre
  author: Faker::Book.author,
  description: "#{Faker::Beer.hop} #{Faker::StarWars.quote}",
  ranking: rand(1..100))
end
