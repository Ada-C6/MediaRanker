require 'csv'


CSV.foreach('./seed_csvs/albums.csv', :headers => true) do |album|
  Album.create(album.to_hash)
end

CSV.foreach('./seed_csvs/books.csv', :headers => true) do |book|
  Book.create(book.to_hash)
end

CSV.foreach('./seed_csvs/movies.csv', :headers => true) do |movie|
  Movie.create(movie.to_hash)
end
