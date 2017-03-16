require "csv"

CSV.foreach('seeds_csvs/books.csv', :headers => true) do |csv_obj|
  Book.create( name: csv_obj['name'], author: csv_obj['author'], description: csv_obj['description'], votes: csv_obj['votes'].to_i, image: csv_obj['image'])
end

CSV.foreach('seeds_csvs/movies.csv', :headers => true) do |csv_obj|
  Movie.create( name: csv_obj['name'], director: csv_obj['director'], description: csv_obj['description'], votes: csv_obj['votes'].to_i, image: csv_obj['image'])
end

CSV.foreach('seeds_csvs/albums.csv', :headers => true) do |csv_obj|
  Album.create( name: csv_obj['name'], artist: csv_obj['artist'], description: csv_obj['description'], votes: csv_obj['votes'].to_i, image: csv_obj['image'])
end






# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
