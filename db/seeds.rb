# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('seed_csvs/movies.csv', :headers => true) do |csv_obj|
  Movie.create(id: csv_obj['id'].to_i, title: csv_obj['title'], director: csv_obj['director'], genre: csv_obj['genre'], description: csv_obj['description'], rank: csv_obj['rank'])
end


CSV.foreach('seed_csvs/books.csv', :headers => true) do |csv_obj|
  Book.create(id: csv_obj['id'].to_i, title: csv_obj['title'], author: csv_obj['author'], genre: csv_obj['genre'], description: csv_obj['description'], rank: csv_obj['rank'])
end


CSV.foreach('seed_csvs/songs.csv', :headers => true) do |csv_obj|
  Song.create(id: csv_obj['id'].to_i, title: csv_obj['title'], artist: csv_obj['artist'], album: csv_obj['album'], genre: csv_obj['genre'], rank: csv_obj['rank'])
end

CSV.foreach('seed_csvs/seinfeld_episodes.csv', :headers => true) do |csv_obj|
  Song.create(id: csv_obj['id'].to_i, title: csv_obj['title'], season: csv_obj['season'], episode: csv_obj['episode'], description: csv_obj['description'], rank: csv_obj['rank'])
end
