class MediasController < ApplicationController
  def index
    @movies = Movie.all.order(:rank).reverse
    @books = Book.all.order(:rank).reverse
    @albums = Album.all.order(:rank).reverse
  end
end
