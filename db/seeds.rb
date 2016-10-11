# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


movies = [
  "Schindler's List", "The Lord of the Rings",
  "Forrest Gump", "Life Is Beautiful",
  "Interstellar", "Psycho",
  "Raiders of the Lost Ark", "Rear Window",
  "The Lion King", "Dr. Strangelove",
  "WALL-E", "Monty Python and the Holy Grail"
]

directors =  [
  "Abracadabra", "Wil E Coyote",
  "Homer Jay Simpson", "Hilary Oss",
]

descriptions = %w(great weird strange amazing touching funny awesome)

movies.each do |movie|
  Movie.create(name: movie, director: directors.sample, description: descriptions.sample)
end

books = [
  "To Kill a Mockingbird", "1984",
  "The Lord of the Rings", "The Great Gatsby",
  "The Lion, the Witch, and the Wardrobe", "Lord of the Flies",
  "Are You There God? It's Me, Margaret", "Things Fall Apart",
  "Beloved", "On the Road" ,
  "A Passage to India" , "Native Son"
]


authors = [
  "JRR Tolkien", "CS Lewis", "John Smith",
  "Margaret Smith", "Frances Black", "Darla Sweets"
]

books.each do |book|
  Book.create(title: book, author: authors.sample, description: descriptions.sample)
end

album_noun = %w(Rock Pop Blues Country Folk Acoustic)
album_adj = %w(Smooth Classic Upbeat)

artist_adj = %w(Green Blue Gray Pink Purple Rainbow Happy Hoopy Sad Quiet Loud)
artist_noun = %w(Lightning Rain Thunder Mountain Blizzard Sea)

album_noun.each do |noun|
  name = "#{album_adj.sample} #{noun}"
  artist = "#{artist_adj.sample} #{artist_noun.sample}"
  Album.create(name: name, artist: artist, description: descriptions.sample)
end
