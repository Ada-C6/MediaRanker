# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [
  {name: "Abbey Road", artist: "The Beatles", rank: 1},
  {name: "Love and Theft", artist: "Bob Dylan", rank: 2},
  {name: "The Wall", artist: "Pink Floyd", rank: 3},
]

albums.each do | album_hash |
  Album.create(album_hash)
end


books = [
  {name: "Harry Potter", author: "J.K. Rowling", rank: 1},
  {name: "What would I do without coding", author: "Anything", rank: 2},
  {name: "The Meaning of Life", author: "Ape", rank: 3},
]

books.each do | book_hash |
  Book.create(book_hash)
end


movies = [
  {name: "The Mighty Boosh", director: "England", rank: 1},
  {name: "The Nightmare Before Christmas", director: "Henry Selick", rank: 2},
  {name: "The Yellow Submarine", director: "The Beatles", rank: 3},
]

movies.each do | movie_hash |
  Movie.create(movie_hash)
end
