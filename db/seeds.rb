# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

CSV.foreach('app/seeds_csvs/movies.csv') do |csv_obj|
  Movie.create(name: csv_obj[0], director: csv_obj[1], description: csv_obj[2])
end

CSV.foreach('app/seeds_csvs/books.csv') do |csv_obj|
  Book.create(name: csv_obj[0], author: csv_obj[1], description: csv_obj[2])
end

CSV.foreach('app/seeds_csvs/albums.csv') do |csv_obj|
  Album.create(name: csv_obj[0], artist: csv_obj[1], description: csv_obj[2])
end
