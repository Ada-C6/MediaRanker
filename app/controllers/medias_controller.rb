class MediasController < ApplicationController
  def index
    @movies = Movie.all
    @movies.order(:ranking).reverse
    @books = Book.all
    @books.order(:ranking).reverse
    @albums = Album.all
    @albums.order(:ranking).reverse
  end
end
