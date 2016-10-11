# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
album_names = %w(Jazz Rock Hits Country Hip-Hop).shuffle
artists = %w(Matchbox20 DepecheMode TheCure P!nk KellyClarkson).shuffle

artists.length.times do |i|
  album_hash = { name: "Best of #{ album_names.pop }", artist: "#{ artists.pop }" }
  Album.create(album_hash)
end

book_names = %w(Maps UXDesign Cats Dogs Computers).shuffle
authors = %w(Kim Karie Tom Steph Chris).shuffle

authors.length.times do |i|
  book_hash = { name: "Best of #{ book_names.pop }", author: "#{ authors.pop }" }
  Book.create(book_hash)
end

movie_names = %w(Scream Blood Cats Dogs Notebook).shuffle
directors = %w(Josh Tara Kat Juha Jason).shuffle

directors.length.times do |i|
  director_hash = { name: "#{ movie_names.pop }", director: "#{ directors.pop }" }
  Movie.create(director_hash)
end
