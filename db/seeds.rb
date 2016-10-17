# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  {name: "Shawshank Redemption" , director: "Frank Darabont" , description: "1994 American drama film", ranked: rand(1..15) },
  {name: "Titanic" , director: "James Cameron" , description: "1997 American epic romance-disaster film", ranked: rand(1..15) },
  {name: "Avatar" , director: "James Cameron", description: "009 American[7][8] epic science fiction film" , ranked: rand(1..15)},
  {name: "Star Wars: The Force Awakens", director: "J. J. Abrams" , description: "2015 American space opera epic film" , ranked: rand(1..15) },
  {name: "Jurassic World" , director: "Colin Trevorrow", description: "2015 American science fiction adventure film and the fourth installment of the Jurassic Park series" , ranked: rand(1..15) },
  {name: "The Avengers" , director: "Joss Whedon", description: "2012 American superhero film based on the Marvel Comics superhero team" , ranked: rand(1..15) },
  {name: "Furious 7", director: "James Wan" , description: "2015 American action film", ranked: rand(1..15) },
  {name: "Avengers: Age of Ultron" , director: "Joss Whedon", description: "2015 American superhero film based on the Marvel Comics superhero team the Avengers", ranked: rand(1..15) },
  {name: "Harry Potter and the Deathly Hallows – Part 2" , director: "David Yates", description: "2011 British fantasy film" , ranked: rand(1..15) },
  {name: "Frozen" , director: "Chris Buck", description: "2013 American 3D computer-animated musical fantasy comedy-drama film", ranked: rand(1..15) },
  {name: "Iron Man 3", director: "Shane Black" , description: "2013 American[4] superhero film featuring the Marvel Comics character Iron Man", ranked: rand(1..15) },
  {name: "Minions", director: "Pierre Coffin", description: "2015 American 3D computer-animated comedy film", ranked: rand(1..15) },
  {name: "Transformers: Dark of the Moon", director: "Michael Bay", description: "2011 American science fiction action film" , ranked: rand(1..15) },
  {name: "The Lord of the Rings: The Return of the King" , director: "Peter Jackson", description: "2003 epic high fantasy adventure film" , ranked: rand(1..15) },
  {name: "Skyfall", director: "Sam Mendes" , description: "23rd James Bond film" , ranked: rand(1..15) }
  ]

movies.each do |movie_hash|
  Movie.create(movie_hash)
end

# I got tired of googling real things and started making up things.
book_ids = (1..15).to_a
book_name = "Pikachu"
book_author = "Trainer"
book_description = %w(Awesome Cool Fantastic Kind Lovely Handsome Pretty Smart Strategic Clever Foxy Experienced Shrewd Patient Observant).shuffle

(0...15).each do |i|
  name = book_description[i] + " " + book_name
  author = book_author + "_" + book_ids[i].to_s
  book_hash = { name: name, author: author, description: "#{book_description[i]}", ranked: rand(1..15)}
  Book.create(book_hash)
end

# Being lazy again...
album_ids = (1..15).to_a
album_name = "Ponyta"
album_artist = "Rider"
album_description = %w(Awesome Cool Fantastic Kind Lovely Handsome Pretty Smart Strategic Clever Foxy Experienced Shrewd Patient Observant).shuffle

(0...15).each do |i|
  name = album_description[i] + " " + album_name
  artist = album_artist + "_" + album_ids[i].to_s
  album_hash = { name: name, artist: artist, description: "#{album_description[i]}", ranked: rand(1..15)}
  Album.create(album_hash)
end
