# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# 15.times do
#    Book.create(
#       name: Faker::Book.title,
#       author: Faker::Book.author,
#       description: Faker::Hipster.paragraph,
#       type: "Book",
#     )
# end
#
# 15.times do
#    Album.create(
#       name: Faker::Space.constellation,
#       artist: Faker::Superhero.name,
#       description: Faker::Hipster.paragraph,
#       type: "Album",
#     )
# end

6.times do
   Movie.create(
      name: Faker::Space.nebula,
      director: Faker::GameOfThrones.character,
      description: Faker::StarWars.quote,
      type: "Movie",
    )
end
