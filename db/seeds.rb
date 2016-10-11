# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


movies = [
  "Schindler's List", "The Lord of the Rings",
  "Forrest Gump", "Life Is Beautiful",
  "Interstellar", "Psycho",
  "Raiders of the Lost Ark", "Rear Window",
  "The Lion King", "Dr. Strangelove",
  "WALL-E", "Monty Python and the Holy Grail"
]

directors =  [
  "Abracadabra",
  "Wil E Coyote",
  "Homer Jay Simpson",
  "Hilary Oss",
]

descriptions = %w(randomness insanity weirdness oddities)

movies.each do |movie|
  Movie.create(name: movie, director: directors.sample, description: descriptions.sample)
end
