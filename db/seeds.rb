# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


15.times do
  Album.create(name: Faker::Superhero.power,
          creator: Faker::Pokemon.name,
          description: Faker::ChuckNorris.fact,
          votes: 0)
end

15.times do
  Book.create(name: Faker::Book.title,
          creator: Faker::Name.name_with_middle,
          description: Faker::ChuckNorris.fact,
          votes: 0)
end

15.times do
  Movie.create(name: Faker::Space.nebula,
          creator: Faker::StarWars.character,
          description: Faker::Hipster.sentence,
          votes: 0)
end
