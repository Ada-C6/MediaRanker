class MediarankersController < ApplicationController
  def index
    @books = Book.order(:votes).reverse_order
    @albums = Album.order(:votes).reverse_order
    @movies = Movie.order(:votes).reverse_order
  end
end
