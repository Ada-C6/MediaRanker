# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  Book.create(
  title: Faker::Book.title,
  by: Faker::Book.author,
  description: Faker::ChuckNorris.fact,
  ranked: rand(50))
end

5.times do
  Movie.create(
  title: Faker::Book.title,
  by: Faker::Book.author,
  description: Faker::ChuckNorris.fact,
  ranked: rand(50))
end

5.times do
  Album.create(
  title: Faker::Book.title,
  by: Faker::Book.author,
  description: Faker::ChuckNorris.fact,
  ranked: rand(50))
end
