# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movie_names = %w(Matrix StarTrek Cats Lovelace A B C D E F G)
movie_directors = %w(Neo Picard Kitty Ada a b c d e f g)
movie_descriptions = [
  "Some people in leather dusters dodge bullets",
  "Best movie ever, just go watch it",
  "Meow meow meow meow",
  "code code code",
  "hello",
  "hello",
  "hello",
  "hello",
  "hello",
  "hello",
  "hello",

]

index = 0
movie_names.length.times do
  movie_hash ={}
  movie_hash[:title] = movie_names[index]
  movie_hash[:director] = movie_directors[index]
  movie_hash[:description] = movie_descriptions[index]
  movie_hash[:vote] = rand(0..10)
  Movie.create(movie_hash)
  index += 1
end

book_titles = %w(Vampires BookyMcBookface Faust Railways)
book_authors = %w(Buffy MrBook Goethe Thomas)
book_descriptions = [
  "How to slay monsters in California",
  "This book will make you very smart",
  "Habe nun ach Philosophie",
  "choo choo"
]

index = 0
book_titles.length.times do
  book_hash ={}
  book_hash[:title] = book_titles[index]
  book_hash[:author] = book_authors[index]
  book_hash[:description] = book_descriptions[index]
  book_hash[:vote] = rand(0..10)
  Book.create(book_hash)
  index += 1
end

album_titles = %w(Hello Scottish Best Luftballons)
album_musicians = %w(Adele Mendelssohn Chieftains Nena)
album_descriptions = [
  "Hi",
  "Awesome music; not very Scottish",
  "The best of the Chieftains.",
  "NEUNUNDNEUNZIG Luftballons"
]

index = 0
album_titles.length.times do
  album_hash ={}
  album_hash[:title] = album_titles[index]
  album_hash[:musician] = album_musicians[index]
  album_hash[:description] = album_descriptions[index]
  album_hash[:vote] = rand(0..10)
  Album.create(album_hash)
  index += 1
end
