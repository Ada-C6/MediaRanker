# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'

CSV.foreach('seed_csvs/movies.csv') do |csv_obj|
  Movie.create(id: csv_obj[0].to_i, name: csv_obj[1], director: csv_obj[2], description: csv_obj[3])
end

CSV.foreach('seed_csvs/books.csv') do |csv_obj|
  Movie.create(id: csv_obj[0].to_i, name: csv_obj[1], author: csv_obj[2], description: csv_obj[3])
end
