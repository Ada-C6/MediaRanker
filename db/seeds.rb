# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
album_names = %w(Jazz Rock Hits Country Hip-Hop Blues Instrumentals Soundtracks Metal 80s 90s).shuffle
artists = %w(Matchbox20 DepecheMode Live P!nk KellyClarkson Creed Phish Tool Korn Train).shuffle

artists.length.times do |i|
  album_hash = { name: "Best of #{ album_names.pop }", artist: "#{ artists.pop }", ranking: rand(0..100) }
  Album.create(album_hash)
end

book_names = %w(Games UXDesign Cats Dogs Computers Archery Hacking Sailing Fishing Comics ).shuffle
authors = %w(Kim Karie Tom Steph Chris John Max Joe Bob Bill).shuffle

authors.length.times do |i|
  book_hash = { name: "Best of #{ book_names.pop }", author: "#{ authors.pop }", ranking: rand(0..100) }
  Book.create(book_hash)
end

movie_names = %w(Scream Vampires Cats Dogs Notebook Jaws Fear Tombstone Splash Alien).shuffle
directors = %w(Josh Tara Kat Juha Jason Steve Jeff Kevin Anne Marie).shuffle

directors.length.times do |i|
  director_hash = { name: "#{ movie_names.pop }", director: "#{ directors.pop }", ranking: rand(0..100) }
  Movie.create(director_hash)
end
