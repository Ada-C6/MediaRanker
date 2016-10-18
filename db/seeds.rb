# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

  CSV.foreach ('seed_csvs/albums.csv') do |csv_obj|
    Album.create(title: csv_obj[1], artist: csv_obj[2], rank: csv_obj[3], synopsis: csv_obj[4])
  end

  CSV.foreach ('seed_csvs/books.csv') do |csv_obj|
    Book.create(title: csv_obj[1], author: csv_obj[2], rank: csv_obj[3], synopsis: csv_obj[4])
  end
  
  CSV.foreach ('seed_csvs/movies.csv') do |csv_obj|
    Movie.create(title: csv_obj[1], year: csv_obj[2], rank: csv_obj[3], synopsis: csv_obj[4])
  end
