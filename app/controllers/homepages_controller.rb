class HomepagesController < ApplicationController
  def index

    movies = Movie.order(:rank).reverse_order # Get a list of all of the movies ordered by rank (high rank = more votes, so I'm getting the list in reverse_order)
    books = Book.order(:rank).reverse_order
    albums = Album.order(:rank).reverse_order
    @mediaTypes = [movies, books, albums]
  end

  def show
    
  end
end
