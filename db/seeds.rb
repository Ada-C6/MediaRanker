# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |album|
  Album.create(title: Faker::Book.title, num_votes: rand(100), artist: Faker::Name.name, description: Faker::Lorem.paragraph)
end

20.times do |book|
  Book.create(title: Faker::Book.title, num_votes: rand(100), author: Faker::Name.name, description: Faker::Lorem.paragraph)
end

20.times do |movie|
  Movie.create(title: Faker::Book.title, num_votes: rand(100), director: Faker::Name.name, description: Faker::Lorem.paragraph)
end
