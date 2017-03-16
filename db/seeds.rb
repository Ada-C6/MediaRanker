require 'csv'

CSV.foreach('seed_csvs/movies.csv', :headers => true) do |csv_obj|
  Movie.create(
    name: csv_obj['name'],
    director: csv_obj['director'],
    description: csv_obj['description'],
    rankings: 0)
end


CSV.foreach('seed_csvs/albums.csv', :headers => true) do |csv_obj|
  Album.create(
    name: csv_obj['name'], 
    recorded_by: csv_obj['recorded_by'], 
    description: csv_obj['description'], 
    rankings: 0)
end


CSV.foreach('seed_csvs/books.csv', :headers => true) do |csv_obj|
  Book.create(
    name: csv_obj['name'], 
    author: csv_obj['author'], 
    description: csv_obj['description'], 
    rankings: 0)
end