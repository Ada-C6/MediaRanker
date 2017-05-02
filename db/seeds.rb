# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'

CSV.foreach('seed_csvs/albums.csv', :headers => false) do |song|
  Medium.create(category: "Song", name: song[0], auteur: 'Beyonce', score: rand(1-100))
end

CSV.foreach('seed_csvs/books.csv', :headers => false) do |book|
  Medium.create(category: "Book", name: book[0], auteur: 'Dr. Seuss', score: rand(1-100))
end

CSV.foreach('seed_csvs/movies.csv', :headers => false) do |movie|
  Medium.create(category: "Movie", name: movie[0], auteur: 'Alfred Hitchcock', score: rand(1-100))
end
