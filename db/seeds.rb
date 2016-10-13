require 'csv'

CSV.read('seed_csvs/movies.csv').each do |line|
  movie_hash = { name: line[0], director: line[1], description: line[2], ranking: line[3].to_i}
  Movie.create(movie_hash)
end

CSV.read('seed_csvs/books.csv').each do |line|
  book_hash = { name: line[0], author: line[1], description: line[2], ranking: line[3].to_i}
  Book.create(book_hash)
end

CSV.read('seed_csvs/albums.csv').each do |line|
  album_hash = { name: line[0], artist: line[1], description: line[2], ranking: line[3].to_i}
  Album.create(album_hash)
end
