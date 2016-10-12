# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require_relative './album_info_seed.rb'
AlbumInfo::ALBUMS.each do |name, artist, description|
	Album.create(name: name, artist: artist, description: description )
end

require_relative './book_info_seed.rb'
BookInfo::BOOKS.each do |name, author, description|
	Book.create(name: name, author: author, description: description )
end

require_relative './movie_info_seed.rb'
MovieInfo::MOVIES.each do |name, director, description|
	Movie.create(name: name, director: director, description: description )
end